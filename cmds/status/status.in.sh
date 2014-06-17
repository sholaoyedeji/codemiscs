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

# The check option
function st_option_check
{
	st_check="on"
	st_status="$1"
}

# The code option
function st_option_code
{
	st_code="on"
}

# The visible option
function st_option_visible
{
	st_visible="on"
	stv_text="${1:-"$stv_text"}"
}

# The visible positive option
function st_option_visible_positive
{
	stv_positive="$1"
}

# The visible negative option
function st_option_visible_negative
{
	stv_negative="$1"
}

# The --audible option
function st_option_audible
{
	st_audible="on"
}

# The audible positive option
function st_option_audible_positive
{
	sta_positive="$1"
}

# The audible negative option
function st_option_audible_negative
{
	sta_negative="$1"
}

# The profiles
#st_profiles=(check info warning error success problem failure victory trouble lose)
st_profiles=(verify check info warning error success problem failure)

# The --list option
function st_option_list()
{
	for st_profile in "${st_profiles[@]}"
	do
		printf "%s\n" "$st_profile"
	done
	exit 0
}

# The visible profile helper
function stv_profile
{
	if cmd_switch "$st_visible"
	then
		if cmd_switch "$st_check"
		then
			if [[ $st_status = 0 ]]
			then
				stv_message="$stv_positive"
			else
				stv_message="$stv_negative"
			fi
		fi
		if cmd_switch "$st_code"
		then
			printf "%s (%s)\n" "$stv_text" "$st_status" | colorize $stv_message >&2
		else
			printf "%s\n" "$stv_text" | colorize $stv_message >&2
		fi
	fi
}

# The audible profile helper
function sta_profile
{
	if cmd_switch "$st_audible"
	then
		if cmd_switch "$st_check"
		then
			if [[ $st_status = 0 ]]
			then
				sta_message="$sta_positive"
			else
				sta_message="$sta_negative"
			fi
		fi
		tonize $sta_message
	fi
}

# The positive helper
function stp_positive
{
	stv_positive="$1"
	sta_positive="$1"
}

# The negative profile helper
function stp_negative
{
	stv_negative="$1"
	sta_negative="$1"
}

# The profiles helper
function st_profiles
{
	stv_profile
	sta_profile
	exit 0
}

# The profile helper
function st_profile
{
	case "$#" in
		"1")
			stp_positive="$1"
			stp_negative="$1"
			;;
		"2")
			stp_positive="$1"
			stp_negative="$2"
			;;
		"4")
			stv_positive="$1"
			sta_positive="$2"
			stv_negative="$3"
			sta_negative="$4"
			;;
	esac
	st_profiles
}

# The verify profile
function st_profile_verify
{
	st_profile info error
}

# The check profile
function st_profile_check
{
	st_profile "${stv_positive:-info}" "${sta_positive:-vivid}" "${stv_negative:-error}" "${sta_negative:-sharp}"
}

# The info profile
function st_profile_info
{
	st_profile "${stv_positive:-info}" "${sta_positive:-info}" "${stv_negative:-info}" "${sta_negative:-info}"
}

# The warning profile
function st_profile_warning
{
	st_profile "${stv_positive:-warning}" "${sta_positive:-warning}" "${stv_negative:-warning}" "${sta_negative:-warning}"
}

# The error profile
function st_profile_error
{
	st_profile "${stv_positive:-error}" "${sta_positive:-error}" "${stv_negative:-error}" "${sta_negative:-error}"
}

# The success profile
function st_profile_success
{
	st_profile "${stv_positive:-vivid}" "${sta_positive:-vivid}" "${stv_negative:-vivid}" "${sta_negative:-vivid}"
}

# The problem profile
function st_profile_problem
{
	st_profile "${stv_positive:-warning}" "${sta_positive:-warning}" "${stv_negative:-warning}" "${sta_negative:-warning}"
}

# The failure profile
function st_profile_failure
{
	st_profile "${stv_positive:-sharp}" "${sta_positive:-sharp}" "${stv_negative:-sharp}" "${sta_negative:-sharp}"
}

# The --profile option
function st_option_profile
{
	st_profile_"$1"
}

# The --terminal option
function st_option_terminal
{
	st_terminal="on"
}

# ... and status, the program itself.

# The cmd init function
function st_init
{
	st_code="off"
	stv_text="job done"
	st_terminal="off"
	stv_message="fancy"
	sta_message="beep"
}

# The cmd main function
function st_main
{
	if [[ $# == 1 ]]
	then
		st_status="$1"
		st_check="on"
	fi
	shift
	if ! cmd_switch "$st_terminal" || [[ -t 1 ]]
	then
		st_selection="${1:-check}"
		for st_profile in "${st_profiles[@]}"
		do
			if [[ "$st_profile" = "$st_selection" ]]
			then
				shift
				"st_profile_$st_profile" "$@"
			fi
		done
		cmd_error "unknown profile"
	fi
}

# The cmd fields
cmd_package="[@]pkg[@]"
cmd="status"
cmd_name="status report"
cmd_version="[@]pkgversion[@]"
cmd_description="Status Reporter"
cmd_explanation="status report is a command that reports status, either manual or the shell last command return code. status uses profiles to select the report to make effective."
cmd_license="[@]pkglicense[@]"
cmd_homepage="[@]pkghomepage[@]"
cmd_author="[@]pkgauthor[@]"
cmd_email="[@]pkgemail[@]"
cmd_social="[@]pkgsocial[@]"
cmd_blog="[@]pkgblog[@]"
cmd_usage="$cmd "'$?'" [OPTIONS] [PROFILE]"
cmd_options=(
"/c:/check:/report according to shell exit status/st_option_check/STATUS/"
"/c/code/show visually shell exit status/st_option_code/"
"/v::/visible::/set visible report/st_option_visible/MESSAGE/"
"/a::/audible::/set audible report/st_option_audible/MESSAGE/"
"/i/info/use info profile/st_profile_info/"
"/w/warning/use warning profile/st_profile_warning/"
"/e/error/use error profile/st_profile_error/"
"/p:/profile:/set profile/st_option_profile/PROFILE/"
"/l/list/list profiles/st_option_list/"
"/p:/visible-positive:/set visible positive report/st_option_visible_positive/COLORIZE_MESSAGE/"
"/n:/visible-negative:/set visible negative report/st_option_visible_negative/COLORIZE_MESSAGE/"
"/p:/audible-positive:/set audible positive report/st_option_audible_positive/TONIZE_MESSAGE/"
"/n:/audible-negative:/set audible negative report/st_option_audible_negative/TONIZE_MESSAGE/"
"/t/terminal/report only if output is a terminal/st_option_terminal/"
)
cmd_examples=("$cmd --visible=\"job ended\" --audible --check "'$?'" --code")
cmd_extrahelp="By default uses check profile, requiring one argument for shell last command code ("'$?'"). Visual colorize and audible tonize arguments are understood."
cmd_extranotes="For more information, check documentation."
cmd_init="st_init"
cmd_main="st_main"

cmd_datadir="[@]pkgdatadir[@]"

# The cmd environment
source "$cmd_datadir/cmd.sh"
