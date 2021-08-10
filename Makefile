VERSION = 0.4.0
SUITE ?= $(shell lsb_release -c|cut -f2)
ARCH ?= $(shell dpkg --print-architecture)

first: all

clean:
	rm -fr landrop-$(VERSION) landrop_$(VERSION)* build

prepare:
	debspawn create $(SUITE) --arch $(ARCH) || echo done.

landrop_$(VERSION).tar.gz:
	wget -O landrop_$(VERSION).tar.gz https://github.com/LANDrop/LANDrop/archive/refs/tags/v$(VERSION).tar.gz

landrop_$(VERSION).orig.tar.gz:	landrop_$(VERSION).tar.gz
	tar xzf landrop_$(VERSION).tar.gz
	mv LANDrop-$(VERSION)/ landrop-$(VERSION)
	tar czf landrop_$(VERSION).orig.tar.gz landrop-$(VERSION)

landrop_$(VERSION)/debian:	landrop_$(VERSION).orig.tar.gz
	cp -r debian/ landrop-$(VERSION)/debian/


build: landrop_$(VERSION)/debian prepare
	[ -d build ] || mkdir build
	debspawn build $(SUITE) landrop-$(VERSION) --arch $(ARCH) --results-dir build

all: clean prepare build
