man1_MANS = cmd.man mkproject.man rf.man mythes.man tw.man imgs.man typewriter.man colorize.man
EXTRA_DIST = cmd.in.man mkproject.in.man rf.in.man mythes.in.man tw.in.man imgs.in.man typewriter.in.man colorize.in.man
CLEANFILES = cmd.man mkproject.man rf.man mythes.man tw.man imgs.man typewriter.man colorize.man
%.man: %.in.man
	$(PACKAGE_PARSE) $(top_srcdir)/doc/$^ > $@
