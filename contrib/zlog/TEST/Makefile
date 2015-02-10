#
# A simple Makefile
#

######

PATSHOMEQ="$(PATSHOME)"
PATSHOMERELOCQ="$(PATSHOMERELOC)"

######

PATSCC=$(PATSHOMEQ)/bin/patscc
PATSOPT=$(PATSHOMEQ)/bin/patsopt

######

all::
regress::
cleanall::

######

all:: test01
test01: test01.dats ; \
  $(PATSCC) -cleanaft --gline -IIATS $(PATSHOMERELOCQ)/contrib -o $@ $< -lzlog
regress:: test01; ./$<
cleanall:: ; $(RMF) test01

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c
clean:: ; $(RMF) *_?ats.o

cleanall:: clean

###### end of [Makefile] ######
