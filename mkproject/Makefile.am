bin_SCRIPTS = mkproject
mp_data = mps.sh \
	  skeletons/bash.sh \
	  skeletons/c.sh \
	  skeletons/c-lib.sh \
	  skeletons/python.sh \
	  skeletons/c++.sh \
	  skeletons/c++-lib.sh \
	  skeletons/perl.sh 
nobase_dist_pkgdata_DATA = $(mp_data) 
EXTRA_DIST = mkproject.in.sh
CLEANFILES = $(bin_SCRIPTS)
#pkgdatadir=../
mkproject: mkproject.in.sh Makefile
	$(PACKAGE_PARSE) $(srcdir)/mkproject.in.sh > mkproject
	chmod +x mkproject
