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
	obs/Arch_Core/in.PKGBUILD \
	obs/Arch_Extra/in.PKGBUILD \
	obs/CentOS_CentOS-5/$(PACKAGE).in.spec \
	obs/CentOS_CentOS-6/$(PACKAGE).in.spec \
	obs/Debian_6.0/debian.in.rules \
	obs/Debian_6.0/$(PACKAGE).in.dsc \
	obs/Debian_6.0/debian.in.changelog \
	obs/Debian_6.0/debian.in.control \
	obs/Debian_7.0/debian.in.rules \
	obs/Debian_7.0/$(PACKAGE).in.dsc \
	obs/Debian_7.0/debian.in.changelog \
	obs/Debian_7.0/debian.in.control \
	obs/Fedora_18/$(PACKAGE).in.spec \
	obs/Fedora_19/$(PACKAGE).in.spec \
	obs/Fedora_20/$(PACKAGE).in.spec \
	obs/openSUSE_12.3/$(PACKAGE).in.spec \
	obs/openSUSE_13.1/$(PACKAGE).in.spec \
	obs/openSUSE_Factory/$(PACKAGE).in.spec \
	obs/RedHat_RHEL-5/$(PACKAGE).in.spec \
	obs/RedHat_RHEL-6/$(PACKAGE).in.spec \
	obs/xUbuntu_12.10/debian.in.rules \
	obs/xUbuntu_12.10/$(PACKAGE).in.dsc \
	obs/xUbuntu_12.10/debian.in.changelog \
	obs/xUbuntu_12.10/debian.in.control \
	obs/xUbuntu_13.10/debian.in.rules \
	obs/xUbuntu_13.10/$(PACKAGE).in.dsc \
	obs/xUbuntu_13.10/debian.in.changelog \
	obs/xUbuntu_13.10/debian.in.control \
	obs/$(PACKAGE).in.spec \
	obs/$(PACKAGE).in.dsc \
	obs/debian.in.changelog \
	obs/debian.in.control \
	obs/debian.in.rules \
	obs/in.PKGBUILD \
	obs/obs

EXTRA_SCRIPTS = \
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
	obs/Arch_Core/PKGBUILD \
	obs/Arch_Extra/PKGBUILD \
	obs/CentOS_CentOS-5/$(PACKAGE).spec \
	obs/CentOS_CentOS-6/$(PACKAGE).spec \
	obs/Debian_6.0/debian.rules \
	obs/Debian_6.0/$(PACKAGE).dsc \
	obs/Debian_6.0/debian.changelog \
	obs/Debian_6.0/debian.control \
	obs/Debian_7.0/debian.rules \
	obs/Debian_7.0/$(PACKAGE).dsc \
	obs/Debian_7.0/debian.changelog \
	obs/Debian_7.0/debian.control \
	obs/Fedora_18/$(PACKAGE).spec \
	obs/Fedora_19/$(PACKAGE).spec \
	obs/Fedora_20/$(PACKAGE).spec \
	obs/openSUSE_12.3/$(PACKAGE).spec \
	obs/openSUSE_13.1/$(PACKAGE).spec \
	obs/openSUSE_Factory/$(PACKAGE).spec \
	obs/RedHat_RHEL-5/$(PACKAGE).spec \
	obs/RedHat_RHEL-6/$(PACKAGE).spec \
	obs/xUbuntu_12.10/debian.rules \
	obs/xUbuntu_12.10/$(PACKAGE).dsc \
	obs/xUbuntu_12.10/debian.changelog \
	obs/xUbuntu_12.10/debian.control \
	obs/xUbuntu_13.10/debian.rules \
	obs/xUbuntu_13.10/$(PACKAGE).dsc \
	obs/xUbuntu_13.10/debian.changelog \
	obs/xUbuntu_13.10/debian.control \
	obs/$(PACKAGE).spec \
	obs/$(PACKAGE).dsc \
	obs/debian.changelog \
	obs/debian.control \
	obs/debian.rules \
	obs/PKGBUILD

CLEANFILES = $(EXTRA_SCRIPTS)

tarball: 
	pushd .. && make dist && popd

folders: 
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

bin: fedora/$(PACKAGE).spec centos/$(PACKAGE).spec rhel/$(PACKAGE).spec suse/$(PACKAGE).spec ubuntu/$(PACKAGE).dsc ubuntu/debian.changelog ubuntu/debian.control ubuntu/debian.rules debian/$(PACKAGE).dsc debian/debian.changelog debian/debian.control debian/debian.rules arch/PKGBUILD

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

obs/Arch_Core/PKGBUILD: tarball folders obs/Arch_Core/in.PKGBUILD Makefile
	$(PACKAGE_PARSE) $(srcdir)/obs/Arch_Core/in.PKGBUILD > obs/Arch_Core/PKGBUILD

obs/Arch_Extra/PKGBUILD: tarball folders obs/Arch_Extra/in.PKGBUILD Makefile
	$(PACKAGE_PARSE) $(srcdir)/obs/Arch_Extra/in.PKGBUILD > obs/Arch_Extra/PKGBUILD

obs/CentOS_CentOS-5/$(PACKAGE).spec: tarball folders obs/CentOS_CentOS-5/$(PACKAGE).in.spec Makefile
	$(PACKAGE_PARSE) $(srcdir)/obs/CentOS_CentOS-5/$(PACKAGE).in.spec > obs/CentOS_CentOS-5/$(PACKAGE).spec

obs/CentOS_CentOS-6/$(PACKAGE).spec: tarball folders obs/CentOS_CentOS-6/$(PACKAGE).in.spec Makefile
	$(PACKAGE_PARSE) $(srcdir)/obs/CentOS_CentOS-6/$(PACKAGE).in.spec > obs/CentOS_CentOS-6/$(PACKAGE).spec

obs/Debian_6.0/debian.rules: tarball folders obs/Debian_6.0/debian.in.rules Makefile
	$(PACKAGE_PARSE) $(srcdir)/obs/Debian_6.0/debian.in.rules > obs/Debian_6.0/debian.rules

obs/Debian_6.0/$(PACKAGE).dsc: tarball folders obs/Debian_6.0/$(PACKAGE).in.dsc Makefile
	$(PACKAGE_PARSE) $(srcdir)/obs/Debian_6.0/$(PACKAGE).in.dsc > obs/Debian_6.0/$(PACKAGE).dsc

obs/Debian_6.0/debian.changelog: tarball folders obs/Debian_6.0/debian.in.changelog Makefile
	$(PACKAGE_PARSE) $(srcdir)/obs/Debian_6.0/debian.in.changelog > obs/Debian_6.0/debian.changelog

obs/Debian_6.0/debian.control: tarball folders obs/Debian_6.0/debian.in.control Makefile
	$(PACKAGE_PARSE) $(srcdir)/obs/Debian_6.0/debian.in.control > obs/Debian_6.0/debian.control

obs/Debian_7.0/debian.rules: tarball folders obs/Debian_7.0/debian.in.rules Makefile
	$(PACKAGE_PARSE) $(srcdir)/obs/Debian_7.0/debian.in.rules > obs/Debian_7.0/debian.rules

obs/Debian_7.0/$(PACKAGE).dsc: tarball folders obs/Debian_7.0/$(PACKAGE).in.dsc Makefile
	$(PACKAGE_PARSE) $(srcdir)/obs/Debian_7.0/$(PACKAGE).in.dsc > obs/Debian_7.0/$(PACKAGE).dsc

obs/Debian_7.0/debian.changelog: tarball folders obs/Debian_7.0/debian.in.changelog Makefile
	$(PACKAGE_PARSE) $(srcdir)/obs/Debian_7.0/debian.in.changelog > obs/Debian_7.0/debian.changelog

obs/Debian_7.0/debian.control: tarball folders obs/Debian_7.0/debian.in.control Makefile
	$(PACKAGE_PARSE) $(srcdir)/obs/Debian_7.0/debian.in.control > obs/Debian_7.0/debian.control

obs/Fedora_18/$(PACKAGE).spec: tarball folders obs/Fedora_18/$(PACKAGE).in.spec Makefile
	$(PACKAGE_PARSE) $(srcdir)/obs/Fedora_18/$(PACKAGE).in.spec > obs/Fedora_18/$(PACKAGE).spec

obs/Fedora_19/$(PACKAGE).spec: tarball folders obs/Fedora_19/$(PACKAGE).in.spec Makefile
	$(PACKAGE_PARSE) $(srcdir)/obs/Fedora_19/$(PACKAGE).in.spec > obs/Fedora_19/$(PACKAGE).spec

obs/Fedora_20/$(PACKAGE).spec: tarball folders obs/Fedora_20/$(PACKAGE).in.spec Makefile
	$(PACKAGE_PARSE) $(srcdir)/obs/Fedora_20/$(PACKAGE).in.spec > obs/Fedora_20/$(PACKAGE).spec

obs/openSUSE_12.3/$(PACKAGE).spec: tarball folders obs/openSUSE_12.3/$(PACKAGE).in.spec Makefile
	$(PACKAGE_PARSE) $(srcdir)/obs/openSUSE_12.3/$(PACKAGE).in.spec > obs/openSUSE_12.3/$(PACKAGE).spec

obs/openSUSE_13.1/$(PACKAGE).spec: tarball folders obs/openSUSE_13.1/$(PACKAGE).in.spec Makefile
	$(PACKAGE_PARSE) $(srcdir)/obs/openSUSE_13.1/$(PACKAGE).in.spec > obs/openSUSE_13.1/$(PACKAGE).spec

obs/openSUSE_Factory/$(PACKAGE).spec: tarball folders obs/openSUSE_Factory/$(PACKAGE).in.spec Makefile
	$(PACKAGE_PARSE) $(srcdir)/obs/openSUSE_Factory/$(PACKAGE).in.spec > obs/openSUSE_Factory/$(PACKAGE).spec

obs/RedHat_RHEL_5/$(PACKAGE).spec: tarball folders obs/RedHat_RHEL-5/$(PACKAGE).in.spec Makefile
	$(PACKAGE_PARSE) $(srcdir)/obs/RedHat_RHEL-5/$(PACKAGE).in.spec > obs/RedHat_RHEL-5/$(PACKAGE).spec

obs/RedHat_RHEL_6/$(PACKAGE).spec: tarball folders obs/RedHat_RHEL-6/$(PACKAGE).in.spec Makefile
	$(PACKAGE_PARSE) $(srcdir)/obs/RedHat_RHEL-6/$(PACKAGE).in.spec > obs/RedHat_RHEL-6/$(PACKAGE).spec

obs/xUbuntu_12.10/debian.rules: tarball folders obs/xUbuntu_12.10/debian.in.rules Makefile
	$(PACKAGE_PARSE) $(srcdir)/obs/xUbuntu_12.10/debian.in.rules > obs/xUbuntu_12.10/debian.rules

obs/xUbuntu_12.10/$(PACKAGE).dsc: tarball folders obs/xUbuntu_12.10/$(PACKAGE).in.dsc Makefile
	$(PACKAGE_PARSE) $(srcdir)/obs/xUbuntu_12.10/$(PACKAGE).in.dsc > obs/xUbuntu_12.10/$(PACKAGE).dsc

obs/xUbuntu_12.10/debian.changelog: tarball folders obs/xUbuntu_12.10/debian.in.changelog Makefile
	$(PACKAGE_PARSE) $(srcdir)/obs/xUbuntu_12.10/debian.in.changelog > obs/xUbuntu_12.10/debian.changelog

obs/xUbuntu_12.10/debian.control: tarball folders obs/xUbuntu_12.10/debian.in.control Makefile
	$(PACKAGE_PARSE) $(srcdir)/obs/xUbuntu_12.10/debian.in.control > obs/xUbuntu_12.10/debian.control

obs/xUbuntu_13.10/debian.rules: tarball folders obs/xUbuntu_13.10/debian.in.rules Makefile
	$(PACKAGE_PARSE) $(srcdir)/obs/xUbuntu_13.10/debian.in.rules > obs/xUbuntu_13.10/debian.rules

obs/xUbuntu_13.10/$(PACKAGE).dsc: tarball folders obs/xUbuntu_13.10/$(PACKAGE).in.dsc Makefile
	$(PACKAGE_PARSE) $(srcdir)/obs/xUbuntu_13.10/$(PACKAGE).in.dsc > obs/xUbuntu_13.10/$(PACKAGE).dsc

obs/xUbuntu_13.10/debian.changelog: tarball folders obs/xUbuntu_13.10/debian.in.changelog Makefile
	$(PACKAGE_PARSE) $(srcdir)/obs/xUbuntu_13.10/debian.in.changelog > obs/xUbuntu_13.10/debian.changelog

obs/xUbuntu_13.10/debian.control: tarball folders obs/xUbuntu_13.10/debian.in.control Makefile
	$(PACKAGE_PARSE) $(srcdir)/obs/xUbuntu_13.10/debian.in.control > obs/xUbuntu_13.10/debian.control

obs: obs/Arch_Core/PKGBUILD obs/Arch_Extra/PKGBUILD obs/CentOS_CentOS-5/$(PACKAGE).spec obs/CentOS_CentOS-6/$(PACKAGE).spec obs/Debian_6.0/debian.rules obs/Debian_6.0/$(PACKAGE).dsc obs/Debian_6.0/debian.changelog obs/Debian_6.0/debian.control obs/Debian_7.0/debian.rules obs/Debian_7.0/$(PACKAGE).dsc obs/Debian_7.0/debian.changelog obs/Debian_7.0/debian.control obs/Fedora_18/$(PACKAGE).spec obs/Fedora_19/$(PACKAGE).spec obs/Fedora_20/$(PACKAGE).spec obs/openSUSE_12.3/$(PACKAGE).spec obs/openSUSE_13.1/$(PACKAGE).spec obs/openSUSE_Factory/$(PACKAGE).spec obs/RedHat_RHEL_5/$(PACKAGE).spec obs/RedHat_RHEL_6/$(PACKAGE).spec obs/xUbuntu_12.10/debian.rules obs/xUbuntu_12.10/$(PACKAGE).dsc obs/xUbuntu_12.10/debian.changelog obs/xUbuntu_12.10/debian.control obs/xUbuntu_13.10/debian.rules obs/xUbuntu_13.10/$(PACKAGE).dsc obs/xUbuntu_13.10/debian.changelog obs/xUbuntu_13.10/debian.control obs/$(PACKAGE).spec obs/$(PACKAGE).dsc obs/debian.changelog obs/debian.control obs/debian.rules obs/PKGBUILD
	cp ../$(PACKAGE_TARNAME)-$(PACKAGE_VERSION).tar.bz2 obs
	pushd obs && ./obs $(PACKAGE_TARNAME)-$(PACKAGE_VERSION).tar.bz2 && popd
	rm obs/$(PACKAGE_TARNAME)-$(PACKAGE_VERSION).tar.bz2
