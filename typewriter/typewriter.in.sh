#! /usr/bin/env bash

# typewriter: slowed down echo
# Copyright (C) 2013 Juan Manuel Borges Caño
# Inspired by Dave W. Capella slowcat.c, simpler and smarter.
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

# ... and typewriter, the program itself

# The cmd init function
function tw_init
{
	tw_charsecs="0.05"
	tw_linesecs="0.5"
}

# The cmd main function
function tw_main
{
	# December 16th, 2013, Juan Manuel Borges Caño

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
cmd_bugreport="[@]pkgbugreport[@]"
cmd_homepage="[@]pkghomepage[@]"
cmd_usage="$cmd"
cmd_examples=("echo type this | $cmd ")
cmd_options=("/c:/charsecs:/set seconds per char/tw_option_charsecs/CHARSECS/" "/l:/linesecs:/set seconds per line/tw_option_linesecs/LINESECS/")
cmd_extrahelp="Nice for demos."
cmd_extranotes="For more information, check man documentation."
cmd_init="tw_init"
cmd_main="tw_main"

cmd_datadir="[@]pkgdatadir[@]"

# The cmd environment
source "$cmd_datadir/cmd.sh"
