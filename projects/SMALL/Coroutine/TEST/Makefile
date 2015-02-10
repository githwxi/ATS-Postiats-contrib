#
# A simple Makefile
#

######

PATSHOMEQ="$(PATSHOME)"

######

PATSCC=$(PATSHOMEQ)/bin/patscc
PATSOPT=$(PATSHOMEQ)/bin/patsopt

######

all::

######
#
all:: test1
test1: test1.dats ; $(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
regress:: test1; ./test1
cleanall:: ; $(RMF) test1
#
######

testall:: all
testall:: regress
testall:: cleanall

######

RMF=rm -f

######

clean:: ; $(RMF) *_?ats.c
clean:: ; $(RMF) *_?ats.o

######

cleanall:: clean

######

###### end of [Makefile] ######