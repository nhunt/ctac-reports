HTMLPATH=../ctac-mountaineers.github.io/reports

.PHONY: all clean distclean install
all clean distclean:
	make -C reports $@
