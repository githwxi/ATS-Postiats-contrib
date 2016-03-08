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
intset
intset: \
intset.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
cleanall:: ; $(RMF) intset

######

all:: \
test01-2p
test01-2p: \
test01-2p.dats; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $< -lpthread
cleanall:: ; $(RMF) test01-2p

######

all:: \
test02-2p
test02-2p: \
test02-2p.dats; \
$(PATSCC) --constraint-ignore \
  -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $< test_mylib.dats -lpthread
cleanall:: ; $(RMF) test02-2p

all:: \
test02-3p
test02-3p: \
test02-3p.dats; \
$(PATSCC) --constraint-ignore \
  -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $< test_mylib.dats -lpthread
cleanall:: ; $(RMF) test02-3p

######

all:: \
bitstr
bitstr: \
bitstr.dats; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $< test_mylib.dats -lpthread
cleanall:: ; $(RMF) bitstr

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
