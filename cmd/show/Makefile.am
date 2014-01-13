EXTRA_DIST = show.in.sh
bin_SCRIPTS = show
CLEANFILES = $(bin_SCRIPTS)
showdir=$(pkgdatadir)/show
nobase_dist_show_DATA = \
	shows/ants.sh \
	shows/box.sh \
	shows/clock.sh \
	shows/cookie.sh \
	shows/mandelbrot.sh \
	shows/matrix.sh \
	shows/pipes.sh \
	shows/weave.sh
show: show.in.sh Makefile
	$(PACKAGE_PARSE) $(srcdir)/show.in.sh > show
	chmod +x show
