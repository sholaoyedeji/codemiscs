EXTRA_DIST = \
	demo \
	gen.sh \
	cmd.in.man \
	mkproject.in.man \
	rf.in.man \
	mythes.in.man \
	tw.in.man \
	imgs.in.man \
	typewriter.in.man \
	colorize.in.man \
	show.in.man \
	stage1/
man1_MANS = \
	cmd.man \
	mkproject.man \
	rf.man \
	mythes.man \
	tw.man \
	imgs.man \
	typewriter.man \
	colorize.man \
	show.man
CLEANFILES = $(man1_MANS)
man: Makefile
	./gen.sh
%.man: %.in.man
	$(PACKAGE_PARSE) $(top_srcdir)/doc/$^ > $@
