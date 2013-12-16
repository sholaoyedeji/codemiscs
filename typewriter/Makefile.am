bin_SCRIPTS = typewriter
EXTRA_DIST = typewriter.in.sh
CLEANFILES = $(bin_SCRIPTS)
%: %.in.sh
	$(PACKAGE_PARSE) $(srcdir)/$^ > $@
	chmod +x $@
