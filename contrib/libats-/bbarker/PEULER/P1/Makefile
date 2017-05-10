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
P1-hwxi
P1-hwxi: P1-hwxi.dats; $(PATSCC) -o $@ $<
regress:: P1-hwxi; ./P1-hwxi
cleanall:: ; $(RMF) P1-hwxi

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c

######

cleanall:: clean

######

###### end of [Makefile] ######
