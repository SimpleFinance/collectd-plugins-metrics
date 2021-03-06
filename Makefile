NAME=collectd-plugins-metrics
VERSION=0.2.0
URL=https://github.com/SimpleFinance/$(NAME)
DESCRIPTION="Collectd plugin for metrics"
MAINTAINER=package@simple.com
ARCH=all
PACKAGE_NAME=$(NAME)
PACKAGE_VERSION=$(VERSION)

PREFIX=installroot/usr/lib/collectd/plugins
SOURCES=metrics-stats

.PHONY: default
default: package


test:
	./metrics-stats -f samples/metrics1.json

sources:
	echo "Installing from current dir"

install: sources
	install -d $(PREFIX)
	install $(SOURCES) $(PREFIX)

package: install
	fpm -s dir -t deb  -n $(PACKAGE_NAME)  -v $(PACKAGE_VERSION) \
                --url $(URL) --arch $(ARCH) --description $(DESCRIPTION) \
                -m $(MAINTAINER) \
		-p $(PACKAGE_NAME)-$(PACKAGE_VERSION)_$(ARCH).deb -C installroot .


distclean: clean
	@rm -f *.deb

clean:
	@rm -rf installroot
