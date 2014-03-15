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


# The matrix
# Based on Blue Matrix by dave1010 http://www.commandlinefu.com/commands/view/5712/blue-matrix 

# matrix 2
# matrix "$(printf "%i " {112..123})"

sh_colors="${1:-$(printf "%i " {0..7})}"
sh_colors=( $sh_colors )
sh_rows="${2:-27}"
sh_cols="${3:-$(tput cols)}"
while :; do i=0; COL=$((RANDOM%sh_rows));ROW=$((RANDOM%sh_cols));while [ $i -lt $COL ]; do tput cup $i $ROW; tput setaf ${sh_colors[$((RANDOM%${#sh_colors[@]}))]}; echo "$(head -1 /dev/urandom | cut -c1-1)" 2>/dev/null ; i=$((i+1)); done; done
