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

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c
clean:: ; $(RMF) *_?ats.o

######

cleanall:: clean

######

###### end of [Makefile] ######
