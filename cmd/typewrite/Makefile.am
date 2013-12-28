EXTRA_DIST = typewrite.in.sh
bin_SCRIPTS = typewrite
CLEANFILES = $(bin_SCRIPTS)
typewritedir= $(pkgdatadir)/typewrite
dist_typewrite_DATA = \
	typewrite.ogg
typewrite: typewrite.in.sh Makefile
	$(PACKAGE_PARSE) $(srcdir)/typewrite.in.sh > typewrite 
	chmod +x typewrite
