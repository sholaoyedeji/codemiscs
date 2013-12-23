#! /usr/bin/env bash

# rf (Read Feed): Feed Reader, read feeds from any source
# Copyright (C) 2012-2013 Juan Manuel Borges Caño
# The desire for a fast, command line, non interactive, rich news feed reader encouraged this command.

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

declare -Ag rf_rss_feeds
declare -Ag rf_atom_feeds

# The setup helper.
function rf_setup
{
	[[ -z "$1" ]] && cmd_error "feed not specified"

	rf_feedurl="${rf_rss_feeds[$1]}"
	if [[ -z "$rf_feedurl" ]]
	then
		rf_feedurl="${rf_atom_feeds[$1]}"
		rf_type="atom"
	else
		rf_type="rss"
	fi
	[[ -z "$rf_feedurl" ]] && cmd_error "unknown feed"

	if [[ -f "$HOME/.rf/$1.rfd" ]] && (( $(date "+%s") - $(stat -c "%Y" "$HOME/.rf/$1.rfd") < 60 * "$rf_time" ))
	then
		rf_data="$(cat "$HOME/.rf/$1.rfd")"
	else
		rf_data="$(curl -s --connect-timeout 300 --max-time 300 -A "Mozilla/5.0" -L "$rf_feedurl")" && if [[ -d "$HOME/.rf" ]]; then printf "%s\n" "$rf_data" > "$HOME/.rf/$1.rfd"; fi
	fi

	rf_feedns="$(printf "%s\n" "$rf_data" | grep -m 1 -o 'xmlns="[^"]*"' | cut -d'"' -f2)"
}

# The title helper.
function rf_mode_title
{
	if [[ -z "$rf_feedns" ]]
	then
		if [[ "$rf_type" == "rss" ]]
		then
			rf_output="$(printf "%s\n" "$rf_data" | xmlstarlet sel -t -m "//item" -v "$rf_mode" -n)"
		else
			rf_output="$(printf "%s\n" "$rf_data" | xmlstarlet sel -t -m "//entry" -v "$rf_mode" -n)"
		fi
	else
		if [[ "$rf_type" == "rss" ]]
		then
			rf_output="$(printf "%s\n" "$rf_data" | xmlstarlet sel -N my="$rf_feedns" -t -m "//my:item" -v "my:$rf_mode" -n)"
		else
			rf_output="$(printf "%s\n" "$rf_data" | xmlstarlet sel -N my="$rf_feedns" -t -m "//my:entry" -v "my:$rf_mode" -n)"
		fi
	fi
	rf_i=1
	while (( $rf_items < 0 || $rf_i <= $rf_items )) && read -r rf_line 
	do
		printf "[$rf_i] %s\n" "$rf_line" | lynx -assume-charset="UTF-8" -dump -nolist -stdin | lynx -assume-charset="UTF-8" -dump -nolist -stdin | sed -e 's/^[[:space:]][[:space:]][[:space:]]//' -e '/^$/d' | fmt --width 2048
		(( rf_i++ ))
	done < <(printf "%s\n" "$rf_output")
}

# The description helper.
function rf_mode_description
{
	if [[ -z "$rf_feedns" ]]
	then
		if [[ "$rf_type" == "rss" ]]
		then
			rf_output="$(printf "%s\n" "$rf_data" | xmlstarlet sel -t -m "//item[$rf_item]" -v "$rf_mode")"
		else
			rf_output="$(printf "%s\n" "$rf_data" | xmlstarlet sel -t -m "//entry[$rf_item]" -v "content")"
		fi
	else
		if [[ "$rf_type" == "rss" ]]
		then
			rf_output="$(printf "%s\n" "$rf_data" | xmlstarlet sel -N my="$rf_feedns" -t -m "//my:item[$rf_item]" -v "my:$rf_mode")"
		else
			rf_output="$(printf "%s\n" "$rf_data" | xmlstarlet sel -N my="$rf_feedns" -t -m "//my:entry[$rf_item]" -v "my:content")"
		fi
	fi
	printf "%s\n" "$rf_output" | lynx -assume-charset="UTF-8" -dump -nolist -stdin | lynx -assume-charset="UTF-8" -dump -nolist -stdin | sed -e 's/^[[:space:]][[:space:]][[:space:]]//' -e '/^$/d' | fmt --width 2048
}

# The link helper.
function rf_mode_link
{
	if [[ -z "$rf_feedns" ]]
	then
		if [[ "$rf_type" == "rss" ]]
		then
			rf_output="$(printf "%s\n" "$rf_data" | xmlstarlet sel -t -m "//item[$rf_item]" -v "$rf_mode")"
		else
			rf_output="$(printf "%s\n" "$rf_data" | xmlstarlet sel -t -m "//entry[$rf_item]" -v "$rf_mode/@href")"
		fi
	else
		if [[ "$rf_type" == "rss" ]]
		then
			rf_output="$(printf "%s\n" "$rf_data" | xmlstarlet sel -N my="$rf_feedns" -t -m "//my:item[$rf_item]" -v "my:$rf_mode")"
		else
			rf_output="$(printf "%s\n" "$rf_data" | xmlstarlet sel -N my="$rf_feedns" -t -m "//my:entry[$rf_item]" -v "my:$rf_mode/@href")"
		fi
	fi
	printf "%s\n" "$rf_output"
}

# The --list option.
function rf_list
{
	for rf_feed in "${!rf_rss_feeds[@]}" "${!rf_atom_feeds[@]}"
	do
		printf "%s\n" "$rf_feed"
	done | sort
	exit 0
}

# The --title option.
function rf_title
{
	rf_mode="title"	
	if [[ -n "$1" ]]
	then
		rf_items="$1"
	fi
}

# The --description option.
function rf_description
{
	rf_mode="description"	
	rf_item="$1"
}

# The --link option.
function rf_link
{
	rf_mode="link"
	rf_item="$1"
}

# The --cache option.
function rf_cache
{
	rf_time="$1"
}

# ... and rf, the program itself.

# The cmd init function
function rf_init
{
	[[ ! -d "$HOME/.rf" ]] && mkdir "$HOME/.rf"
	[[ ! -f "$HOME/.rf/feeds" ]] && cp "$cmd_datadir/feeds" "$HOME/.rf/feeds"
	source "$HOME/.rf/feeds"
	rf_time="30"
	rf_mode="title"
	rf_items="-1"
	rf_item="0"
	rf_type=""
}

# The cmd main function
function rf_main
{
	rf_setup "$@"

	case "$rf_mode" in
		"title") rf_mode_title ;;
		"description") rf_mode_description ;;
		"link") rf_mode_link ;;
	esac
}

# The cmd fields
cmd="rf"
cmd_name="read feed"
cmd_description="Feed Reader"
cmd_explanation="read feed is a command that reads feeds from any source. rf uses the feed of a site to manage it with a command line interface."
cmd_version="[@]pkgversion[@]"
cmd_author="[@]pkgauthor[@]"
cmd_homepage="[@]pkghomepage[@]"
cmd_blog="[@]pkgblog[@]"
cmd_email="[@]pkgemail[@]"
cmd_usage="$cmd [OPTIONS] [FEED]"
cmd_examples=("$cmd -t linux")
cmd_options=("/l/list/list the available feeds/rf_list/" "/t::/title::/set title mode/rf_title/ITEMS/" "/d:/description:/set description mode/rf_description/ITEM/" "/n:/link:/set link mode/rf_link/ITEM/" "/c:/cache:/set cache time/rf_cache/MINUTES/")
cmd_extrahelp="On no config creates ~/.$cmd directory and adds the default feeds to the ~/.rf/feeds file. "$'\n'"With no option, use title mode. With no items, show all. With no cache time, use 30 minutes."
cmd_extranotes="For more information, check man documentation."
cmd_init="rf_init"
cmd_main="rf_main"

cmd_datadir="[@]pkgdatadir[@]/$cmd"

# The cmd environment
source "[@]pkgdatadir[@]/cmd.sh"
