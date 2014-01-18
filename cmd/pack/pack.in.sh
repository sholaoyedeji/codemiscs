#! /usr/bin/env bash

#  _________________________________________________________________________
# /\                                                                        \
# \_|       ___        __                            _   _                  |
#   |      |_ _|_ __  / _| ___  _ __ _ __ ___   __ _| |_(_) ___  _ __       |
#   |       | || '_ \| |_ / _ \| '__| '_ ` _ \ / _` | __| |/ _ \| '_ \      |
#   |       | || | | |  _| (_) | |  | | | | | | (_| | |_| | (_) | | | |     |
#   |      |___|_| |_|_|  \___/|_|  |_| |_| |_|\__,_|\__|_|\___/|_| |_|     |
#   |                                                                       |
#   |       pack (Pack): Pack Package, package for multiple distribution    |
#   |              Copyright (C) 2014 Juan Manuel Borges Caño               |
#   |      This is needed because distribution packages are a mess of       |
#   |     polycies, guidelines, intricacies and unportability messes.       |
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

shopt -s extglob

# ... and pack, the program itself

# The cmd init function
function pack_init
{
	#shopt -s extglob
	#shopt -s nullglob
}

# The cmd main function
function pack_main
{
	cmd_error "not implemented"
}

# The cmd fields
cmd_package="[@]pkg[@]"
cmd="pack"
cmd_name="pack"
cmd_version="[@]pkgversion[@]"
cmd_description="Pack Package"
cmd_explanation="pack package is a program that packages a package for multiple distributions. pack generates the specific distribution information needed to build a package for a distribution"
cmd_license="[@]pkglicense[@]"
cmd_homepage="[@]pkghomepage[@]"
cmd_author="[@]pkgauthor[@]"
cmd_blog="[@]pkgblog[@]"
cmd_email="[@]pkgemail[@]"
cmd_usage="$cmd [OPTIONS] [MODE] [-- MODEOPTIONS]"
#cmd_options=("/l/list/list modes/pack_option_list/")
cmd_examples=("$cmd codemiscs.pack")
cmd_extrahelp="Respect the terms of use of online services."
cmd_extranotes="For more information, check documentation."
cmd_init="pack_init"
cmd_main="pack_main"

cmd_datadir="[@]pkgdatadir[@]"

# The cmd environment
source "$cmd_datadir/cmd.sh"
