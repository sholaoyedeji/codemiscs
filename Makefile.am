ACLOCAL_AMFLAGS = -I autoconf.macro
SUBDIRS = cmd doc dist
dist_doc_DATA = README NEWS AUTHORS COPYING ChangeLog PAYMENTS

rpm: dist/fedora/codemiscs.spec
	cp $(top_srcdir)/$(PACKAGE)-$(PACKAGE_VERSION).tar.bz2 /mnt/share/dev/codepack/fedora/rpmbuild/SOURCES/ && cp $(top_srcdir)/dist/fedora/$(PACKAGE).spec /mnt/share/dev/codepack/fedora/rpmbuild/SPECS && ( cd /mnt/share/dev/codepack/fedora/rpmbuild/SPECS && rpmbuild -ba $(PACKAGE).spec ) && cp /mnt/share/dev/codepack/fedora/rpmbuild/RPMS/i686/$(PACKAGE)-$(PACKAGE_VERSION)-*.*.i686.rpm $(top_srcdir)/ && cp /mnt/share/dev/codepack/fedora/rpmbuild/SRPMS/$(PACKAGE)-$(PACKAGE_VERSION)-*.*.src.rpm $(top_srcdir)/

deepdistcheck:
	make && make clean && make && make distcheck

