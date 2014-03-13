#! /usr/bin/env bash

#  ______________________________________________________________________________
# /\                                                                             \
# \_|         ___        __                            _   _                     |
#   |        |_ _|_ __  / _| ___  _ __ _ __ ___   __ _| |_(_) ___  _ __          |
#   |         | || '_ \| |_ / _ \| '__| '_ ` _ \ / _` | __| |/ _ \| '_ \         |
#   |         | || | | |  _| (_) | |  | | | | | | (_| | |_| | (_) | | | |        |
#   |        |___|_| |_|_|  \___/|_|  |_| |_| |_|\__,_|\__|_|\___/|_| |_|        |
#   |                                                                            |
#   |                 typewrite (Typewrite): Slowed Down Echoer                  |
#   |              Copyright (C) 2013 - 2014 Juan Manuel Borges Caño             |
#   | Liking the effect lot of times, and being useful for demos (Gif, YouTube), |
#   |                Dave W. Capella's slowcat.c finally inspired                |
#   |        a ready to use, simple, smart, elegant, fast and efficient,         |
#   |                             one line solution.                             |
#   |                      _     _                                               |
#   |                     | |   (_) ___ ___ _ __  ___  ___                       |
#   |                     | |   | |/ __/ _ \ '_ \/ __|/ _ \                      |
#   |                     | |___| | (_|  __/ | | \__ \  __/                      |
#   |                     |_____|_|\___\___|_| |_|___/\___|                      |
#   |                                                                            |
#   |    This program is free software: you can redistribute it and/or modify    |
#   |    it under the terms of the GNU General Public License as published by    |
#   |     the Free Software Foundation, either version 3 of the License, or      |
#   |                    (at your option) any later version.                     |
#   |                                                                            |
#   |      This program is distributed in the hope that it will be useful,       |
#   |       but WITHOUT ANY WARRANTY; without even the implied warranty of       |
#   |       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the        |
#   |                GNU General Public License for more details.                |
#   |                                                                            |
#   |     You should have received a copy of the GNU General Public License      |
#   |   along with this program.  If not, see <http://www.gnu.org/licenses/>.    |
#   |   _________________________________________________________________________|_
#    \_/___________________________________________________________________________/

shopt -s extglob

# The --charsecs option
function tw_option_charsecs
{
	tw_charsecs="$1"
}

# The --fast option
function tw_option_fast
{
	tw_charsecs="$(bc -l <<< "$tw_charsecs / 5")"
	tw_linesecs="$(bc -l <<< "$tw_linesecs / 5")"
}

# The --slow option
function tw_option_slow
{
	tw_charsecs="$(bc -l <<< "$tw_charsecs * 5")"
	tw_linesecs="$(bc -l <<< "$tw_linesecs * 5")"
}

# The --linesecs option
function tw_option_linesecs
{
	tw_linesecs="$1"
}

# The --scroll option
function tw_option_scroll
{
	tw_charsecs="0"
	tw_linesecs="${1:-$tw_linesecs}"
}

# The --all option
function tw_option_all
{
	tw_all="on"
}

# The --sound option
function tw_option_sound
{
	tw_sound="on"
}

# ... and typewrite, the program itself

# The cmd init function
function tw_init
{
	tw_charsecs="0.05"
	tw_linesecs="0.5"
	tw_all="off"
	tw_sound="off"
}

# The cmd main function
function tw_main
{
	# December 16th, 2013, Juan Manuel Borges Caño

	tw_input="$(cat "${1:--}")"

	if cmd_switch "$tw_sound"
	then
		trap 'kill $sound 2>/dev/null; wait $sound 2>/dev/null' EXIT
		ogg123 -r -q "$cmd_datadir/typewrite.ogg" 2>/dev/null & 
		sound=$!
	fi

	printf "%s\n" "$tw_input" | while IFS="" read -r tw_line
	do
		if [[ $tw_charsecs != 0 ]]
		then
			printf "%s" "$tw_line" | while IFS="" read -r -n 1 tw_char
			do
				printf "%s" "$tw_char"
				if cmd_switch "$tw_all" || [[ "$tw_char" =~ [[:print:]] ]]
				then
					sleep "$tw_charsecs"
				fi
			done
			printf "\n"
		else
			printf "%s\n" "$tw_line"
		fi
		sleep "$tw_linesecs"
	done

	exit 0
}

# The cmd fields
cmd_package="[@]pkg[@]"
cmd="typewrite"
cmd_name="typewrite"
cmd_version="[@]pkgversion[@]"
cmd_description="Slowed Down Echoer"
cmd_explanation="typewrite is a program that echoes slowly. typewrite reads a file or standard input and writes slowed down to standard output."
cmd_license="[@]pkglicense[@]"
cmd_homepage="[@]pkghomepage[@]"
cmd_author="[@]pkgauthor[@]"
cmd_blog="[@]pkgblog[@]"
cmd_email="[@]pkgemail[@]"
cmd_usage="$cmd [OPTIONS] [FILE]"
cmd_options=("/c:/charsecs:/set seconds per character/tw_option_charsecs/CHARSECS/" "/l:/linesecs:/set seconds per line/tw_option_linesecs/LINESECS/" "/f/fast/type faster/tw_option_fast/" "/s/slow/type slower/tw_option_slow/" "/s::/scroll::/type scrolling/tw_option_scroll/LINESECS/" "/a/all/slow all characters/tw_option_all/")
if [[ "[@]pkgogg123[@]" == "yes" ]]
then
	cmd_options=("${cmd_options[@]}" "/s/sound/play a sound while echoing/tw_option_sound/")
fi
cmd_examples=("echo text | $cmd ")
cmd_extrahelp="By default slows only printable characters, at 0.05 seconds per character and 0.5 seconds per line, and does not play sound. With no file, or when file is -, read standard input."
cmd_extranotes="For more information, check documentation."
cmd_init="tw_init"
cmd_main="tw_main"

cmd_datadir="[@]pkgdatadir[@]/$cmd"

# The cmd environment
source "[@]pkgdatadir[@]/cmd.sh"
