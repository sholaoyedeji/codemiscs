EXTRA_DIST = \
	fedora/$(PACKAGE).in.spec \
	ubuntu/$(PACKAGE).in.dsc \
	ubuntu/debian.in.changelog \
	ubuntu/debian.in.control \
	ubuntu/debian.in.rules \
	debian/$(PACKAGE).in.dsc \
	debian/debian.in.changelog \
	debian/debian.in.control \
	debian/debian.in.rules \
	arch/in.PKGBUILD
noinst_SCRIPTS = \
	fedora/$(PACKAGE).spec \
	ubuntu/$(PACKAGE).dsc \
	ubuntu/debian.changelog \
	ubuntu/debian.control \
	ubuntu/debian.rules \
	debian/$(PACKAGE).dsc \
	debian/debian.changelog \
	debian/debian.control \
	debian/debian.rules \
	arch/PKGBUILD
CLEANFILES = $(noinst_SCRIPTS)

tarball: Makefile
	pushd ..; make dist; popd

fedora/$(PACKAGE).spec: tarball fedora/$(PACKAGE).in.spec Makefile
	$(PACKAGE_PARSE) $(srcdir)/fedora/$(PACKAGE).in.spec > fedora/$(PACKAGE).spec

ubuntu/$(PACKAGE).dsc: tarball ubuntu/$(PACKAGE).in.dsc Makefile
	$(PACKAGE_PARSE) $(srcdir)/ubuntu/$(PACKAGE).in.dsc > ubuntu/$(PACKAGE).dsc
ubuntu/debian.control: tarball ubuntu/debian.in.control Makefile
	$(PACKAGE_PARSE) $(srcdir)/ubuntu/debian.in.control > ubuntu/debian.control
ubuntu/debian.rules: tarball ubuntu/debian.in.rules Makefile
	$(PACKAGE_PARSE) $(srcdir)/ubuntu/debian.in.rules > ubuntu/debian.rules
ubuntu/debian.changelog: tarball ubuntu/debian.in.changelog Makefile
	$(PACKAGE_PARSE) $(srcdir)/ubuntu/debian.in.changelog > ubuntu/debian.changelog

debian/$(PACKAGE).dsc: tarball debian/$(PACKAGE).in.dsc Makefile
	$(PACKAGE_PARSE) $(srcdir)/debian/$(PACKAGE).in.dsc > debian/$(PACKAGE).dsc
debian/debian.control: tarball debian/debian.in.control Makefile
	$(PACKAGE_PARSE) $(srcdir)/debian/debian.in.control > debian/debian.control
debian/debian.rules: tarball debian/debian.in.rules Makefile
	$(PACKAGE_PARSE) $(srcdir)/debian/debian.in.rules > debian/debian.rules
debian/debian.changelog: tarball debian/debian.in.changelog Makefile
	$(PACKAGE_PARSE) $(srcdir)/debian/debian.in.changelog > debian/debian.changelog

arch/PKGBUILD: tarball arch/in.PKGBUILD Makefile
	$(PACKAGE_PARSE) $(srcdir)/arch/in.PKGBUILD > arch/PKGBUILD
