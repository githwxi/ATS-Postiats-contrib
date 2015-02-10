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

all::
regress::
cleanall::

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
layout_cs320.html
layout_cs320.html: layout_cs320; ./$< > $@
#
cleanall:: ; $(RMF) layout_cs320
#
######
all:: \
layout_ats2lang
layout_ats2lang: \
layout_ats2lang.dats; \
$(PATSCC2) \
  -D_GNU_SOURCE \
  -DATS_MEMALLOC_LIBC -o $@ $< myweboxy.dats
#
regress:: \
layout_ats2lang.html
layout_ats2lang.html: layout_ats2lang; ./$< > $@
#
cleanall:: ; $(RMF) layout_ats2lang
#
######

include $(PATSHOME)/share/atsmake-post.mk

######

testall:: all
testall:: regress
testall:: cleanall

######

cleanats:: ; $(RMF) *_?ats.c

######

cleanall:: cleanats
cleanall:: ; $(RMF) layout_cs320.html
cleanall:: ; $(RMF) layout_ats2lang.html

######

###### end of [Makefile] ######
