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
P16-hwxi
P16-hwxi: P16-hwxi.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
regress:: P16-hwxi; ./P16-hwxi
cleanall:: ; $(RMF) P16-hwxi

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c

######

cleanall:: clean

######

###### end of [Makefile] ######
