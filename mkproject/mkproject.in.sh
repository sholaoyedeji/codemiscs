#! /usr/bin/env bash

# mkproject: make project skeletons
# Copyright (C) 2007-2012 Juan Manuel Borges Caño

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

# The --list option
function mp_list
{
	shopt -s nullglob

	for mp_skeleton in "$cmd_datadir/skeletons"/*.sh
	do
		mp_skeleton="${mp_skeleton##*/}"
		mp_skeleton="${mp_skeleton%%.*}"
		printf "%s\n" "$mp_skeleton"
	done
	exit 0
}

# The --skeleton option
function mp_skeleton
{
	mps_skeleton="$1"
}

# The --tarname option
function mp_tarname
{
	mps_tarname="$1"
}

# The --pkgname option
function mp_pkgname
{
	mps_pkgname="$1"
}

# The --description option
function mp_description
{
	mps_description="$1"
}

# The --author option
function mp_author
{
	mps_author="$1"
}

# The --bugreport option
function mp_bugreport
{
	mps_bugreport="$1"
}

# The --homepage option
function mp_homepage
{
	mps_homepage="$1"
}

# The --dependencies option
function mp_dependencies
{
	mps_dependencies="$1"
}

# The --verbose option
function mp_verbose
{
	mp_verbose="0"
}

# ... and mkproject, the program itself

# The cmd init function
function mp_init
{
	mps_skeleton=""
	mps_tarname=""
	mps_pkgname=""
	mps_description=""
	mps_author=""
	mps_bugreport=""
	mps_homepage=""
	mps_dependencies=""
	mp_verbose="1"
}

# The cmd main function
function mp_main
{
	if [[ -z "$mps_skeleton" ]]
		then cmd_error "skeleton not specified"
	else
		if [[ ! -f "$cmd_datadir/skeletons/$mps_skeleton.sh" ]]
			then cmd_error "unknown skeleton"
		fi
	fi
	if [[ -z "$mps_tarname" ]]
		then cmd_error "tar name not specified"
	fi
	if [[ -z "$mps_pkgname" ]]
		then mps_pkgname="$mps_tarname"
	fi
	if [[ -z "$mps_description" ]]
		then mps_description="@description@"
	fi
	if [[ -z "$mps_author" ]]
		then mps_author="$(grep "$(whoami)" /etc/passwd | cut -d':' -f5 | cut -d',' -f1)"
		if [[ -z "$mps_author" ]]
			then mps_author="@author@"
		fi
	fi
	if [[ -z "$mps_bugreport" ]]
		then mps_bugreport="@bugreport@"
	fi
	if [[ -z "$mps_homepage" ]]
		then mps_homepage="@homepage@"
	fi

	mps_date="$(LANG=C date "+%F")"

	source "$cmd_datadir/mps.sh"
	source "$cmd_datadir/skeletons/$mps_skeleton.sh"
}

# The cmd fields
cmd="mkproject"
cmd_name="make project"
cmd_description="Project Generator"
cmd_explanation="make project is a command that makes project skeletons. mkproject automatizes the task of starting a new project with the information provided from the command line. The package created by default is a 'hello world' project of the selected skeleton that is managed with autotools. There are skeletons for bash, c, c library, python, c++, c++ library and perl."
cmd_version="[@]pkgversion[@]"
cmd_author="[@]pkgauthor[@]"
cmd_bugreport="[@]pkgbugreport[@]"
cmd_homepage="[@]pkghomepage[@]"
cmd_usage="$cmd [OPTIONS]"
cmd_examples=("$cmd -s bash -t test")
cmd_options=("/l/list/list skeletons/mp_list/" "/s:/skeleton:/set skeleton type/mp_skeleton/SKELETON/" "/t:/tarname:/set tar name/mp_tarname/TARNAME/" "/p:/pkgname:/set package name/mp_pkgname/PKGNAME/" "/d:/description:/set short description/mp_description/DESCRIPTION/" "/a:/author:/set author/mp_author/AUTHOR/" "/b:/bugreport:/set bug report address/mp_bugreport/BUGREPORT/" "/m:/homepage:/set homepage url/mp_homepage/HOMEPAGE/" "/n:/dependencies:/set dependencies/mp_dependencies/DEPENDENCIES/" "/r/verbose/show progress messages/mp_verbose/")
cmd_extrahelp="Skeleton and Tar Name are obligatory, the rest are recommended, dependencies is optional."
cmd_extranotes="For more information, check man documentation."
cmd_init="mp_init"
cmd_main="mp_main"

cmd_datadir="[@]pkgdatadir[@]"

# The cmd environment
source "$cmd_datadir/cmd.sh"
