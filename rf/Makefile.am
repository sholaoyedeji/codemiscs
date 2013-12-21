EXTRA_DIST = rf.in.sh
bin_SCRIPTS = rf
CLEANFILES = $(bin_SCRIPTS)
rfdir = $(pkgdatadir)/rf
nobase_dist_rf_DATA = feeds
rf: rf.in.sh Makefile
	$(PACKAGE_PARSE) $(srcdir)/rf.in.sh > rf
	chmod +x rf
