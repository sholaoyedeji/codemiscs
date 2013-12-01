cmd_SCRIPTS = cmd.sh
bin_SCRIPTS = cmd
test_SCRIPTS = testcmdsh testcmd
cmddir=$(pkgdatadir)
testdir=$(docdir)
EXTRA_DIST = cmd.in.sh testcmdsh.in cmd.in testcmd.in
CLEANFILES = $(cmd_SCRIPTS) $(bin_SCRIPTS) $(test_SCRIPTS)
#pkgdatadir=./
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
