#
# A simple Makefile
#

######

include \
$(PATSHOME)/share/atsmake-pre.mk

######
#
CFLAGS+=\
-I$(PATSHOME)/npm-utils/contrib
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
all:: insertsort_anim
#
insertsort_anim: \
  ./../insertsort.dats \
  insertsort_anim.dats ; \
  $(PATSCC2) -D_GNU_SOURCE -DATS_MEMALLOC_GCBDW -O2 -o $@ $(CFLAGS) $^ $(LDFLAGS)
#
regress:: \
insertsort_anim; ./$<
cleanall:: ; $(RMF) insertsort_anim
#
######
#
all:: insertsort_anim2
#
insertsort_anim2: \
  ./../insertsort.dats \
  insertsort_anim2.dats \
  gtkcairotimer_toplevel.dats ; \
  $(PATSCC2) -D_GNU_SOURCE -DATS_MEMALLOC_GCBDW -O2 -o $@ $(CFLAGS) $^ $(LDFLAGS)
#
regress:: \
insertsort_anim2; ./$<
cleanall:: ; $(RMF) insertsort_anim2
#
######
#
all:: \
insertsort_anim2_all
#
insertsort_anim2_all: \
  insertsort_anim2_all.dats ; \
  $(PATSCC2) -D_GNU_SOURCE -DATS_MEMALLOC_GCBDW -O2 -o $@ $(CFLAGS) $^ $(LDFLAGS)
#
regress:: \
insertsort_anim2_all; ./$<
cleanall:: ; $(RMF) insertsort_anim2_all
#
######

testall:: all
testall:: regress
testall:: cleanall

######

cleanats:: ; $(RMF) *_?ats.c

###### end of [Makefile] ######
