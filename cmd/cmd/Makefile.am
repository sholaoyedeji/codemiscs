EXTRA_DIST = \
	cmd.in.sh testcmdsh.in \
	cmd.in testcmd.in
cmd_SCRIPTS = cmd.sh
cmddir = $(pkgdatadir)
test_SCRIPTS = testcmdsh testcmd
testdir = $(docdir)
bin_SCRIPTS = cmd
CLEANFILES = $(cmd_SCRIPTS) $(bin_SCRIPTS) $(test_SCRIPTS)
cmd.sh: cmd.in.sh Makefile
	cp $(srcdir)/cmd.in.sh cmd.sh
testcmdsh: testcmdsh.in Makefile
	$(PACKAGE_PARSE) $(srcdir)/testcmdsh.in > testcmdsh
	chmod +x testcmdsh
cmd: cmd.in Makefile
	$(PACKAGE_PARSE) $(srcdir)/cmd.in > cmd
	chmod +x cmd
testcmd: testcmd.in Makefile
	$(PACKAGE_PARSE) $(srcdir)/testcmd.in > testcmd
	chmod +x testcmd
