#! /usr/bin/env bash

#  _________________________________________________________________________________
# /\                                                                                \
# \_|           ___        __                            _   _                      |
#   |          |_ _|_ __  / _| ___  _ __ _ __ ___   __ _| |_(_) ___  _ __           |
#   |           | || '_ \| |_ / _ \| '__| '_ ` _ \ / _` | __| |/ _ \| '_ \          |
#   |           | || | | |  _| (_) | |  | | | | | | (_| | |_| | (_) | | | |         |
#   |          |___|_| |_|_|  \___/|_|  |_| |_| |_|\__,_|\__|_|\___/|_| |_|         |
#   |                                                                               |
#   |                          tonize (Tonize): Tone Beeper                         |
#   |                Copyright (C) 2013 - 2014 Juan Manuel Borges Caño              |
#<colorize>
#   |     The idea of colorizing commands output occurred to me multiple times.     |
#   |              After knowing Radovan Garabík's Generic Colouriser               |
#   |           <http://korpus.juls.savba.sk/~garabik/software/grc.html>,           |
#   | i got inspired to code an elegant, smart, fast and efficient filter solution. |
#</colorize>
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

# The frequency option
function tn_option_frequency
{
	tn_frequency="$1"
}

function cmd_float
{
	printf "%s\n" "$@" | bc -l
}

# The --time option
function tn_option_time
{
	tn_time="$1"
}

# The --delay option
function tn_option_delay
{
	tn_delay="$1"
}

# The --repeats option
function tn_option_repeats
{
	tn_repeats="$1"
}

# The profiles
#tn_profiles=(beep composer info warning error success trouble failure victory problem fail input phaser ring cash elegant minimalist awesome fancy cool health relax heaven strong reverse hidden raw bold)
tn_profiles=(beep composer info warning error success trouble failure victory problem fail input phaser ring cash smart vivid sharp fancy cool health strong reverse hidden raw bold)

# The --list option
function tn_option_list()
{
	for tn_profile in "${tn_profiles[@]}"
	do
		printf "%s\n" "$tn_profile"
	done
	exit 0
}

# The note helper
function tn_note
{
	case "${1^^}" in
		"BEEP") echo "750.0";;
		"FANCY") echo "5000";;
		"DO"|"C") echo "261.6";;
		"C1") echo "277.2";;
		"RE"|"D") echo "293.7";;
		"D1") echo "311.1";;
		"MI"|"E") echo "329.6";;
		"FA"|"F") echo "349.2";;
		"F1") echo "370.0";;
		"SOL"|"G") echo "392.0";;
		"G1") echo "415.3";;
		"LA"|"A") echo "440.0";;
		"A1") echo "466.2";;
		"SI"|"B") echo "493.9";;
		"C2") echo "523.2";;
		"C22") echo "554.3";;
		"D2") echo "587.33";;
		"D12") echo "622.2";;
		"E2") echo "659.26";;
		"F2") echo "698.46";;
		"F22") echo "739.99";;
		"G2") echo "783.99";;
		"G22") echo "830.61";;
		"A2") echo "880.00";;
		"A22") echo "932.33";;
		"B2") echo "987.77";;
		"C3") echo "1046.50";;
		*) echo "$1";;
	esac
}

# The beep helper
function tn_beep
{
	if ! cmd_switch "$tn_print"
	then
		beep "$@"
	else
		echo beep "$@"
	fi
}

# The profile helper
function tn_profile
{
	#tn_beep -f "$(tn_note "${1:-beep}")" -l "${2:-1000}" -d "${3:-0}" -r "${4:-1}"
	tn_beep -f "$(tn_note "${1:-$tn_frequency}")" -l "$(cmd_float "${2:-$tn_time} * 1000")" -d "$(cmd_float "${3:-$tn_delay} * 1000")" -r "${4:-$tn_repeats}"
}

# The loop helper
function tn_loop
{
	new=""
	tune=""
	for frequency in "${@:2}"
	do
		tune="$tune $new -f $frequency $1"
		[[ -z $new ]] && new="-n"
	done
	tn_beep $tune
}

# The beep profile
function tn_profile_beep
{
	tn_profile
	exit 0
}

# The input profile
function tn_profile_input
{
	while IFS="" read -r -n 1 tn_char && [[ "$tn_char" != $'\004' ]]
	do
		if [[ -z "$tn_char" ]]; then tn_char=$'\n'; fi
		tn_input=$"$tn_input$tn_char"
		tn_beep -f 400 -d 50 -l 10
	done
	printf "%s" $"$tn_input"
	exit 0
}

# The composer profile
function tn_profile_composer
{
	while read tn_frequency tn_time tn_delay tn_repeats
	do
#		if [[ -z $tn_frequency ]]
#		then
#			tn_frequency="beep"
#		fi
#		if [[ -z $tn_time ]]
#		then
#			tn_time=0.125
#		fi
#		if [[ -z $tn_delay ]]
#		then
#			tn_delay=0
#		fi
#		if [[ -z $tn_repeats ]]
#		then
#			tn_repeats=1
#		fi
		tn_profile "$(tn_note "${tn_frequency:-beep}")" "${tn_time:-0.125}" "${tn_delay:-0}" "${tn_repeats:-1}"
	done
	exit 0
}

# The info profile
function tn_profile_info
{
	tn_beep
	exit 0
}

# The warning profile
function tn_profile_warning
{
	tn_beep -n
	exit 0
}

# The error profile
function tn_profile_error
{
	tn_beep -n -n
	exit 0
}

# The success profile
function tn_profile_success
{
	tn_beep
	exit 0
}

# The trouble profile
function tn_profile_trouble
{
	tn_beep -n
	exit 0
}

# The failure profile
function tn_profile_failure
{
	tn_beep -n -n
	exit 0
}

# The victory profile
function tn_profile_victory
{
	# AnoPoli, http://ubuntuforums.org/showthread.php?t=1157670&page=4
	tn_loop "-l 100" {1000..2000..100}
	exit 0
}

# The problem profile
function tn_profile_problem
{
	# AnoPoli, http://ubuntuforums.org/showthread.php?t=1157670&page=4
	tn_beep -f 200 -d 1 -r 5 -n -f 300 -d 10 -r 4 -n -f  400 -d 100 -r 3 
	exit 0
}

# The fail profile
function tn_profile_fail
{
	# AnoPoli, http://ubuntuforums.org/showthread.php?t=1157670&page=4
	tn_loop "-l 100" {2000..1000..100}
	exit 0
}

# The phaser profile
function tn_profile_phaser
{
	# odokemono, http://www.reddit.com/r/linux/comments/18h8v5/does_anyone_have_or_know_a_source_for_beep_scripts/
	new=""
	tune=""
	frequency=3000
	while [[ $frequency -gt 400 ]]
	do
		tune="$tune $new -f ${frequency} -l 5"
		[[ -z $new ]] && new="-n"
		frequency="$(($frequency * 97 / 100))"
	done
	tn_beep $tune
	exit 0
}

# The ring profile
function tn_profile_ring
{
	# odokemono, http://www.reddit.com/r/linux/comments/18h8v5/does_anyone_have_or_know_a_source_for_beep_scripts/
	new=""
	tune=""
	for repeat in 1 2 3
	do
		for frequency in 1000 2000 1000 2000 1000 2000 1000 2000 1000 2000
		do
			tune="$tune $new -f ${frequency} -l 20"
			[[ -z $new ]] && new="-n"
		done
	done
	tn_beep $tune
	exit 0
}

# The cash profile
function tn_profile_cash
{
	# odokemono, http://www.reddit.com/r/linux/comments/18h8v5/does_anyone_have_or_know_a_source_for_beep_scripts/
	new=""
	tune=""
	for repeat in 1 2 3 4 5 6 7 8 9 0
	do
		for frequency in 400 500 600 700 800 900 1000 1100 1200 1300 1400 1500 1600
		do
			tune="$tune $new -f ${frequency} -l 20"
			[[ -z $new ]] && new="-n"
		done
	done
	tn_beep $tune
	exit 0
}

# The vivid profile
function tn_profile_vivid
{
	tn_profile 3500 "${tn_time}" "${tn_delay}" 1
	exit 0
}

# The smart profile
function tn_profile_smart
{
	tn_profile 5000 0.05 0.1 2
	exit 0
}

# The elegant profile
function tn_profile_elegant
{
	exit 0
}

# The minimalist profile
function tn_profile_minimalist
{
	exit 0
}

# The sharp profile
function tn_profile_sharp
{
	tn_profile 100 0.5 0.2 8
	exit 0
}

# The awesome profile
function tn_profile_awesome
{
	exit 0
}

# The fancy profile
function tn_profile_fancy
{
	tn_profile 5000 0.05 0.1 2
	exit 0
}

# The cool profile
function tn_profile_cool
{
	tn_loop "-l 20 -d 20" {21..3500..40}
	tn_loop "-l 20 -d 20" {3500..21..40}
	exit 0
}

# The health profile
function tn_profile_health
{
	# odokemono, http://www.reddit.com/r/linux/comments/18h8v5/does_anyone_have_or_know_a_source_for_beep_scripts/
	tn_loop "-l 200" "1500 1550 1500 1550 1500 1550 1500 1550 1500 1550 1500 1550"
	exit 0
}

# The relax profile
function tn_profile_relax
{
	exit 0
}

# The heaven profile
function tn_profile_heaven
{
	exit 0
}

# The strong profile
function tn_profile_strong
{
	tn_profile 300.7 0.4 0.1 2
	exit 0
}

# The reverse profile
function tn_profile_reverse
{
	tn_profile fancy 0.150
	exit 0
}

# The hidden profile
function tn_profile_hidden
{
	tn_profile 1000 "${tn_time}" "${tn_delay}" 5
	exit 0
}

# The raw profile
function tn_profile_raw
{
	tn_beep
	exit 0
}

# The bold profile
function tn_profile_bold
{
	tn_beep
	exit 0
}

# The --profile option
function tn_option_profile
{
	tn_profile_"$1"
}

# The --terminal option
function tn_option_terminal
{
	tn_terminal="on"
}

# The --print option
function tn_option_print
{
	tn_print="on"
}

# ... and tonize, the program itself.

# The cmd init function
function tn_init
{
	tn_terminal="off"
	tn_print="off"
	tn_frequency="beep"
	tn_time="0.125"
	tn_delay="0"
	tn_repeats="1"
}

# The cmd main function
function tn_main
{
	if ! cmd_switch "$tn_terminal" || [[ -t 1 ]]
	then
		tn_profilesel="${1:-input}"
		for tn_profile in "${tn_profiles[@]}"
		do
			if [[ "$tn_profile" = "$tn_profilesel" ]]
			then
				shift
				"tn_profile_$tn_profile" "$@"
			fi
		done
		cmd_error "unknown profile"
	else
		cat -
	fi
}

# The cmd fields
cmd_package="[@]pkg[@]"
cmd="tonize"
cmd_name="tone beeper"
cmd_version="[@]pkgversion[@]"
cmd_description="Tone Beeper"
cmd_explanation="tone beeper is a command that tones according to a selected profile, the input read from standard input or from a file."
cmd_license="[@]pkglicense[@]"
cmd_homepage="[@]pkghomepage[@]"
cmd_author="[@]pkgauthor[@]"
cmd_blog="[@]pkgblog[@]"
cmd_email="[@]pkgemail[@]"
cmd_usage="$cmd [OPTIONS] [PROFILE]"
cmd_options=(
"/t:/tone:/set tone/tn_option_frequency/TONE/"
"/n:/note:/set note/tn_option_frequency/NOTE/"
"/f:/frequency:/set frequency/tn_option_frequency/FREQUENCY/"
"/t:/time:/set time/tn_option_time/TIME/"
"/d:/delay:/set delay/tn_option_delay/DELAY/"
"/r:/repeats:/set repeats/tn_option_repeats/TIMES/"
"/i/info/use info profile/tn_profile_info/"
"/w/warning/use warning profile/tn_profile_warning/"
"/e/error/use error profile/tn_profile_error/"
"/p:/profile:/set profile/tn_option_profile/PROFILE/"
"/l/list/list profiles/tn_option_list/"
"/t/terminal/tone only if output is a terminal/tn_option_terminal/"
"/p/print/only print command/tn_option_print/"
)
cmd_examples=("$cmd beep")
cmd_extrahelp="By default sets profile, else uses input profile (beep tone,  one second time, no delay, one repeat). Tone aliases are understood: do/c, re/d, mi/e, fa/f, sol/g, la/a , si/b (6) and beep."
cmd_extranotes="For more information, check documentation."
cmd_init="tn_init"
cmd_main="tn_main"

cmd_datadir="[@]pkgdatadir[@]"

# The cmd environment
source "$cmd_datadir/cmd.sh"
