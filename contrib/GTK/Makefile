SUBDIRS := TEST

all regress cleanall:
	@for i in $(SUBDIRS); do \
		$(MAKE) -C $$i $@; \
	done
