EXTRA_DIST = \
	tw.in.sh \
	engines/tw_yb.sh \
	mythes.in.sh \
	tw-config-klipper.in.sh \
	tw-config-gtw.in.sh \
	Language\ Station/
bin_SCRIPTS = \
	tw \
	tw-config-klipper tw-config-gtw
if MYTHES 
bin_PROGRAMS = mythes-raw
bin_SCRIPTS += mythes
endif
CLEANFILES = $(bin_PROGRAMS) $(bin_SCRIPTS)
twdir=$(pkgdatadir)/tw
nobase_dist_tw_DATA = \
	dicts/en-es.twd dicts/es-en.twd \
	dicts/en-ar.twd dicts/ar-en.twd \
	engines/tw_share.sh \
	engines/tw_cache.sh \
	engines/tw_local.sh \
	engines/tw_gt.sh \
	engines/tw_ft.sh \
	tw_mythes.sh
mythes_raw_SOURCES = mythes.cxx
mythes_raw_CPPFLAGS = $(HUNSPELL_CFLAGS) $(MYTHES_CFLAGS)
mythes_raw_LDADD = $(HUNSPELL_LIBS) $(MYTHES_LIBS)
tw: tw.in.sh Makefile
	$(PACKAGE_PARSE) $(srcdir)/tw.in.sh > tw
	chmod +x tw
mythes: mythes.in.sh Makefile
	$(PACKAGE_PARSE) $(srcdir)/mythes.in.sh > mythes 
	chmod +x mythes
tw-config-klipper: tw-config-klipper.in.sh Makefile
	$(PACKAGE_PARSE) $(srcdir)/tw-config-klipper.in.sh > tw-config-klipper 
	chmod +x tw-config-klipper
tw-config-gtw: tw-config-gtw.in.sh Makefile
	$(PACKAGE_PARSE) $(srcdir)/tw-config-gtw.in.sh > tw-config-gtw 
	chmod +x tw-config-gtw
