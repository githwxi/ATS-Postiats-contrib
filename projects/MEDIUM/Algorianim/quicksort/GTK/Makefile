#
# A simple Makefile
#

######

include \
$(PATSHOME)/share/atsmake-pre.mk

######
#
CFLAGS+=\
-I$(PATSHOME)/npm-utils/contrib/atscntrb
#
CFLAGS+=$(shell pkg-config gtk+-3.0 --cflags)
#
######

LDFLAGS += -lgc
LDFLAGS += $(shell pkg-config gtk+-3.0 --libs)

######

include \
$(PATSHOME)/share/atsmake-post.mk

######
#
PATSCC2=$(PATSCC) $(INCLUDE)
INCLUDE+=-IIATS $(PATSCONTRIB)/contrib
#
######
#
all:: \
quicksort_anim
quicksort_anim: \
quicksort_anim.dats ; \
  $(PATSCC2) -D_GNU_SOURCE -DATS_MEMALLOC_GCBDW -O2 -o $@ $(CFLAGS) $< $(LDFLAGS)
#
regress:: \
quicksort_anim; ./$<
cleanall:: ; $(RMF) quicksort_anim
#
######
#
all:: \
quicksort_anim2
quicksort_anim2: \
quicksort_anim2.dats \
gtkcairotimer_toplevel.dats ; \
$(PATSCC2) -D_GNU_SOURCE -DATS_MEMALLOC_GCBDW -O2 -o $@ $(CFLAGS) $^ $(LDFLAGS)
#
regress:: \
quicksort_anim2; ./$<
cleanall:: ; $(RMF) quicksort_anim2
#
######

MAKE=make

testall:: all
testall:: cleanall
testall:: ; $(MAKE) -C quicksort_anim3 cleanall

######

cleanats:: ; $(RMF) *_?ats.c

###### end of [Makefile] ######
