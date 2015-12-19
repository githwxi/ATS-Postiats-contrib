#
# A simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

all:: words_all
regress: words_all; ./$<
cleanall:: ; $(RMF) words_all

######

words_all: \
words_all.dats ; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $< -latslib

######

testall:: all
testall:: regress
testall:: cleanall

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.o
clean:: ; $(RMF) *_?ats.c

######

cleanall:: clean

###### end of [Makefile] ######
