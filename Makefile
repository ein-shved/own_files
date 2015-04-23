INSTALL = cp -r
PREFIX = /

install: etc home
	$(INSTALL) $^ /
