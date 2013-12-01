bin_SCRIPTS = imgs-fetch-google imgs-unify imgs-slideshow imgs-fortune
EXTRA_DIST = imgs-fetch-google.in.sh imgs-unify.in.sh imgs-slideshow.in.sh imgs-fortune.in.sh
CLEANFILES = $(bin_SCRIPTS)
%: %.in.sh
	$(PACKAGE_PARSE) $(srcdir)/$^ > $@
	chmod +x $@
