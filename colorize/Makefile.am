EXTRA_DIST = colorize.in.sh
bin_SCRIPTS = colorize
CLEANFILES = $(bin_SCRIPTS)
colorize: colorize.in.sh Makefile
	$(PACKAGE_PARSE) $(srcdir)/colorize.in.sh > colorize
	chmod +x colorize
