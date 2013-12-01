bin_SCRIPTS = rf
rf_data = feeds
nobase_dist_pkgdata_DATA = $(rf_data) 
#pkgdatadir = ./
EXTRA_DIST = rf.in.sh
CLEANFILES = $(bin_SCRIPTS)
rf: rf.in.sh Makefile
	$(PACKAGE_PARSE) $(srcdir)/rf.in.sh > rf
	chmod +x rf
