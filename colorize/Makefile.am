bin_SCRIPTS = colorize
EXTRA_DIST = colorize.in.sh
CLEANFILES = $(bin_SCRIPTS)
%: %.in.sh
	$(PACKAGE_PARSE) $(srcdir)/$^ > $@
	chmod +x $@
