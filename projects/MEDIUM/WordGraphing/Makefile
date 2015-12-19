#
# A simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

words_main: \
words_main.dats ; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $< -latslib

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.o
clean:: ; $(RMF) *_?ats.c

######

cleanall:: clean
cleanall:: ; $(RMF) words_main

###### end of [Makefile] ######
