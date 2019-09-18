# This Makefile will treat all subdirectories the current directory as the root
# of a report.  Invoking make will recursively call make in each subdirectory.

REPORTS=$(shell find . -maxdepth 1 -type d | grep -v '^.$$')

.PHONY: all clean distclean
all clean distclean:
	for report in $(REPORTS); do \
		make -C $$report $@; \
	done
