EXTRA_DIST = pack.in.sh
nodist_bin_SCRIPTS = pack
CLEANFILES = $(nodist_bin_SCRIPTS)
pack: pack.in.sh
	$(PACKAGE_PARSE) $(srcdir)/pack.in.sh > pack 
	chmod +x pack
