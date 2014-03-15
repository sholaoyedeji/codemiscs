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

# The box

sh_message="${1:-"Fortune"}"
sh_box="${2:-parchment}"
sh_cols="${3:-$(($(tput cols) / 2))}"
sh_fortune="$4"
sh_epigram="${5:-"$(fortune -a -s "$sh_fortune" | fmt -"$sh_cols" -s)"}"
sh_box="$(boxes -d "$sh_box" -s "$sh_cols" <<< "$sh_epigram")"
sh_cols="$(wc -L <<< "$sh_box")"
sh_shift=$((($(tput cols) - $sh_cols) / 2))
sh_shift=$(printf "%${sh_shift}s" "")
figlet -t -c "$sh_message" | colorize info
printf "%s\n" "$sh_box" | sed -e "s/^/$sh_shift/g" | colorize warning
if cmd_switch "$sh_sound"
then
	if cmd_switch "$sh_foreground"
	then
		bash -c 'festival --tts <<< "$1" 2>/dev/null' _ "$sh_epigram "
	else
		bash -c 'festival --tts <<< "$1" 2>/dev/null &' _ "$sh_epigram "
	fi
fi
