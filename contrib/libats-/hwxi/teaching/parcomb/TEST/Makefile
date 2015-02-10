#
# A simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

MYLIBSRC :=
MYLIBSRC += ./../SATS/parcomb.sats
MYLIBSRC += ./../DATS/parcomb.dats

######

test1_tokenizer: \
test1_tokenizer.dats ; \
$(PATSCC) -O2 -D_GNU_SOURCE -DATS_MEMALLOC_GCBDW -o $@ $< $(MYLIBSRC) -lgc
cleanall:: ; $(RMF) test1_tokenizer

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c
clean:: ; $(RMF) *_?ats.o

######

cleanall:: clean

###### end of [Makefile] ######