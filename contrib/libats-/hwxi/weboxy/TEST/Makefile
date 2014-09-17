#
# A Simple Makefile
#

######

include \
$(PATSHOME)/share/atsmake-pre.mk

######

CFLAGS += -O2

######

LDFLAGS :=
LDFLAGS += -lgc

######
#
all:: \
layout_cs320
layout_cs320: \
layout_cs320.dats; \
$(PATSCC2) \
  -D_GNU_SOURCE \
  -DATS_MEMALLOC_LIBC -o $@ $< myweboxy.dats
#
regress:: \
layout_cs320 ; ./layout_cs320 > layout_cs320.html
#
cleanall:: ; $(RMF) layout_cs320
#
######

include $(PATSHOME)/share/atsmake-post.mk

######

cleanats:: ; $(RMF) *_?ats.c

######

cleanall:: cleanats
cleanall:: ; $(RMF) layout_cs320.html

######

###### end of [Makefile] ######
