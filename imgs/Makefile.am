bin_SCRIPTS = imgs
EXTRA_DIST = imgs.in.sh
CLEANFILES = $(bin_SCRIPTS)
%: %.in.sh
	$(PACKAGE_PARSE) $(srcdir)/$^ > $@
	chmod +x $@
