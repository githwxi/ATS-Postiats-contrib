SUBDIRS := contrib document projects

all regress cleanall:
	@for i in $(SUBDIRS); do \
		$(MAKE) -C $$i $@; \
	done
