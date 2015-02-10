#
# A simple Makefile
#

######

PATSCC=${PATSHOME}/bin/patscc
PATSOPT=${PATSHOME}/bin/patsopt

######

all::
regress::
cleanall::

######

all:: \
P2-hwxi
P2-hwxi: \
P2-hwxi.dats; \
$(PATSCC) -o $@ $<
regress:: P2-hwxi; ./$<
cleanall:: ; $(RMF) P2-hwxi

######

all:: \
P2-hwxi-2
P2-hwxi-2: \
P2-hwxi-2.dats; \
$(PATSCC) -o $@ $<
regress:: P2-hwxi-2; ./$<
cleanall:: ; $(RMF) P2-hwxi-2

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c

######

cleanall:: clean

######

###### end of [Makefile] ######
