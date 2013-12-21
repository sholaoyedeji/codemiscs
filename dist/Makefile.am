EXTRA_DIST = codemiscs.in.spec
noinst_SCRIPTS = codemiscs.spec
CLEANFILES = $(noinst_SCRIPTS)
codemiscs.spec: codemiscs.in.spec Makefile
	$(PACKAGE_PARSE) $(top_srcdir)/dist/codemiscs.in.spec > codemiscs.spec
