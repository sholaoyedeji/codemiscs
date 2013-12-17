#! /usr/bin/env bash

# colorize: Help Tinter (Early stages)
# Copyright (C) 2012-2013 Juan Manuel Borges Caño

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

# The --help-profile option
function cl_option_help_profile
{
	# December 4th, 2013, Juan Manuel Borges Caño
	sed \
		-e "s/\([[:digit:]]\+\)/$(tput setaf 4)\1$(tput sgr0)/g" \
		-e "s/\(GB\|MB\|KB\|[[:upper:]_]\{2,\}\|'[^']\+'\|\"[^\"]\+\"\|\`\`[^\']\+''\)/$(tput setaf 2)\1$(tput sgr0)/g" \
		-e "s/\(=\)\([?[:alnum:]_-.]\+\)/\1$(tput setaf 2)\2$(tput sgr0)/g" \
		-e "s/\([^[:alnum:]]\)\(-\{1,2\}[?[:alnum:]_-]\+\)\( \)\?\([?[:alnum:]_-]\+\)\?/\1$(tput setaf 5)\2$(tput sgr0)\3$(tput setaf 2)\4$(tput sgr0)/g" \
		-e "s/\([[:alnum:]_-]\+\)\+@\([[:alnum:]_-.]\+\)/$(tput setaf 1)\1$(tput sgr0)@$(tput setaf 4)\2$(tput sgr0)/g" \
		-e "s/\(http:\/\/\)\([^/]\+\)\([^[:blank:]]\+\)/$(tput setaf 1)\1$(tput sgr0)$(tput setaf 6)\2$(tput sgr0)$(tput setaf 4)\3$(tput sgr0)/g" \
		-e "s/\(Arguments\|arguments\|Options\|options\|Complete\|complete\|Help\|help\|Documentation\|documentation\|Mandatory\|mandatory\|Home Page\|home page\|Homepage\|Report\|report\)/$(tput setaf 3)\1$(tput sgr0)/g" \
		-
	exit 0
}

# The --input-profile option
function cl_option_input_profile
{
	# December 17th, 2013, Juan Manuel Borges Caño
#	sed \
#		-e "s/\([[:digit:]]\+\)/$(tput setaf 4)\1$(tput sgr0)/g" \
#		-e "s/\(GB\|MB\|KB\|[[:upper:]_]\{2,\}\|'[^']\+'\|\"[^\"]\+\"\|\`\`[^\']\+''\)/$(tput setaf 2)\1$(tput sgr0)/g" \
#		-e "s/\(=\)\([?[:alnum:]_-.]\+\)/\1$(tput setaf 2)\2$(tput sgr0)/g" \
#		-e "s/\([^[:alnum:]]\)\(-\{1,2\}[?[:alnum:]_-]\+\)\( \)\?\([?[:alnum:]_-]\+\)\?/\1$(tput setaf 5)\2$(tput sgr0)\3$(tput setaf 2)\4$(tput sgr0)/g" \
#		-e "s/\([[:alnum:]_-]\+\)\+@\([[:alnum:]_-.]\+\)/$(tput setaf 1)\1$(tput sgr0)@$(tput setaf 4)\2$(tput sgr0)/g" \
#		-e "s/\(http:\/\/\)\([^/]\+\)\([^[:blank:]]\+\)/$(tput setaf 1)\1$(tput sgr0)$(tput setaf 6)\2$(tput sgr0)$(tput setaf 4)\3$(tput sgr0)/g" \
#		-e "s/\(Arguments\|arguments\|Options\|options\|Complete\|complete\|Help\|help\|Documentation\|documentation\|Mandatory\|mandatory\|Home Page\|home page\|Homepage\|Report\|report\)/$(tput setaf 3)\1$(tput sgr0)/g" \
#		-
	sed \
		-e "s/^\(.*\)$/$(tput setaf 2)\1$(tput sgr0)/g" \
		-
	exit 0
}

# ... and colorize, the program itself.

# The cmd init function
function cl_init
{
	:
}

# The cmd main function
function cl_main
{
	cl_option_help_profile "$@"
}

# The cmd fields
cmd="colorize"
cmd_name="colorize input"
cmd_description="Input Tinter"
cmd_explanation="colorize input is a command that colorizes the input read from standard input. colorize uses profiles to select the color to apply to the input."
cmd_version="[@]pkgversion[@]"
cmd_author="[@]pkgauthor[@]"
cmd_bugreport="[@]pkgbugreport[@]"
cmd_homepage="[@]pkghomepage[@]"
cmd_usage="$cmd [OPTIONS]"
cmd_examples=("$cmd --help | $cmd")
cmd_options=("/e/help-profile/use help profile colorizer/cl_option_help_profile/" "/i/input-profile/use input profile colorizer/cl_option_input_profile")
cmd_extrahelp="By default uses help profile."
cmd_extranotes="For more information, check man documentation."
cmd_init="cl_init"
cmd_main="cl_main"

cmd_datadir="[@]pkgdatadir[@]"

# The cmd environment
source "$cmd_datadir/cmd.sh"
