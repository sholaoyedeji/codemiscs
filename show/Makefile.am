EXTRA_DIST = show.in.sh
bin_SCRIPTS = show
CLEANFILES = $(bin_SCRIPTS)
show: show.in.sh Makefile
	$(PACKAGE_PARSE) $(srcdir)/show.in.sh > show
	chmod +x show
