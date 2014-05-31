EXTRA_DIST = \
	gen.sh \
	cmd.in.man \
	mkproject.in.man \
	rf.in.man \
	mythes.in.man \
	tw.in.man \
	imgs.in.man \
	typewrite.in.man \
	colorize.in.man \
	show.in.man \
	tonize.in.man \
	status.in.man \
	demo \
	stage1/ \
	stage2/
demo_SCRIPTS = demo
demodir = $(docdir)
man1_MANS = \
	cmd.man \
	mkproject.man \
	rf.man \
	mythes.man \
	tw.man \
	imgs.man \
	typewrite.man \
	colorize.man \
	show.man \
	tonize.man \
	status.man
CLEANFILES = $(man1_MANS)
man: Makefile
	./gen.sh
%.man: %.in.man
	$(PACKAGE_PARSE) $(top_srcdir)/doc/$^ > $@
