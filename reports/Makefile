REPORTS=$(shell find . -maxdepth 1 -type d | grep -v '^.$$')

.PHONY: all clean distclean
all clean distclean:
	for report in $(REPORTS); do \
		make -C $$report $@; \
	done
