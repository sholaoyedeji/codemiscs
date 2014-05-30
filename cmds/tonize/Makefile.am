EXTRA_DIST = tonize.in.sh
bin_SCRIPTS = tonize
CLEANFILES = $(bin_SCRIPTS)
tonize: tonize.in.sh Makefile
	$(PACKAGE_PARSE) $(srcdir)/tonize.in.sh > tonize
	chmod +x tonize
