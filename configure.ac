AC_INIT([code miscellaneous], [0.9.0], [juanmabcmail@gmail.com], [codemiscs])
AM_INIT_AUTOMAKE(no-dist-gzip dist-bzip2)

AC_SUBST(PACKAGE_AUTHOR, "Juan Manuel Borges Caño")
AC_SUBST(PACKAGE_DESCRIPTION, "code miscellaneous")
AC_SUBST(PACKAGE_EXPLANATION, "No explanation for it to be")
AC_SUBST(PACKAGE_HOMEPAGE, "http://code.google.com/p/codemiscs")
AC_SUBST(PACKAGE_MONTH, $(LANG=C date '+%B'))
AC_SUBST(PACKAGE_YEAR, $(LANG=C date '+%Y'))
AC_SUBST(PACKAGE_PARSE, ["sed -e 's,\@<:@@\@:>@pkg\@<:@@\@:>@,\$(PACKAGE),g' -e 's,\@<:@@\@:>@pkgname\@<:@@\@:>@,\$(PACKAGE_NAME),g' -e 's,\@<:@@\@:>@pkgversion\@<:@@\@:>@,\$(PACKAGE_VERSION),g' -e 's,\@<:@@\@:>@pkgauthor\@<:@@\@:>@,\$(PACKAGE_AUTHOR),g' -e 's,\@<:@@\@:>@pkgmonth\@<:@@\@:>@,\$(PACKAGE_MONTH),g' -e 's,\@<:@@\@:>@pkgyear\@<:@@\@:>@,\$(PACKAGE_YEAR),g' -e 's,\@<:@@\@:>@pkghomepage\@<:@@\@:>@,\$(PACKAGE_HOMEPAGE),g' -e 's,\@<:@@\@:>@pkgbugreport\@<:@@\@:>@,\$(PACKAGE_BUGREPORT),g' -e 's,\@<:@@\@:>@pkgdescription\@<:@@\@:>@,\$(PACKAGE_DESCRIPTION),g' -e 's,\@<:@@\@:>@pkgexplanation\@<:@@\@:>@,\$(PACKAGE_EXPLANATION),g' -e 's,\@<:@@\@:>@pkgdatadir\@<:@@\@:>@,\$(pkgdatadir),g'"])

# Checks for programs.
AC_PROG_CXX

AC_CHECK_PROG(HAVE_SED, sed, yes)
[[ -z $HAVE_SED ]] && AC_MSG_ERROR(sed is needed at compile time)

AC_CHECK_PROG(HAVE_BASH, bash, yes)
[[ -z $HAVE_BASH ]] && AC_MSG_ERROR(bash is needed at execution time)

AC_CHECK_PROG(HAVE_GETOPT, getopt, yes)
[[ -z $HAVE_GETOPT ]] && AC_MSG_WARN(getopt is needed at execution time)

AC_CHECK_PROG(HAVE_GAWK, gawk, yes)
[[ -z $HAVE_GAWK ]] && AC_MSG_WARN(gawk is needed at execution time)

AC_CHECK_PROG(HAVE_AUTORECONF, autoreconf, yes)
[[ -z $HAVE_AUTORECONF ]] && AC_MSG_WARN(autoreconf is needed at execution time)

AC_CHECK_PROG(HAVE_CURL, curl, yes)
[[ -z $HAVE_CURL ]] && AC_MSG_WARN(curl is needed at execution time)

AC_CHECK_PROG(HAVE_ICONV, iconv, yes)
[[ -z $HAVE_ICONV ]] && AC_MSG_WARN(iconv is needed at execution time)

# AC_CHECK_PROG(HAVE_RECODE, recode, yes)
# [[ -z $HAVE_RECODE ]] && AC_MSG_WARN(recode is needed at execution time)

AC_CHECK_PROG(HAVE_XMLLINT, xmllint, yes)
[[ -z $HAVE_XMLLINT ]] && AC_MSG_WARN(xmllint is needed at execution time)

AC_CHECK_PROG(HAVE_XMLSTARLET, xmlstarlet, yes)
[[ -z $HAVE_XMLSTARLET ]] && AC_MSG_WARN(xmlstarlet is needed at execution time)

AC_CHECK_PROG(HAVE_LYNX, lynx, yes)
[[ -z $HAVE_LYNX ]] && AC_MSG_WARN(lynx is needed at execution time)

AC_CHECK_PROG(HAVE_ASPELL, aspell, yes)
[[ -z $HAVE_ASPELL ]] && AC_MSG_WARN(aspell is needed at execution time)
AM_CONDITIONAL(ASPELL, [ test x$HAVE_ASPELL = xyes ])

AC_CHECK_PROG(HAVE_ESPEAK, espeak, yes)
[[ -z $HAVE_ESPEAK ]] && AC_MSG_WARN(espeak is needed at execution time)
AM_CONDITIONAL(ESPEAK, [ test x$HAVE_ESPEAK = xyes ])

# Checks for libraries.
HUNSPELL_MODULES="hunspell"
PKG_CHECK_MODULES(HUNSPELL, $HUNSPELL_MODULES, HAVE_HUNSPELL=yes, HAVE_UNSPELL=no)
AC_SUBST(HUNSPELL_CFLAGS)
AC_SUBST(HUNSPELL_LIBS)
MYTHES_MODULES="mythes"
PKG_CHECK_MODULES(MYTHES, $MYTHES_MODULES, HAVE_MYTHES=yes, HAVE_MYTHES=no)
AC_SUBST(MYTHES_CFLAGS)
AC_SUBST(MYTHES_LIBS)
AM_CONDITIONAL(MYTHES, [test x$HAVE_HUNSPELL = xyes -a  x$HAVE_MYTHES = xyes])


# Checks for header files.

# Checks for typedefs, structures, and compiler characteristics.

# Checks for library functions.

AC_CONFIG_FILES([Makefile cmd/Makefile mkproject/Makefile tw/Makefile rf/Makefile colorize/Makefile imgs/Makefile typewriter/Makefile data/Makefile doc/Makefile dist/Makefile])
AC_OUTPUT
