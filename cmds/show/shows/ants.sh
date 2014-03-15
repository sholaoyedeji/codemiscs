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

# The ants
# Langtons Ants
# Charles Cooke

speed="${1:-0.01}"

echo -ne "\033#8";X=`tput cols`;Y=`tput lines`;((a=$X/2));((b=$Y/2));d=1;while case $d in 0)((a=a<2?X:a-1));;1)((b=b<2?Y:b-1));;2)((a=a==X?1:a+1));;3)((b=b==Y?1:b+1));; esac;do ((c=b+a*X));v=${k[c]:- };[ $v. = @. ]&&{((d=d>2?0:d+1));k[c]="";}||{(( d=d<1?3:d-1));k[c]=@;};echo -ne "\033[$b;${a}H$v";sleep "$speed";done
