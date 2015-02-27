#
# A Simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

all::

######

all:: \
sieve
sieve: \
sieve.dats; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $< -lpthread
cleanall:: ; $(RMF) sieve

######

all:: \
bitstr
bitstr: \
bitstr.dats; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $< -lpthread
cleanall:: ; $(RMF) bitstr

######

all:: \
mergesort
mergesort: \
mergesort.dats; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $< -lpthread
cleanall:: ; $(RMF) mergesort

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c
clean:: ; $(RMF) *_?ats.o

######

cleanall:: clean

######

###### end of [Makefile] ######
