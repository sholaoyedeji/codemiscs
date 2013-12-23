EXTRA_DIST = typewriter.in.sh
bin_SCRIPTS = typewriter
CLEANFILES = $(bin_SCRIPTS)
typewriterdir= $(pkgdatadir)/typewriter
dist_typewriter_DATA = \
	typewriter.ogg
typewriter: typewriter.in.sh Makefile
	$(PACKAGE_PARSE) $(srcdir)/typewriter.in.sh > typewriter 
	chmod +x typewriter
