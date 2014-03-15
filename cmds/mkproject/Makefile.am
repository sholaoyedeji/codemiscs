EXTRA_DIST = mkproject.in.sh
bin_SCRIPTS = mkproject
CLEANFILES = $(bin_SCRIPTS)
mkprojectdir=$(pkgdatadir)/mkproject
nobase_dist_mkproject_DATA= \
	mps.sh \
	skeletons/bash.sh \
	skeletons/c.sh \
	skeletons/c-lib.sh \
	skeletons/python.sh \
	skeletons/c++.sh \
	skeletons/c++-lib.sh \
	skeletons/perl.sh 
mkproject: mkproject.in.sh Makefile
	$(PACKAGE_PARSE) $(srcdir)/mkproject.in.sh > mkproject
	chmod +x mkproject
