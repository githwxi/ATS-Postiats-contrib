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
regress::
cleanall::

######
#
all:: \
test01
test01: \
test01.dats ; \
$(PATSCC) \
-DATS_MEMALLOC_LIBC -o $@ $< -latslib
#
regress:: test01; ./$<
cleanall:: ; $(RMF) test01
#
######

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
cleanall:: ; $(RMF) test01_dats.scad

###### end of [Makefile] ######
