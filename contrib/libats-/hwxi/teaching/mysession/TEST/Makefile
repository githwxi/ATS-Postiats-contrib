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
test00
test00: \
test00.dats; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $< -lpthread
regress:: test00; ./$<
cleanall:: ; $(RMF) test00

######

all:: \
test01
test01: \
test01.dats; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $< -lpthread
regress:: test01; ./$<
cleanall:: ; $(RMF) test01

######

all:: \
sieve
sieve: \
sieve.dats; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $< -lpthread
regress:: sieve; ./$<
cleanall:: ; $(RMF) sieve

######

all:: \
bitstr
bitstr: \
bitstr.dats; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $< -lpthread
regress:: \
bitstr; ./bitstr 123 978
cleanall:: ; $(RMF) bitstr

######

all:: \
queue
queue: \
queue.dats; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $< -lpthread
regress:: queue; ./$<
cleanall:: ; $(RMF) queue

######

all:: \
mergesort
mergesort: \
mergesort.dats; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $< -lpthread
regress:: mergesort; ./$<
cleanall:: ; $(RMF) mergesort

######

RMF=rm -f

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c
clean:: ; $(RMF) *_?ats.o

######

cleanall:: clean

######

###### end of [Makefile] ######
