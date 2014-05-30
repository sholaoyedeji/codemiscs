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
	tn_time="$(cmd_float "$1 * 1000")"
}

# The --delay option
function tn_option_delay
{
	tn_delay="$(cmd_float "$1 * 1000")"
}

# The --repeats option
function tn_option_repeats
{
	tn_repeats="$1"
}

# The line option
function tn_option_line
{
	tn_match="^\(.*$1.*\)$"
}

# The match option
function tn_option_match
{
	tn_match="\($1\)"
}

# The profiles
tn_profiles=(beep input help info warning error punctuation vivid smart elegant minimalist sharp awesome fancy cool health relax heaven strong reverse hidden raw bold reverse)

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

# The profile helper
function tn_profile
{
	#grep "${tn_match:-^\(.*\)$}" && beep
	beep -f "$(tn_note "${1:-beep}")" -l "${2:-1000}" -d "${3:-0}" -r "${4:-1}"
}

# The beep helper
function tn_beep
{
	beep "$@"
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
	tn_profile beep "${tn_time:-100}" "${tn_delay:-0}" "${tn_repeats:-1}"
	exit 0
}

# The input profile
function tn_profile_input
{
	while read tn_input
	do
		tn_profile $tn_input
	done
	#grep "${tn_match:-^\(.*\)$}" && tn_profile
	exit 0
}

# The help profile
function tn_profile_help
{
	sed \
		-e "s/\([[:digit:]]\+\)/$(tput setaf 4)\1$(tput sgr0)/g" \
		-e "s/\(GB\|MB\|KB\|[[:upper:]_]\{2,\}\|'[^']\+'\|\"[^\"]\+\"\|\`\`[^\']\+''\)/$(tput setaf 2)\1$(tput sgr0)/g" \
		-e "s/\([^[:alnum:]]\)\(-\{1,2\}[?[:alnum:]_-]\+\)\( \)\?\([?[:alnum:]_-]\+\)\?/\1$(tput setaf 5)\2$(tput sgr0)\3$(tput setaf 2)\4$(tput sgr0)/g" \
		-e "s/\(=\)\([?[:alnum:]_-.]\+\)/\1$(tput setaf 2)\2$(tput sgr0)/g" \
		-e "s/\(http:\/\/\)\([^/]\+\)\([^[:blank:]]\+\)/$(tput setaf 4)\1$(tput sgr0)$(tput setaf 6)\2$(tput sgr0)$(tput setaf 1)\3$(tput sgr0)/g" \
		-e "s/\([[:alnum:]_-]\+\)\+@\([[:alnum:]_-.]\+\)/$(tput setaf 1)\1$(tput sgr0)$(tput setaf 4)@$(tput sgr0)$(tput setaf 6)\2$(tput sgr0)/g" \
		-e "s/\([:,;.]\)\([[:blank:]]\)/$(tput setaf 1)\1$(tput sgr0)\2/g" \
		-e "s/\([:,;.]\)$/$(tput setaf 1)\1$(tput sgr0)/g" \
		-e "s/\(['\"=]\)/$(tput setaf 1)\1$(tput sgr0)/g" \
		-e "s/\(^\|[^-]\)\<\(Command\|command\|Program\|program\|License\|license\|Licensed\|licensed\|Usage\|usage\|Example\|example\|Arguments\|arguments\|Option\|option\|Options\|options\|Set\|set\|Sets\|sets\|Check\|check\|Checks\|checks\|Add\|add\|Show\|show\|Shows\|shows\|Use\|use\|Uses\|uses\|Add\|add\|Adds\|adds\|Remove\|remove\|Removes\|removes\|Complete\|complete\|Field\|field\|Fields\|fields\|Help\|help\|Execute\|execute\|Execution\|execution\|Runtime\|runtime\|Online\|online\|Default\|default\|Config\|config\|Configuration\|configuration\|Respect\|respect\|Term\|term\|Terms\|terms\|Service\|service\|Services\|services\|Name\|name\|Description\|description\|Explanation\|explanation\|Version\|version\|Package\|package\|Author\|author\|Day\|day\|Month\|month\|Year\|year\|Timestamp\|timestamp\|Examples\|examples\|Extrahelp\|extrahelp\|Extranotes\|extranotes\|Main\|main\|Man\|man\|Page\|page\\Manpage\|manpage\|Documentation\|documentation\|Mandatory\|mandatory\|Home Page\|home page\|Homepage\|homepage\|Author\|author\|Blog\|blog\|Email\|email\|Report\|report\|Information\|information\|Info\|info\|Informs\|informs\|Warning\|warning\|Warn\|warn\|Warns\|warns\|Standard\|standard\|Input\|input\|Output\|output\|Error\|error\|Read\|read\|Reads\|reads\|Write\|write\|Writes\|writes\|Print\|print\|Prints\|prints\|List\|list\|Lists\|lists\|File\|file\|Files\|files\|Terminal\|terminal\|Terminals\|terminals\|Profiles\|profiles\|Profile\|profile\|Color\|color\|Colors\|colors\|January\|February\|Monday\|\|Twesday\|Wednesday\|Thursday\|Friday\|Saturday\|Sunday\|March\|April\|May\|June\|July\|August\|September\|October\|November\|December\)\>/\1$(tput setaf 3)\2$(tput sgr0)/g" \
		-
	exit 0
}

# The punctuation profile
function tn_profile_punctuation
{
	sed \
		-e "s/\([[:digit:]]\+\)/$(tput setaf 4)\1$(tput sgr0)/g" \
		-e "s/\(GB\|MB\|KB\|[[:upper:]_]\{2,\}\|'[^']\+'\|\"[^\"]\+\"\|\`\`[^\']\+''\)/$(tput setaf 2)\1$(tput sgr0)/g" \
		-e "s/\(http:\/\/\)\([^/]\+\)\([^[:blank:]]\+\)/$(tput setaf 4)\1$(tput sgr0)$(tput setaf 6)\2$(tput sgr0)$(tput setaf 1)\3$(tput sgr0)/g" \
		-e "s/\([[:alnum:]_-]\+\)\+@\([[:alnum:]_-.]\+\)/$(tput setaf 1)\1$(tput sgr0)$(tput setaf 4)@$(tput sgr0)$(tput setaf 6)\2$(tput sgr0)/g" \
		-e "s/\([:,;.]\)\([[:blank:]]\)/$(tput setaf 1)\1$(tput sgr0)\2/g" \
		-e "s/\([:,;.]\)$/$(tput setaf 1)\1$(tput sgr0)/g" \
		-e "s/\(['\"=]\)/$(tput setaf 1)\1$(tput sgr0)/g" \
		-
	exit 0
}

# The info profile
function tn_profile_info
{
	tn_loop "-l 100" {1000..2000..100}
	# beep -f 200 -d 1 -r 5 -n -f 300 -d 10 -r 4 -n -f  400 -d 100 -r 3 
	exit 0
}

# The warning profile
function tn_profile_warning
{
	tn_profile 3 0
	exit 0
}

# The error profile
function tn_profile_error
{
	tn_loop "-l 100" {2000..1000..100}
	exit 0
}

# The vivid profile
function tn_profile_vivid
{
	tn_profile 2 0
	exit 0
}

# The smart profile
function tn_profile_smart
{
	tn_profile 5000 50 100 2
	exit 0
}

# The elegant profile
function tn_profile_elegant
{
	tn_profile 6 5
	exit 0
}

# The minimalist profile
function tn_profile_minimalist
{
	tn_profile 3 6
	exit 0
}

# The sharp profile
function tn_profile_sharp
{
	tn_profile 5 0
	exit 0
}

# The awesome profile
function tn_profile_awesome
{
	tn_profile 7 5
	exit 0
}

# The fancy profile
function tn_profile_fancy
{
	tn_profile 5000 50 100 2
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
	tn_profile 1 7
	exit 0
}

# The relax profile
function tn_profile_relax
{
	tn_profile 7 1
	exit 0
}

# The heaven profile
function tn_profile_heaven
{
	tn_profile 6 0
	exit 0
}

# The strong profile
function tn_profile_strong
{
	tn_profile 3 0
	exit 0
}

# The reverse profile
function tn_profile_reverse
{
	tn_profile 4 2
	exit 0
}

# The hidden profile
function tn_profile_hidden
{
	tn_profile 1 0
	exit 0
}

# The raw profile
function tn_profile_raw
{
	tn_profile 7 4
	exit 0
}

# The bold profile
function tn_profile_bold
{
	tput bold;
	cat -
	tput sgr0
	exit 0
}

# The reverse profile
function tn_profile_reverse
{
	tput rev;
	cat -
	tput sgr0
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

#The strip helper
function tn_strip
{
	sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g" -
}

# The --strip option
function tn_option_strip
{
	tn_strip="on"
}

# ... and colorize, the program itself.

# The cmd init function
function tn_init
{
	tn_foreground="green"
	tn_background="red"
	tn_match="^\(.*\)$"
	tn_terminal="off"
	tn_strip="off"
}

# The cmd main function
function tn_main
{
	if ! cmd_switch "$tn_strip"
	then
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
	else
		tn_strip "$@"
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
"/f/foreground/set foreground/tn_option_foreground/"
"/b/background/set background/tn_option_background/"
"/i/info/use info profile/tn_profile_info/"
"/w/warning/use warning profile/tn_profile_warning/"
"/e/error/use error profile/tn_profile_error/"
"/l:/line:/set line pattern/tn_option_line/LINE/"
"/m:/match:/set match pattern/tn_option_match/MATCH/"
"/p:/profile:/set profile/tn_option_profile/PROFILE/"
"/l/list/list profiles/tn_option_list/"
"/t/terminal/tone only if output is a terminal/tn_option_terminal/"
"/s/strip/remove any tone traces/tn_option_strip/"
)
cmd_examples=("$cmd --help | $cmd --profile help")
cmd_extrahelp="By default sets profile, else uses input profile (green foreground and red background). Tone aliases are understood: do/c, re/d, mi/e, fa/f, sol/g, la/a , si/b (6) and beep."
cmd_extranotes="For more information, check documentation."
cmd_init="tn_init"
cmd_main="tn_main"

cmd_datadir="[@]pkgdatadir[@]"

# The cmd environment
source "$cmd_datadir/cmd.sh"
