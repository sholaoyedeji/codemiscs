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

# The --input-profile option
function cl_option_input_profile
{
	cl_option_relax_profile
	exit 0
}

# The --help-profile option
function cl_option_help_profile
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
		-e "s/\([^-]\)\<\(Command\|command\|Program\|program\|Usage\|usage\|Example\|example\|Arguments\|arguments\|Option\|option\|Options\|options\|Set\|set\|Show\|show\|Complete\|complete\|Help\|help\|Config\|config\|Configuration\|configuration\Version\|version\|Man\|man\|Page\|page\\Manpage\|manpage\|Documentation\|documentation\|Mandatory\|mandatory\|Home Page\|home page\|Homepage\|homepage\|Author\|author\|Blog\|blog\|Email\|email\|Report\|report\|Information\|information\|January\|February\|March\|April\|May\|June\|July\|August\|September\|October\|November\|December\)\>/\1$(tput setaf 3)\2$(tput sgr0)/g" \
		-
	exit 0
}

# The --info-profile option
function cl_option_info_profile
{
	cl_profile 2 4
	exit 0
}

# The --warning-profile option
function cl_option_warning_profile
{
	cl_profile 7 1
	exit 0
}

# The --error-profile option
function cl_option_error_profile
{
	cl_profile 2 1
	exit 0
}

# The --hidden-profile option
function cl_option_hidden_profile
{
	cl_profile 1 0
	exit 0
}

# The --health-profile option
function cl_option_health_profile
{
	cl_profile 1 7
	exit 0
}

# The --vivid-profile option
function cl_option_vivid_profile
{
	cl_profile 2 0
	exit 0
}

# The --fancy-profile option
function cl_option_fancy_profile
{
	cl_profile 2 1
	exit 0
}

# The --cool-profile option
function cl_option_cool_profile
{
	cl_profile 2 5
	exit 0
}

# The --reverse-profile option
function cl_option_reverse_profile
{
	cl_profile 4 2
	exit 0
}

# The --strong-profile option
function cl_option_strong_profile
{
	cl_profile 3 0
	exit 0
}

# The --sharp-profile option
function cl_option_sharp_profile
{
	cl_profile 5 0
	exit 0
}

# The --heaven-profile option
function cl_option_heaven_profile
{
	cl_profile 6 0
	exit 0
}

# The --elegant-profile option
function cl_option_elegant_profile
{
	cl_profile 6 5
	exit 0
}

# The --minimalist-profile option
function cl_option_minimalist_profile
{
	cl_profile 3 6
	exit 0
}

# The --relax-profile option
function cl_option_relax_profile
{
	cl_profile 7 1
	exit 0
}

# The --raw-profile option
function cl_option_raw_profile
{
	cl_profile 7 4
	exit 0
}

# The --awesome-profile option
function cl_option_awesome_profile
{
	cl_profile 7 5
	exit 0
}

# The --bold-profile option
function cl_option_bold_profile
{
	tput bold;
	cat -
	tput sgr0
	exit 0
}

# ... and colorize, the program itself.

# The cmd init function
function cl_init
{
	cl_foreground=2
	cl_background=1
}

# The cmd main function
function cl_main
{
	cl_profile
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
cmd_usage="$cmd [OPTIONS]"
cmd_examples=("$cmd --help | $cmd --help-profile")
cmd_options=(
	"/f:/foreground:/set foreground color/cl_option_foreground/COLOR/"
	"/b:/background:/set background color/cl_option_background/COLOR/"
	"/i/input-profile/use input profile/cl_option_input_profile/"
	"/p/help-profile/use help profile/cl_option_help_profile/"
	"/n/info-profile/use info profile/cl_option_info_profile/"
	"/w/warning-profile/use warning profile/cl_option_warning_profile/"
	"/e/error-profile/use error profile/cl_option_error_profile/"
	"/v/vivid-profile/use vivid profile/cl_option_vivid_profile/"
	"/l/health-profile/use health profile/cl_option_health_profile/"
	"/l/hidden-profile/use hidden profile/cl_option_hidden_profile/"
	"/y/fancy-profile/use fancy profile/cl_option_fancy_profile/"
	"/c/cool-profile/use cool profile/cl_option_cool_profile/"
	"/r/reverse-profile/use reverse profile/cl_option_reverse_profile/"
	"/s/strong-profile/use strong profile/cl_option_strong_profile/"
	"/p/sharp-profile/use sharp profile/cl_option_sharp_profile/"
	"/a/heaven-profile/use heaven profile/cl_option_heaven_profile/"
	"/g/elegant-profile/use elegant profile/cl_option_elegant_profile/"
	"/m/minimalist-profile/use minimalist profile/cl_option_minimalist_profile/"
	"/x/relax-profile/use relax profile/cl_option_relax_profile/"
	"/r/raw-profile/use raw profile/cl_option_raw_profile/"
	"/o/awesome-profile/use awesome profile/cl_option_awesome_profile/"
	"/b/bold-profile/use bold profile/cl_option_bold_profile/"
)
cmd_extrahelp="By default uses foreground 2, background 1 colors."
cmd_extranotes="For more information, check man documentation."
cmd_init="cl_init"
cmd_main="cl_main"

cmd_datadir="[@]pkgdatadir[@]"

# The cmd environment
source "$cmd_datadir/cmd.sh"
