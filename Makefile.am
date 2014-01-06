SUBDIRS = cmd doc dist
dist_doc_DATA = README NEWS AUTHORS COPYING ChangeLog PAYMENTS

rpm: dist/fedora/codemiscs.spec
	cp $(top_srcdir)/$(PACKAGE)-$(PACKAGE_VERSION).tar.bz2 ~/local/dev/rpmbuild/SOURCES/ && cp $(top_srcdir)/dist/fedora/$(PACKAGE).spec ~/local/dev/rpmbuild/SPECS && ( cd ~/local/dev/rpmbuild/SPECS && rpmbuild -ba $(PACKAGE).spec ) && cp ~/local/dev/rpmbuild/RPMS/i686/$(PACKAGE)-$(PACKAGE_VERSION)-*.*.i686.rpm $(top_srcdir)/ && cp ~/local/dev/rpmbuild/SRPMS/$(PACKAGE)-$(PACKAGE_VERSION)-*.*.src.rpm $(top_srcdir)/

deepdistcheck:
	make && make clean && make && make distcheck

