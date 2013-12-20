#! /usr/bin/env bash

# typewriter: slowed down echo
# Copyright (C) 2013 Juan Manuel Borges Caño
# Liking the effect lot of times, and being useful for demos (Gif, YouTube), Dave W. Capella slowcat.c finally inspired a ready to use, simple, smart, elegant, fast and efficient, one line solution.
# TODO: add 'key typing' sound switch

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

shopt -s extglob

# The --charsecs option
function tw_option_charsecs
{
	tw_charsecs="$1"
}

# The --linesecs option
function tw_option_linesecs
{
	tw_linesecs="$1"
}

# The --sound option
function tw_option_sound
{
	tw_sound="0"
}

# ... and typewriter, the program itself

# The cmd init function
function tw_init
{
	tw_charsecs="0.05"
	tw_linesecs="0.5"
	tw_sound="1"
}

# The cmd main function
function tw_main
{
	# December 16th, 2013, Juan Manuel Borges Caño

	if [[ $tw_sound == 0 ]]
	then
		trap 'kill $sound 2>/dev/null; wait $sound 2>/dev/null' EXIT
		ogg123 -r -q "$cmd_datadir/typewriter.ogg" 2>/dev/null & 
		sound=$!
	fi

	while IFS="" read -r line
	do
		printf "%s" "$line" | while IFS="" read -r -n 1 char
		do
			printf "%s" "$char"
			sleep "$tw_charsecs"
		done
		printf "\n"
		sleep "$tw_linesecs"
	done

	exit 0
}

# The cmd fields
cmd="typewriter"
cmd_name="typewriter"
cmd_description="Slowed Down Echoer"
cmd_explanation="typewriter is a program that echoes slowly. typewriter reads standard input and writes slowed down to standard output."
cmd_version="[@]pkgversion[@]"
cmd_author="[@]pkgauthor[@]"
cmd_homepage="[@]pkghomepage[@]"
cmd_blog="[@]pkgblog[@]"
cmd_email="[@]pkgemail[@]"
cmd_usage="$cmd [OPTIONS]"
cmd_examples=("echo type this | $cmd ")
cmd_options=("/c:/charsecs:/set seconds per char/tw_option_charsecs/CHARSECS/" "/l:/linesecs:/set seconds per line/tw_option_linesecs/LINESECS/")
if (( "[@]pkghaveogg123[@]" == "0" ))
then
	cmd_options=("${cmd_options[@]}" "/s/sound/play a keyboard typewriting sound/tw_option_sound/")
fi
cmd_extrahelp="Nice for demos."
cmd_extranotes="For more information, check man documentation."
cmd_init="tw_init"
cmd_main="tw_main"

cmd_datadir="[@]pkgdatadir[@]"

# The cmd environment
source "$cmd_datadir/cmd.sh"
