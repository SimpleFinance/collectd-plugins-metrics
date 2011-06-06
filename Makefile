VERSION=0.1.0
NAME=collectd-plugin-metrics

PREFIX=/usr
PLUGIN_DIR=${PREFIX}/lib/collectd/plugins

install: metrics-stats
	install -d ${DEST_DIR}${PLUGIN_DIR}
	install metrics-stats ${DEST_DIR}${PLUGIN_DIR}

clean:
	@rm ${NAME}-${VERSION}.tar.gz


dist:
	@echo "creating archive ${NAME}-${VERSION}.tar.gz..."
	git archive --format=tar --prefix="${NAME}-${VERSION}/" HEAD | gzip > "${NAME}-${VERSION}.tar.gz"

