SUBDIRS = cmd mkproject tw rf imgs typewriter colorize data doc dist
dist_doc_DATA = README NEWS AUTHORS COPYING PAYMENTS ChangeLog

deepdistcheck:
	make && make clean && make && make distcheck

rpm: dist/codemiscs.spec
	cp $(top_srcdir)/codemiscs-$(PACKAGE_VERSION).tar.bz2 ~/local/dev/rpmbuild/SOURCES/
	cp $(top_srcdir)/dist/codemiscs.spec ~/local/dev/rpmbuild/SPECS
	( cd ~/local/dev/rpmbuild/SPECS && rpmbuild -ba codemiscs.spec ) && cp ~/local/dev/rpmbuild/RPMS/i686/codemiscs-$(PACKAGE_VERSION)-*.*.i686.rpm $(top_srcdir)/ && cp ~/local/dev/rpmbuild/SRPMS/codemiscs-$(PACKAGE_VERSION)-*.*.src.rpm $(top_srcdir)/

upload:
	upload codemiscs $(PACKAGE_TARNAME) $(PACKAGE_VERSION) i686
