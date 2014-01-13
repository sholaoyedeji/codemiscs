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

# The weave 
# Weaving with simple math in terminal: https://bitbucket.org/livibetter/weave.sh
# Copyright (c) 2013 Yu-Jie Lin

# weave '((x + y) % 2)
# weave '(((y % 4) && (x % 4)))'
# weave '(( $(echo "v=s(($x-1)*2*4*a(1)/$W);scale=0;$H-$H*(v+1)/2 == $y" | bc -l) ))'

VERSION=0.1.0

# Characters and colors for vertical and horizontal lines
: ${char_v:='|'}            ${char_h:='-'}
: ${color_v:='\e[32;1m'}    ${color_h:='\e[31;1m'}

# Sleep delays
: ${sleep_v:=0.01}          ${sleep_h:=0.01}
: ${sleep_end:=3}

: ${eval_h:="$1"}           Get evaluation code from '$1'
: ${eval_h:='(((y % 4) && (x % 4)))'}  , or set to a default pattern
: ${show_eval_h:=no}        "yes" to print out evaluation code

W=$(tput cols)              H=$(tput lines)

draw_v()
{
	local line y
	printf -v line '%*s' $W ; line=${line// /$char_v}
	for ((y=1; y<=H; y++)); do
		echo -ne "\e[${y};1H${color_v}${line}"
		sleep $sleep_v
	done
}

draw_h()
{
	local x y
	for ((x=1; x<=W; x++)); do
		for ((y=1; y<=H; y++)); do
			eval "$eval_h" && echo -ne "\e[${y};${x}H${color_h}${char_h}"
		done
		sleep $sleep_h
	done
}

main()
{
	clear
	draw_v
	draw_h
	[[ $show_eval_h == yes ]] && echo -ne "\e[$H;1H\e[0m${eval_h:0:$W}"
	sleep $sleep_end
}

main
