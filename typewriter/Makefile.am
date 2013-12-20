if OGG123
BOOL_OGG123 = 0
else
BOOL_OGG123 = 1
endif
bin_SCRIPTS = typewriter
EXTRA_DIST = typewriter.in.sh
CLEANFILES = $(bin_SCRIPTS)
typewriter_data = typewriter.ogg
nobase_dist_pkgdata_DATA = $(typewriter_data)
%: %.in.sh
	$(PACKAGE_PARSE) -e 's,\[@\]pkghaveogg123\[@\],$(BOOL_OGG123),g' $(srcdir)/$^ > $@ 
	chmod +x $@
