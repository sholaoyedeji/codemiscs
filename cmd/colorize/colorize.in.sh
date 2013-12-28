#! /usr/bin/env bash

# colorize (Colorize): Input Tinter
# Copyright (C) 2013 Juan Manuel Borges Caño
# The idea of colorizing commands output occurred to me multiple times. After knowing the Radovan Garabík Generic Colouriser <http://korpus.juls.savba.sk/~garabik/software/grc.html>, i got inspired to code an elegant, smart, fast and efficient filter solution.

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

# The profile option helper
function cl_profile
{
	sed \
		-e "s/^\(.*\)$/$(tput setaf ${1:-$cl_foreground}; tput setab ${2:-$cl_background};)\1$(tput sgr0)/g" \
		-
}

# The profiles
cl_profiles=(input help info warning error vivid smart elegant minimalist sharp awesome fancy cool health relax heaven strong reverse hidden raw bold)

# The --list option
function cl_option_list()
{
	for cl_profile in "${cl_profiles[@]}"
	do
		printf "%s\n" "$cl_profile"
	done
	exit 0
}

# The input profile
function cl_profile_input
{
	cl_profile
	exit 0
}

# The help profile
function cl_profile_help
{
	# December 4th, 2013, Juan Manuel Borges Caño
#
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
		-e "s/\(^\|[^-]\)\<\(Command\|command\|Program\|program\|Usage\|usage\|Example\|example\|Arguments\|arguments\|Option\|option\|Options\|options\|Set\|set\|Show\|show\|Complete\|complete\|Help\|help\|Execute\|execute\|Execution\|execution\|Config\|config\|Configuration\|configuration\Version\|version\|Man\|man\|Page\|page\\Manpage\|manpage\|Documentation\|documentation\|Mandatory\|mandatory\|Home Page\|home page\|Homepage\|homepage\|Author\|author\|Blog\|blog\|Email\|email\|Report\|report\|Information\|information\|January\|February\|March\|April\|May\|June\|July\|August\|September\|October\|November\|December\)\>/\1$(tput setaf 3)\2$(tput sgr0)/g" \
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

# The --profile option
function cl_option_profile
{
	cl_profile_"$1"
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

# The --terminal option
function cl_option_terminal
{
	cl_terminal="on"
}

# ... and colorize, the program itself.

# The cmd init function
function cl_init
{
	cl_foreground=2
	cl_background=1
	cl_strip="off"
	cl_terminal="off"
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
cmd="colorize"
cmd_name="colorize input"
cmd_description="Input Tinter"
cmd_explanation="colorize input is a command that colorizes the input read from standard input. colorize uses profiles to select the color to apply to the input."
cmd_version="[@]pkgversion[@]"
cmd_author="[@]pkgauthor[@]"
cmd_homepage="[@]pkghomepage[@]"
cmd_blog="[@]pkgblog[@]"
cmd_email="[@]pkgemail[@]"
cmd_usage="$cmd [OPTIONS] [PROFILE]"
cmd_examples=("$cmd --help | $cmd --profile help")
cmd_options=("/f:/foreground:/set foreground color/cl_option_foreground/COLOR/" "/b:/background:/set background color/cl_option_background/COLOR/" "/l/list/list profiles/cl_option_list/" "/p:/profile:/set profile/cl_option_profile/PROFILE/" "/t/terminal/color only if output is a terminal/cl_option_terminal/" "/s/strip/remove any color traces/cl_option_strip/" "/i/info/use info profile/cl_profile_info/" "/w/warning/use warning profile/cl_profile_warning/" "/e/error/use error profile/cl_profile_error/")
cmd_extrahelp="By default sets profile and uses colors foreground = 2 and background = 1."
cmd_extranotes="For more information, check man documentation."
cmd_init="cl_init"
cmd_main="cl_main"

cmd_datadir="[@]pkgdatadir[@]"

# The cmd environment
source "$cmd_datadir/cmd.sh"
