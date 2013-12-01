# python: mkproject python skeleton
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

mps_mkdir "$mps_tarname"

mps_cat "$mps_tarname/configure.ac" <<EOF
AC_INIT([$mps_pkgname], [0.0.0], [$mps_bugreport], [$mps_tarname])
AM_INIT_AUTOMAKE(no-dist-gzip dist-bzip2)

AC_SUBST(PACKAGE_AUTHOR, ["$mps_author"])
AC_SUBST(PACKAGE_DESCRIPTION, ["$mps_description"])
AC_SUBST(PACKAGE_HOMEPAGE, ["$mps_homepage"])
AC_SUBST(PACKAGE_MONTH, [\$(LANG=C date '+%B')])
AC_SUBST(PACKAGE_YEAR, [\$(LANG=C date '+%Y')])

# Checks for programs.
AM_PATH_PYTHON

# Checks for libraries.

# Checks for header files.

# Checks for typedefs, structures, and compiler characteristics.

# Checks for library functions.

AC_CONFIG_FILES([Makefile src/Makefile])
AC_OUTPUT
EOF

mps_cat "$mps_tarname/Makefile.am" <<EOF
SUBDIRS = src
dist_doc_DATA = AUTHORS ChangeLog NEWS README COPYING
EOF

mps_doc "$mps_tarname"

mps_mkdir "$mps_tarname/src"

mps_cat "$mps_tarname/src/Makefile.am" <<EOF
bin_SCRIPTS = $mps_tarname
EXTRA_DIST = main.py
CLEANFILES = \$(bin_SCRIPTS)

${mps_tarname}: main.py Makefile
	cp \$(srcdir)/main.py $mps_tarname
	chmod +x $mps_tarname
EOF

mps_cat "$mps_tarname/src/main.py" <<EOF
#! /usr/bin/env python
print "Hello world!"
EOF

mps_exec "autoreconf -i" "$mps_tarname"
