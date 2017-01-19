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
#
all:: \
test1_tokenizer
regress:: \
test1_tokenizer; $(CAT) test1_tokenizer.dats | ./$< 
test1_tokenizer: \
test1_tokenizer.dats ; \
$(PATSCC) -O2 -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $< $(MYLIBSRC)
#
######

CAT=cat
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
cleanall:: ; $(RMF) test1_tokenizer

###### end of [Makefile] ######
