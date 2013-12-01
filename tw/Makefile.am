bin_SCRIPTS = tw tw-config-klipper tw-config-gtw
if ASPELL
BOOL_ASPELL = 0
else
BOOL_ASPELL = 1
endif
if ESPEAK
BOOL_ESPEAK = 0
else
BOOL_ESPEAK = 1
endif
if MYTHES 
BOOL_MYTHES = 0
bin_PROGRAMS = mythes-raw
bin_SCRIPTS += mythes
else
BOOL_MYTHES = 1
endif
tw_data = engines/tw_share.sh \
	  engines/tw_cache.sh \
	  engines/tw_local.sh \
	  engines/tw_gt.sh \
	  engines/tw_ft.sh \
	  tw_mythes.sh
nobase_dist_pkgdata_DATA = $(tw_data)
EXTRA_DIST = tw.in.sh engines/tw_yb.sh mythes.in.sh tw-config-klipper tw-config-gtw
CLEANFILES = mythes tw
mythes_raw_SOURCES = mythes.cxx
mythes_raw_CPPFLAGS = $(HUNSPELL_CFLAGS) $(MYTHES_CFLAGS)
mythes_raw_LDADD = $(HUNSPELL_LIBS) $(MYTHES_LIBS)
tw: tw.in.sh Makefile
	$(PACKAGE_PARSE) -e 's,\[@\]pkghaveaspell\[@\],$(BOOL_ASPELL),g' -e 's,\[@\]pkghaveespeak\[@\],$(BOOL_ESPEAK),g' -e 's,\[@\]pkghavemythes\[@\],$(BOOL_MYTHES),g' $(srcdir)/tw.in.sh > tw
	chmod +x tw
mythes: mythes.in.sh Makefile
	$(PACKAGE_PARSE) -e 's,\[@\]pkghaveaspell\[@\],$(BOOL_ASPELL),g' -e 's,\[@\]pkghaveespeak\[@\],$(BOOL_ESPEAK),g' -e 's,\[@\]pkghavemythes\[@\],$(BOOL_MYTHES),g' $(srcdir)/mythes.in.sh > mythes 
	chmod +x mythes
