#! /usr/bin/env bash

#  _________________________________________________________________________
# /\                                                                        \
# \_|       ___        __                            _   _                  |
#   |      |_ _|_ __  / _| ___  _ __ _ __ ___   __ _| |_(_) ___  _ __       |
#   |       | || '_ \| |_ / _ \| '__| '_ ` _ \ / _` | __| |/ _ \| '_ \      |
#   |       | || | | |  _| (_) | |  | | | | | | (_| | |_| | (_) | | | |     |
#   |      |___|_| |_|_|  \___/|_|  |_| |_| |_|\__,_|\__|_|\___/|_| |_|     |
#   |                                                                       |
#   |               show (Shell Show): Show Fun (Early stages)              |
#   |            Copyright (C) 2013 - 2014 Juan Manuel Borges Caño          |
#   |                      Terminal graphics amaze me.                      |
#   |      Some shows are based on the gathering of http://mewbies.com/     |
#   |                    _     _                                            |
#   |                   | |   (_) ___ ___ _ __  ___  ___                    |
#   |                   | |   | |/ __/ _ \ '_ \/ __|/ _ \                   |
#   |                   | |___| | (_|  __/ | | \__ \  __/                   |
#   |                   |_____|_|\___\___|_| |_|___/\___|                   |
#   |                                                                       |
#   |  This program is free software: you can redistribute it and/or modify |
#   |  it under the terms of the GNU General Public License as published by |
#   |   the Free Software Foundation, either version 3 of the License, or   |
#   |                  (at your option) any later version.                  |
#   |                                                                       |
#   |    This program is distributed in the hope that it will be useful,    |
#   |     but WITHOUT ANY WARRANTY; without even the implied warranty of    |
#   |     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the     |
#   |              GNU General Public License for more details.             |
#   |                                                                       |
#   |   You should have received a copy of the GNU General Public License   |
#   | along with this program.  If not, see <http://www.gnu.org/licenses/>. |
#   |   ____________________________________________________________________|_
#    \_/______________________________________________________________________/


shopt -s extglob

# The --list option
function sh_option_list
{
	for sh_show in "$cmd_datadir/shows"/*.sh
	do
		sh_show="$sh_show"
		sh_show="${sh_show##*/}"
		sh_show="${sh_show##*_}"
		sh_show="${sh_show%.sh}"
		printf "%s\n" "${sh_show}"
	done
	exit 0
}

# The --sound option
function sh_option_sound
{
	sh_sound="on"
}

# The --foreground option
function sh_option_foreground
{
	sh_foreground="on"
}

# The --gingerup option
function sh_option_gingerup
{
	sh_gingerup="on"
}

# ... and show, the program itself.

# The cmd init function
function sh_init
{
	shopt -s extglob
	shopt -s nullglob

	sh_sound="off"
	sh_foreground="off"
	sh_gingerup="off"
	#sh_show="cookie"
}

# The cmd main function
function sh_main
{
	# Select user show or random
	if [[ -n "$1" ]]
	then
		sh_show="$1"
		shift
	else
		sh_shows=("$cmd_datadir/shows"/*.sh)
		sh_show="${sh_shows[$((${RANDOM}%${#sh_shows[@]}))]}"
		sh_show="${sh_show##*/}"
		sh_show="${sh_show##*_}"
		sh_show="${sh_show%.sh}"
	fi

	# Show Time!
	if [[ -e "${cmd_datadir}/shows/${sh_show}.sh" ]]
	then
		source "${cmd_datadir}/shows/${sh_show}.sh" "$@"
	else
		cmd_error "unknown show"
	fi
}

# The cmd fields
cmd_package="[@]pkg[@]"
cmd="show"
cmd_name="shell show"
cmd_version="[@]pkgversion[@]"
cmd_description="Show Fun"
cmd_explanation="shell show is a command that displays nice graphical shell art. shell show has various effects combined."
cmd_license="[@]pkglicense[@]"
cmd_homepage="[@]pkghomepage[@]"
cmd_author="[@]pkgauthor[@]"
cmd_email="[@]pkgemail[@]"
cmd_social="[@]pkgsocial[@]"
cmd_blog="[@]pkgblog[@]"
cmd_usage="$cmd [OPTIONS] [SHOW] [-- SHOWOPTIONS]"
cmd_options=("/l/list/list shows/sh_option_list/" "/s/sound/play a sound/sh_option_sound/" "/f/foreground/work in foreground/sh_option_foreground/" "/g/gingerup/ginger up for data/sh_option_gingerup/")
cmd_examples=("$cmd cookie")
cmd_extrahelp="By default shows a cookie."
cmd_extranotes="For more information, check documentation."
cmd_init="sh_init"
cmd_main="sh_main"

cmd_datadir="[@]pkgdatadir[@]/$cmd"

# The cmd environment
source "[@]pkgdatadir[@]/cmd.sh"
