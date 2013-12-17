man1_MANS = cmd.man mkproject.man rf.man tw.man imgs.man typewriter.man
EXTRA_DIST = cmd.in.man mkproject.in.man rf.in.man tw.in.man imgs.in.man typewriter.in.man
CLEANFILES = cmd.man mkproject.man rf.man tw.man imgs.man typewriter.man
%.man: %.in.man
	$(PACKAGE_PARSE) $(top_srcdir)/doc/$^ > $@
