#
# A simple Makefile
#

######

include $(PATSHOME)/share/atsmake-pre.mk

######
#
CFLAGS+=\
-I$(PATSCONTRIB)/contrib
CFLAGS+=\
-I$(PATSHOME)/npm-utils/contrib/atscntrb
#
CFLAGS+=$(shell pkg-config gtk+-3.0 --cflags)
#
######

LDFLAGS += -lgc
LDFLAGS += $(shell pkg-config gtk+-3.0 --libs)

######

include $(PATSHOME)/share/atsmake-post.mk

######

all:: \
array0_msort_anim
array0_msort_anim: \
  array0_msort_anim.dats \
  gtkcairotimer_toplevel.dats ; \
  $(PATSCC2) -D_GNU_SOURCE -DATS_MEMALLOC_GCBDW -O2 -o $@ $(CFLAGS) $^ $(LDFLAGS)
cleanall:: ; $(RMF) array0_msort_anim

######

cleanats:: ; $(RMF) *_?ats.c

###### end of [Makefile] ######
