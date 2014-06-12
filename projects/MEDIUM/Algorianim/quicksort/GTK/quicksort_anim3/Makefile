#
# A simple Makefile
#

######

PATSCC=patscc2
export PATSOPT=patsopt2

######

CFLAGS=$(shell pkg-config gtk+-3.0 --cflags)

######

LDFLAGS += -lgc
LDFLAGS += $(shell pkg-config gtk+-3.0 --libs)

######

all:: array0_qsort_anim
array0_qsort_anim: \
  array0_qsort_anim.dats \
  gtkcairotimer_toplevel.dats ; \
  $(PATSCC) -I$(PATSHOMERELOC)/contrib -D_GNU_SOURCE -DATS_MEMALLOC_GCBDW -O2 -o $@ $(CFLAGS) $^ $(LDFLAGS)
cleanall:: ; $(RMF) array0_qsort_anim

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.o
clean:: ; $(RMF) *_?ats.c

cleanall:: clean
cleanall:: ; $(RMF) array0_qsort_test

######

###### end of [Makefile] ######
