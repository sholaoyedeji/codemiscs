#! /usr/bin/env bash

#  _________________________________________________________________________________
# /\                                                                                \
# \_|           ___        __                            _   _                      |
#   |          |_ _|_ __  / _| ___  _ __ _ __ ___   __ _| |_(_) ___  _ __           |
#   |           | || '_ \| |_ / _ \| '__| '_ ` _ \ / _` | __| |/ _ \| '_ \          |
#   |           | || | | |  _| (_) | |  | | | | | | (_| | |_| | (_) | | | |         |
#   |          |___|_| |_|_|  \___/|_|  |_| |_| |_|\__,_|\__|_|\___/|_| |_|         |
#   |                                                                               |
#   |                       colorize (Colorize): Input Tinter                       |
#   |                Copyright (C) 2013 - 2014 Juan Manuel Borges Caño              |
#   |     The idea of colorizing commands output occurred to me multiple times.     |
#   |              After knowing Radovan Garabík's Generic Colouriser               |
#   |           <http://korpus.juls.savba.sk/~garabik/software/grc.html>,           |
#   | i got inspired to code an elegant, smart, fast and efficient filter solution. |
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

# The foreground option
function cl_option_foreground
{
	cl_foreground="$1"
}

# The --background option
function cl_option_background
{
	cl_background="$1"
}

# The profiles
cl_profiles=(input help info warning error punctuation vivid smart elegant minimalist sharp awesome fancy cool health relax heaven strong reverse hidden raw bold reverse)

# The --list option
function cl_option_list()
{
	for cl_profile in "${cl_profiles[@]}"
	do
		printf "%s\n" "$cl_profile"
	done
	exit 0
}

# The color helper
function cl_color
{
	case "$1" in
		"black") echo 0;;
		"red") echo 1;;
		"green") echo 2;;
		"yellow") echo 3;;
		"blue") echo 4;;
		"magenta") echo 5;;
		"cyan") echo 6;;
		"white") echo 7;;
		*) echo "$1";;
	esac
}

# The profile helper
function cl_profile
{
	sed \
		-e "s/^\(.*\)$/$(tput setaf $(cl_color "$1"); tput setab $(cl_color "$2");)\1$(tput sgr0)/g" \
		-
}

# The input profile
function cl_profile_input
{
	cl_profile "${cl_foreground:-green}" "${cl_background:-red}"
	exit 0
}

# The help profile
function cl_profile_help
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
function cl_profile_punctuation
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
function cl_profile_info
{
	cl_profile 2 0
	exit 0
}

# The warning profile
function cl_profile_warning
{
	cl_profile 3 0
	exit 0
}

# The error profile
function cl_profile_error
{
	cl_profile 1 0
	exit 0
}

# The vivid profile
function cl_profile_vivid
{
	cl_profile 2 0
	exit 0
}

# The smart profile
function cl_profile_smart
{
	cl_profile 2 4
	exit 0
}

# The elegant profile
function cl_profile_elegant
{
	cl_profile 6 5
	exit 0
}

# The minimalist profile
function cl_profile_minimalist
{
	cl_profile 3 6
	exit 0
}

# The sharp profile
function cl_profile_sharp
{
	cl_profile 5 0
	exit 0
}

# The awesome profile
function cl_profile_awesome
{
	cl_profile 7 5
	exit 0
}

# The fancy profile
function cl_profile_fancy
{
	cl_profile 2 1
	exit 0
}

# The cool profile
function cl_profile_cool
{
	cl_profile 2 5
	exit 0
}

# The health profile
function cl_profile_health
{
	cl_profile 1 7
	exit 0
}

# The relax profile
function cl_profile_relax
{
	cl_profile 7 1
	exit 0
}

# The heaven profile
function cl_profile_heaven
{
	cl_profile 6 0
	exit 0
}

# The strong profile
function cl_profile_strong
{
	cl_profile 3 0
	exit 0
}

# The reverse profile
function cl_profile_reverse
{
	cl_profile 4 2
	exit 0
}

# The hidden profile
function cl_profile_hidden
{
	cl_profile 1 0
	exit 0
}

# The raw profile
function cl_profile_raw
{
	cl_profile 7 4
	exit 0
}

# The bold profile
function cl_profile_bold
{
	tput bold;
	cat -
	tput sgr0
	exit 0
}

# The reverse profile
function cl_profile_reverse
{
	tput rev;
	cat -
	tput sgr0
	exit 0
}

# The --profile option
function cl_option_profile
{
	cl_profile_"$1"
}

# The --terminal option
function cl_option_terminal
{
	cl_terminal="on"
}

#The strip helper
function cl_strip
{
	sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g" -
}

# The --strip option
function cl_option_strip
{
	cl_strip="on"
}

# ... and colorize, the program itself.

# The cmd init function
function cl_init
{
	cl_foreground="green"
	cl_background="red"
	cl_terminal="off"
	cl_strip="off"
}

# The cmd main function
function cl_main
{
	if ! cmd_switch "$cl_strip"
	then
		if ! cmd_switch "$cl_terminal" || [[ -t 1 ]]
		then
			cl_profilesel="${1:-input}"
			for cl_profile in "${cl_profiles[@]}"
			do
				if [[ "$cl_profile" = "$cl_profilesel" ]]
				then
					shift
					"cl_profile_$cl_profile" "$@"
				fi
			done
			cmd_error "unknown profile"
		else
			cat -
		fi
	else
		cl_strip "$@"
	fi
}

# The cmd fields
cmd_package="[@]pkg[@]"
cmd="colorize"
cmd_name="colorize input"
cmd_version="[@]pkgversion[@]"
cmd_description="Input Tinter"
cmd_explanation="colorize input is a command that colorizes the input read from standard input. colorize uses profiles to select the color to apply to the input."
cmd_license="[@]pkglicense[@]"
cmd_homepage="[@]pkghomepage[@]"
cmd_author="[@]pkgauthor[@]"
cmd_blog="[@]pkgblog[@]"
cmd_email="[@]pkgemail[@]"
cmd_usage="$cmd [OPTIONS] [PROFILE]"
cmd_options=("/f:/foreground:/set foreground color/cl_option_foreground/COLOR/" "/b:/background:/set background color/cl_option_background/COLOR/" "/i/info/use info profile/cl_profile_info/" "/w/warning/use warning profile/cl_profile_warning/" "/e/error/use error profile/cl_profile_error/" "/p:/profile:/set profile/cl_option_profile/PROFILE/" "/l/list/list profiles/cl_option_list/" "/t/terminal/color only if output is a terminal/cl_option_terminal/" "/s/strip/remove any color traces/cl_option_strip/")
cmd_examples=("$cmd --help | $cmd --profile help")
cmd_extrahelp="By default sets profile, else uses input profile (green foreground and red background). Color aliases are understood: black (0), red (1), green (2), yellow (3), blue (4), magenta (5), cyan (6) and white (7)."
cmd_extranotes="For more information, check documentation."
cmd_init="cl_init"
cmd_main="cl_main"

cmd_datadir="[@]pkgdatadir[@]"

# The cmd environment
source "$cmd_datadir/cmd.sh"
