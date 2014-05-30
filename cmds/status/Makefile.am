EXTRA_DIST = status.in.sh
bin_SCRIPTS = status
CLEANFILES = $(bin_SCRIPTS)
status: status.in.sh Makefile
	$(PACKAGE_PARSE) $(srcdir)/status.in.sh > status
	chmod +x status
