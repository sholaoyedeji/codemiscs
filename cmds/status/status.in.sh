#! /usr/bin/env bash

#  _________________________________________________________________________________
# /\                                                                                \
# \_|           ___        __                            _   _                      |
#   |          |_ _|_ __  / _| ___  _ __ _ __ ___   __ _| |_(_) ___  _ __           |
#   |           | || '_ \| |_ / _ \| '__| '_ ` _ \ / _` | __| |/ _ \| '_ \          |
#   |           | || | | |  _| (_) | |  | | | | | | (_| | |_| | (_) | | | |         |
#   |          |___|_| |_|_|  \___/|_|  |_| |_| |_|\__,_|\__|_|\___/|_| |_|         |
#   |                                                                               |
#   |                        status (Status): Status Reporter                       |
#   |                Copyright (C) 2013 - 2014 Juan Manuel Borges Caño              |
# ! Unattended long periods, after using colorize and beep from () lend to this command. 
# <colorize>
#   |     The idea of colorizing commands output occurred to me multiple times.     |
#   |              After knowing Radovan Garabík's Generic Colouriser               |
#   |           <http://korpus.juls.savba.sk/~garabik/software/grc.html>,           |
#   | i got inspired to code an elegant, smart, fast and efficient filter solution. |
# </colorize>
#   |                        _     _                                                |
#   |                       | |   (_) ___ ___ _ __  ___  ___                        |
#   |                       | |   | |/ __/ _ \ '_ \/ __|/ _ \                       |
#   |                       | |___| | (_|  __/ | | \__ \  __/                       |
#   |                       |_____|_|\___\___|_| |_|___/\___|                       |
#   |                                                                               |
#   |      This program is free software: you can redistribute it and/or modify     |
#   |      it under the terms of the GNU General Public License as published by     |
#   |       the Free Software Foundation, either version 3 of the License, or       |
#   |                      (at your option) any later version.                      |
#   |                                                                               |
#   |        This program is distributed in the hope that it will be useful,        |
#   |         but WITHOUT ANY WARRANTY; without even the implied warranty of        |
#   |         MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         |
#   |                  GNU General Public License for more details.                 |
#   |                                                                               |
#   |       You should have received a copy of the GNU General Public License       |
#   |     along with this program.  If not, see <http://www.gnu.org/licenses/>.     |
#   |   ____________________________________________________________________________|_
#    \_/______________________________________________________________________________/

# The visual option
function st_option_visual
{
	st_visual="on"
	stv_message="${1:-"shell status code: $st_check"}"
}

# The --audible option
function st_option_audible
{
	st_audible="on"
	sta_message="${1:-"beep"}"
}

# The profiles
st_profiles=(check info warning error success problem failure victory trouble lose)

# The --list option
function st_option_list()
{
	for st_profile in "${st_profiles[@]}"
	do
		printf "%s\n" "$st_profile"
	done
	exit 0
}

# The visual profile helper
function st_profile_visual
{
	if cmd_switch "$st_visual"
	then
		printf "%s\n" "${stv_message:-shell status code: $st_check}" | colorize "${@:2}" >&2
	fi
}

# The audible profile helper
function st_profile_audible
{
	if cmd_switch "$st_audible"
	then
		# echo ${sta_message:-beep}
		tonize "${1:-beep}"
	fi
}

# The profiles helper
function st_profiles
{
	st_profile_visual "$1"
	st_profile_audible "$1"
}

# The check profile
function st_profile_check
{
	if [[ $st_check = 0 ]]
	then
		st_profiles info
	else
		st_profiles error
	fi
	exit 0
}

# The info profile
function st_profile_info
{
	st_profiles info
	exit 0
}

# The warning profile
function st_profile_warning
{
	st_profiles warning
	exit 0
}

# The error profile
function st_profile_error
{
	st_profiles error
	exit 0
}

# The --profile option
function st_option_profile
{
	st_profile_"$1"
}

# ... and status, the program itself.

# The cmd init function
function st_init
{
	st_check="$1"
}

# The cmd main function
function st_main
{
	shift
	if ! cmd_switch "$st_strip"
	then
		if ! cmd_switch "$st_terminal" || [[ -t 1 ]]
		then
			st_profilesel="${1:-check}"
			for st_profile in "${st_profiles[@]}"
			do
				if [[ "$st_profile" = "$st_profilesel" ]]
				then
					shift
					"st_profile_$st_profile" "$@"
				fi
			done
			cmd_error "unknown profile"
		else
			cat -
		fi
	else
		st_strip "$@"
	fi
}

# The cmd fields
cmd_package="[@]pkg[@]"
cmd="status"
cmd_name="status report"
cmd_version="[@]pkgversion[@]"
cmd_description="Status Reporter"
cmd_explanation="status report is a command that reports the status of the shell last command return code. status uses profiles to select the report to make effective"
cmd_license="[@]pkglicense[@]"
cmd_homepage="[@]pkghomepage[@]"
cmd_author="[@]pkgauthor[@]"
cmd_blog="[@]pkgblog[@]"
cmd_email="[@]pkgemail[@]"
cmd_usage="$cmd "'$?'" [OPTIONS] [PROFILE]"
cmd_options=(
"/v::/visual::/set visual report/st_option_visual/MESSAGE/"
"/a::/audible::/set audible report/st_option_audible/MESSAGE/"
"/i/info/use info profile/st_profile_info/"
"/w/warning/use warning profile/st_profile_warning/"
"/e/error/use error profile/st_profile_error/"
"/p:/profile:/set profile/st_option_profile/PROFILE/"
"/l/list/list profiles/st_option_list/"
)
cmd_examples=("$cmd --help | $cmd --profile help")
cmd_extrahelp="By default sets profile, else uses check profile (shell last command code). Visual colorize and audible speaker arguments are understood."
cmd_extranotes="For more information, check documentation."
cmd_init="st_init"
cmd_main="st_main"

cmd_datadir="[@]pkgdatadir[@]"

# The cmd environment
source "$cmd_datadir/cmd.sh"
