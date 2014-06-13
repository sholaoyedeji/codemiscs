ACLOCAL_AMFLAGS = -I autoconf.macro
SUBDIRS = cmds doc dist
dist_doc_DATA = README NEWS AUTHORS COPYING ChangeLog PAYMENTS
EXTRA_DIST = codemiscs.png # shots

deepdistcheck: 
	make && make clean && make && make distcheck

bin:
	make -C dist bin

obs:
	make -C dist obs

rpm: 
	pushd dist && make bin && popd
	cp $(top_srcdir)/$(PACKAGE)-$(PACKAGE_VERSION).tar.bz2 /mnt/share/dev/codepack/fedora/rpmbuild/SOURCES/ && cp $(top_srcdir)/dist/fedora/$(PACKAGE).spec /mnt/share/dev/codepack/fedora/rpmbuild/SPECS && ( cd /mnt/share/dev/codepack/fedora/rpmbuild/SPECS && rpmbuild -ba $(PACKAGE).spec ) && cp /mnt/share/dev/codepack/fedora/rpmbuild/RPMS/i686/$(PACKAGE)-$(PACKAGE_VERSION)-*.*.i686.rpm $(top_srcdir)/ && cp /mnt/share/dev/codepack/fedora/rpmbuild/SRPMS/$(PACKAGE)-$(PACKAGE_VERSION)-*.*.src.rpm $(top_srcdir)/

deepreload: deepdistcheck rpm
	sudo rpm -e codemiscs; sudo rpm -Uhv $(PACKAGE)-$(PACKAGE_VERSION)-1.*.rpm

reload: distcheck rpm
	sudo rpm -e codemiscs; sudo rpm -Uhv $(PACKAGE)-$(PACKAGE_VERSION)-1.*.rpm

docs:
	pushd doc; ./generate; popd

wiki:
	pushd codemiscs.wiki; ./generate; popd

deepproject:
	make deepreload
	make docs wiki
	make deepreload

project:
	make reload
	make docs wiki
	make reload
