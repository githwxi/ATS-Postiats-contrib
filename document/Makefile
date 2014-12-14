SUBDIRS :=

all regress:
	@for i in $(SUBDIRS); do \
		$(MAKE) -C $$i $@; \
	done
