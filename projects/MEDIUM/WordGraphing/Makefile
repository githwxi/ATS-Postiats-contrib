#
# A simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

all:: words_main
regress: words_main; ./$<
cleanall:: ; $(RMF) words_main

######

words_main: \
words_main.dats ; \
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
