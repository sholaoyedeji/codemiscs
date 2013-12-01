SUBDIRS = cmd mkproject tw rf imgs data doc dist
dist_doc_DATA = AUTHORS ChangeLog NEWS README COPYING

deepdistcheck:
	make && make clean && make && make distcheck

rpm: dist/codemiscs.spec
	cp $(top_srcdir)/codemiscs-$(PACKAGE_VERSION).tar.bz2 ~/rpmbuild/SOURCES/
	cp $(top_srcdir)/dist/codemiscs.spec ~/rpmbuild/SPECS
	( cd ~/rpmbuild/SPECS && rpmbuild -ba codemiscs.spec ) && cp ~/rpmbuild/RPMS/i686/codemiscs-$(PACKAGE_VERSION)-*.*.i686.rpm $(top_srcdir)/ && cp ~/rpmbuild/SRPMS/codemiscs-$(PACKAGE_VERSION)-*.*.src.rpm $(top_srcdir)/

upload:
	upload codemiscs $(PACKAGE_TARNAME) $(PACKAGE_VERSION) i686
