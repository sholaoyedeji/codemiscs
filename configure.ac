AC_INIT([code miscellaneous], [2013.12.28], [juanmabcmail@gmail.com], [codemiscs], ["http://code.google.com/p/codemiscs/"])
AM_INIT_AUTOMAKE(no-dist-gzip dist-bzip2)

AC_SUBST(PACKAGE_AUTHOR, "Juan Manuel Borges Caño")
AC_SUBST(PACKAGE_DESCRIPTION, "code miscellaneous")
AC_SUBST(PACKAGE_EXPLANATION, ["Code Miscellaneous is a fun, creative, elegant, exciting, amusing, usefule and profitable project."])
AC_SUBST(PACKAGE_HOMEPAGE, "http://code.google.com/p/codemiscs")
AC_SUBST(PACKAGE_BLOG, "http://juanmabcblog.blogspot.com")
AC_SUBST(PACKAGE_EMAIL, "juanmabcmail@gmail.com")
AC_SUBST(PACKAGE_MONTH, $(LANG=C date '+%B'))
AC_SUBST(PACKAGE_YEAR, $(LANG=C date '+%Y'))
AC_SUBST(PACKAGE_PARSE, ["sed -e 's,\@<:@@\@:>@pkg\@<:@@\@:>@,\$(PACKAGE),g' -e 's,\@<:@@\@:>@pkgname\@<:@@\@:>@,\$(PACKAGE_NAME),g' -e 's,\@<:@@\@:>@pkgversion\@<:@@\@:>@,\$(PACKAGE_VERSION),g' -e 's,\@<:@@\@:>@pkgauthor\@<:@@\@:>@,\$(PACKAGE_AUTHOR),g' -e 's,\@<:@@\@:>@pkgmonth\@<:@@\@:>@,\$(PACKAGE_MONTH),g' -e 's,\@<:@@\@:>@pkgyear\@<:@@\@:>@,\$(PACKAGE_YEAR),g' -e 's,\@<:@@\@:>@pkghomepage\@<:@@\@:>@,\$(PACKAGE_HOMEPAGE),g' -e 's,\@<:@@\@:>@pkgblog\@<:@@\@:>@,\$(PACKAGE_BLOG),g' -e 's,\@<:@@\@:>@pkgemail\@<:@@\@:>@,\$(PACKAGE_EMAIL),g' -e 's,\@<:@@\@:>@pkgdescription\@<:@@\@:>@,\$(PACKAGE_DESCRIPTION),g' -e 's?\@<:@@\@:>@pkgexplanation\@<:@@\@:>@?\$(PACKAGE_EXPLANATION)?g' -e 's,\@<:@@\@:>@pkgdatadir\@<:@@\@:>@,\$(pkgdatadir),g' -e 's,\@<:@@\@:>@pkgaspell\@<:@@\@:>@,\$(PACKAGE_ASPELL),g' -e 's,\@<:@@\@:>@pkgespeak\@<:@@\@:>@,\$(PACKAGE_ESPEAK),g' -e 's,\@<:@@\@:>@pkghunspell\@<:@@\@:>@,\$(PACKAGE_HUNSPELL),g' -e 's,\@<:@@\@:>@pkgmythes\@<:@@\@:>@,\$(PACKAGE_MYTHES),g' -e 's,\@<:@@\@:>@pkgogg123\@<:@@\@:>@,\$(PACKAGE_OGG123),g'"])

# Checks for programs.
AC_PROG_CXX

#AC_CHECK_PROG(PACKAGE_BC, bc, yes)
#[[ -z $PACKAGE_BC ]] && AC_MSG_WARN(bc is needed at execution time)

AC_CHECK_PROG(PACKAGE_BASH, bash, yes)
[[ -z $PACKAGE_BASH ]] && AC_MSG_ERROR(bash is needed at execution time)

AC_CHECK_PROG(PACKAGE_SED, sed, yes)
[[ -z $PACKAGE_SED ]] && AC_MSG_ERROR(sed is needed at compile time)

AC_CHECK_PROG(PACKAGE_GAWK, gawk, yes)
[[ -z $PACKAGE_GAWK ]] && AC_MSG_WARN(gawk is needed at execution time)

AC_CHECK_PROG(PACKAGE_PERL, perl, yes)
[[ -z $PACKAGE_PERL ]] && AC_MSG_ERROR(perl is needed at execution time)

AC_CHECK_PROG(PACKAGE_GETOPT, getopt, yes)
[[ -z $PACKAGE_GETOPT ]] && AC_MSG_WARN(getopt is needed at execution time)

AC_CHECK_PROG(PACKAGE_AUTORECONF, autoreconf, yes)
[[ -z $PACKAGE_AUTORECONF ]] && AC_MSG_WARN(autoreconf is needed at execution time)

AC_CHECK_PROG(PACKAGE_ICONV, iconv, yes)
[[ -z $PACKAGE_ICONV ]] && AC_MSG_WARN(iconv is needed at execution time)

# AC_CHECK_PROG(PACKAGE_RECODE, recode, yes)
# [[ -z $PACKAGE_RECODE ]] && AC_MSG_WARN(recode is needed at execution time)

AC_CHECK_PROG(PACKAGE_ASPELL, aspell, yes)
[[ -z $PACKAGE_ASPELL ]] && AC_MSG_WARN(aspell is needed at execution time)
AM_CONDITIONAL(ASPELL, [ test x$PACKAGE_ASPELL = xyes ])

AC_CHECK_PROG(PACKAGE_FORTUNE, fortune, yes)
[[ -z $PACKAGE_FORTUNE ]] && AC_MSG_WARN(fortune is needed at execution time)

AC_CHECK_PROG(PACKAGE_TPUT, tput, yes)
[[ -z $PACKAGE_TPUT ]] && AC_MSG_WARN(tput is needed at execution time)

AC_CHECK_PROG(PACKAGE_FIGLET, figlet, yes)
[[ -z $PACKAGE_FIGLET ]] && AC_MSG_WARN(figlet is needed at execution time)

AC_CHECK_PROG(PACKAGE_COWSAY, cowsay, yes)
[[ -z $PACKAGE_COWSAY ]] && AC_MSG_WARN(cowsay is needed at execution time)

AC_CHECK_PROG(PACKAGE_BOXES, boxes, yes)
[[ -z $PACKAGE_BOXES ]] && AC_MSG_WARN(boxes is needed at execution time)

AC_CHECK_PROG(PACKAGE_FESTIVAL, festival, yes)
[[ -z $PACKAGE_FESTIVAL ]] && AC_MSG_WARN(festival is needed at execution time)

AC_CHECK_PROG(PACKAGE_ESPEAK, espeak, yes)
[[ -z $PACKAGE_ESPEAK ]] && AC_MSG_WARN(espeak is needed at execution time)
AM_CONDITIONAL(ESPEAK, [ test x$PACKAGE_ESPEAK = xyes ])

AC_CHECK_PROG(PACKAGE_CONVERT, convert, yes)
[[ -z $PACKAGE_CONVERT ]] && AC_MSG_WARN(convert is needed at execution time)

AC_CHECK_PROG(PACKAGE_OGG123, ogg123, yes)
[[ -z $PACKAGE_OGG123 ]] && AC_MSG_WARN(ogg123 is needed at execution time)
AM_CONDITIONAL(OGG123, [ test x$PACKAGE_OGG123 = xyes ])

AC_CHECK_PROG(PACKAGE_CURL, curl, yes)
[[ -z $PACKAGE_CURL ]] && AC_MSG_WARN(curl is needed at execution time)

AC_CHECK_PROG(PACKAGE_WGET, wget, yes)
[[ -z $PACKAGE_WGET ]] && AC_MSG_WARN(wget is needed at execution time)

AC_CHECK_PROG(PACKAGE_XMLLINT, xmllint, yes)
[[ -z $PACKAGE_XMLLINT ]] && AC_MSG_WARN(xmllint is needed at execution time)

AC_CHECK_PROG(PACKAGE_XMLSTARLET, xmlstarlet, yes)
[[ -z $PACKAGE_XMLSTARLET ]] && AC_MSG_WARN(xmlstarlet is needed at execution time)

AC_CHECK_PROG(PACKAGE_LYNX, lynx, yes)
[[ -z $PACKAGE_LYNX ]] && AC_MSG_WARN(lynx is needed at execution time)

# Checks for libraries.
HUNSPELL_MODULES="hunspell"
PKG_CHECK_MODULES(HUNSPELL, $HUNSPELL_MODULES, PACKAGE_HUNSPELL=yes, PACKAGE_UNSPELL=no)
AC_SUBST(PACKAGE_HUNSPELL)
AC_SUBST(HUNSPELL_CFLAGS)
AC_SUBST(HUNSPELL_LIBS)
MYTHES_MODULES="mythes"
PKG_CHECK_MODULES(MYTHES, $MYTHES_MODULES, PACKAGE_MYTHES=yes, PACKAGE_MYTHES=no)
AC_SUBST(PACKAGE_MYTHES)
AC_SUBST(MYTHES_CFLAGS)
AC_SUBST(MYTHES_LIBS)
AM_CONDITIONAL(MYTHES, [test x$PACKAGE_HUNSPELL = xyes -a  x$PACKAGE_MYTHES = xyes])


# Checks for header files.

# Checks for typedefs, structures, and compiler characteristics.

# Checks for library functions.

AC_CONFIG_FILES([Makefile cmd/Makefile cmd/cmd/Makefile cmd/mkproject/Makefile cmd/tw/Makefile cmd/rf/Makefile cmd/imgs/Makefile cmd/typewrite/Makefile cmd/colorize/Makefile cmd/show/Makefile doc/Makefile dist/Makefile])
AC_OUTPUT
