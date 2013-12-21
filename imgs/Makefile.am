EXTRA_DIST = imgs.in.sh
bin_SCRIPTS = imgs
CLEANFILES = $(bin_SCRIPTS)
imgs: imgs.in.sh
	$(PACKAGE_PARSE) $(srcdir)/imgs.in.sh > imgs 
	chmod +x imgs
