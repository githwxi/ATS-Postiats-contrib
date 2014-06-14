#
# A simple Makefile
#

######

include $(PATSHOME)/share/atsmake-pre.mk

######

CFLAGS=$(shell pkg-config gtk+-3.0 --cflags)

######

LDFLAGS += -lgc
LDFLAGS += $(shell pkg-config gtk+-3.0 --libs)

######

include $(PATSHOME)/share/atsmake-post.mk

######

all:: mergesort_anim
mergesort_anim: mergesort_anim.dats ; \
  $(PATSCC2) -D_GNU_SOURCE -DATS_MEMALLOC_GCBDW -O2 -o $@ $(CFLAGS) $< $(LDFLAGS)
cleanall:: ; $(RMF) mergesort_anim

######

all:: mergesort_anim2
mergesort_anim2: \
  mergesort_anim2.dats \
  gtkcairotimer_toplevel.dats ; \
  $(PATSCC2) -D_GNU_SOURCE -DATS_MEMALLOC_GCBDW -O2 -o $@ $(CFLAGS) $^ $(LDFLAGS)
cleanall:: ; $(RMF) mergesort_anim2

######

cleanats:: ; $(RMF) *_?ats.c

###### end of [Makefile] ######
