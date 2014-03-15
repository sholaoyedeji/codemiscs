# mp: mkproject skeleton utils 
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

mps_error_log=$(mktemp)

# The verbose helper
function mps_verbose
{
	if cmd_switch "$mp_verbose"
	then
		"$@"
	fi
}


# The report helper
function mps_report
{
	if [[ "$?" = "0" ]]
	then
		mps_verbose printf "%s\n" "done"
	else
		mps_verbose printf "%s\n" "error"
		if [[ -n "$1" ]]
			then sed -e "s,^,$cmd: ," "$1" >&2
		fi
		cmd_info >&2
		exit 1
	fi
}

# The mkdir helper
function mps_mkdir
{
	if [[ -a "$1" ]]
	then
		cmd_error "${1##*/}: file exists"
	else
		mps_verbose printf "Creating directory \`"${1##*/}"'..."
			mkdir "$1" 2>> "$mps_error_log"
		mps_report "$mps_error_log"
	fi
}

# The cat helper
function mps_cat
{
	if [[ -a "$1" ]]
	then
		cmd_error "$1: file exists"
	else
		mps_verbose printf "Creating file \`$1'..."
			cat - > "$1" 2>> "$mps_error_log"
		mps_report "$mps_error_log"
	fi
}


# The exec helper
function mps_exec
{
	mps_verbose printf "Executing command \`$1' (see \`$cmd.log')..."
		cd "$2" && { $1 2>&1 | sed -e "s,^,$1: ," >> "$cmd.log" 2>> "$mps_error_log"; cd ..; }
	mps_report "$mps_error_log"
}

# The doc helper
function mps_doc
{
mps_cat "$mps_tarname/README" <<EOF
$mps_pkgname: $mps_description

Copyright (C) ${mps_date%%-*} $mps_author

	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <http://www.gnu.org/licenses/>.

$mps_tarname ($mps_pkgname) homepage <$mps_homepage>
EOF

mps_cat "$mps_tarname/AUTHORS" <<EOF
$mps_author <$mps_bugreport>
EOF

mps_cat "$mps_tarname/ChangeLog" <<EOF
$mps_date $mps_author <$mps_bugreport>
	* ChangeLog start
EOF

mps_cat "$mps_tarname/NEWS" <<EOF
$mps_date:
	* Project start
EOF
}
