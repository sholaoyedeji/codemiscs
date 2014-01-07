EXTRA_DIST = \
	fedora/$(PACKAGE).in.spec \
	centos/$(PACKAGE).in.spec \
	rhel/$(PACKAGE).in.spec \
	suse/$(PACKAGE).in.spec \
	ubuntu/$(PACKAGE).in.dsc \
	ubuntu/debian.in.changelog \
	ubuntu/debian.in.control \
	ubuntu/debian.in.rules \
	debian/$(PACKAGE).in.dsc \
	debian/debian.in.changelog \
	debian/debian.in.control \
	debian/debian.in.rules \
	arch/in.PKGBUILD \
	obs/$(PACKAGE).in.spec \
	obs/$(PACKAGE).in.dsc \
	obs/debian.in.changelog \
	obs/debian.in.control \
	obs/debian.in.rules \
	obs/in.PKGBUILD
noinst_SCRIPTS = \
	fedora/$(PACKAGE).spec \
	centos/$(PACKAGE).spec \
	rhel/$(PACKAGE).spec \
	suse/$(PACKAGE).spec \
	ubuntu/$(PACKAGE).dsc \
	ubuntu/debian.changelog \
	ubuntu/debian.control \
	ubuntu/debian.rules \
	debian/$(PACKAGE).dsc \
	debian/debian.changelog \
	debian/debian.control \
	debian/debian.rules \
	arch/PKGBUILD \
	obs/$(PACKAGE).spec \
	obs/$(PACKAGE).dsc \
	obs/debian.changelog \
	obs/debian.control \
	obs/debian.rules \
	obs/PKGBUILD
CLEANFILES = $(noinst_SCRIPTS)

tarball: Makefile
	pushd ..; make dist; popd

folders: Makefile
	mkdir -p fedora centos rhel suse ubuntu debian arch obs

fedora/$(PACKAGE).spec: tarball folders fedora/$(PACKAGE).in.spec Makefile
	$(PACKAGE_PARSE) $(srcdir)/fedora/$(PACKAGE).in.spec > fedora/$(PACKAGE).spec

centos/$(PACKAGE).spec: tarball folders centos/$(PACKAGE).in.spec Makefile
	$(PACKAGE_PARSE) $(srcdir)/centos/$(PACKAGE).in.spec > centos/$(PACKAGE).spec

rhel/$(PACKAGE).spec: tarball folders rhel/$(PACKAGE).in.spec Makefile
	$(PACKAGE_PARSE) $(srcdir)/rhel/$(PACKAGE).in.spec > rhel/$(PACKAGE).spec

suse/$(PACKAGE).spec: tarball folders suse/$(PACKAGE).in.spec Makefile
	$(PACKAGE_PARSE) $(srcdir)/suse/$(PACKAGE).in.spec > suse/$(PACKAGE).spec

ubuntu/$(PACKAGE).dsc: tarball folders ubuntu/$(PACKAGE).in.dsc Makefile
	$(PACKAGE_PARSE) $(srcdir)/ubuntu/$(PACKAGE).in.dsc > ubuntu/$(PACKAGE).dsc
ubuntu/debian.control: tarball folders ubuntu/debian.in.control Makefile
	$(PACKAGE_PARSE) $(srcdir)/ubuntu/debian.in.control > ubuntu/debian.control
ubuntu/debian.rules: tarball folders ubuntu/debian.in.rules Makefile
	$(PACKAGE_PARSE) $(srcdir)/ubuntu/debian.in.rules > ubuntu/debian.rules
ubuntu/debian.changelog: tarball folders ubuntu/debian.in.changelog Makefile
	$(PACKAGE_PARSE) $(srcdir)/ubuntu/debian.in.changelog > ubuntu/debian.changelog

debian/$(PACKAGE).dsc: tarball folders debian/$(PACKAGE).in.dsc Makefile
	$(PACKAGE_PARSE) $(srcdir)/debian/$(PACKAGE).in.dsc > debian/$(PACKAGE).dsc
debian/debian.control: tarball folders debian/debian.in.control Makefile
	$(PACKAGE_PARSE) $(srcdir)/debian/debian.in.control > debian/debian.control
debian/debian.rules: tarball folders debian/debian.in.rules Makefile
	$(PACKAGE_PARSE) $(srcdir)/debian/debian.in.rules > debian/debian.rules
debian/debian.changelog: tarball folders debian/debian.in.changelog Makefile
	$(PACKAGE_PARSE) $(srcdir)/debian/debian.in.changelog > debian/debian.changelog

arch/PKGBUILD: tarball folders arch/in.PKGBUILD Makefile
	$(PACKAGE_PARSE) $(srcdir)/arch/in.PKGBUILD > arch/PKGBUILD

obs/$(PACKAGE).spec: tarball folders obs/$(PACKAGE).in.spec Makefile
	$(PACKAGE_PARSE) $(srcdir)/obs/$(PACKAGE).in.spec > obs/$(PACKAGE).spec
obs/$(PACKAGE).dsc: tarball folders obs/$(PACKAGE).in.dsc Makefile
	$(PACKAGE_PARSE) $(srcdir)/obs/$(PACKAGE).in.dsc > obs/$(PACKAGE).dsc
obs/debian.control: tarball folders obs/debian.in.control Makefile
	$(PACKAGE_PARSE) $(srcdir)/obs/debian.in.control > obs/debian.control
obs/debian.rules: tarball folders obs/debian.in.rules Makefile
	$(PACKAGE_PARSE) $(srcdir)/obs/debian.in.rules > obs/debian.rules
obs/debian.changelog: tarball folders obs/debian.in.changelog Makefile
	$(PACKAGE_PARSE) $(srcdir)/obs/debian.in.changelog > obs/debian.changelog
obs/PKGBUILD: tarball folders obs/in.PKGBUILD Makefile
	$(PACKAGE_PARSE) $(srcdir)/obs/in.PKGBUILD > obs/PKGBUILD
