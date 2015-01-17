#
# A simple Makefile
#

######

GCC=gcc

######

PATSHOMEQ="$(PATSHOME)"
PATSHOMERELOCQ="$(PATSHOMERELOC)"

######

PATSCC=$(PATSHOMEQ)/bin/patscc
PATSOPT=$(PATSHOMEQ)/bin/patsopt

######

INCLUDE=-I$(PATSHOMERELOC)/contrib/SMT

######

all::
regress::

######

all:: \
test00
test00: \
test00.dats ; $(PATSCC) $(INCLUDE) -o $@ $<
regress:: \
test00; ./test00
cleanall:: ; $(RMF) test00

######

all:: \
test01
test01: \
test01.dats ; $(PATSCC) $(INCLUDE) -o $@ $<
regress:: \
test01; ./test01
cleanall:: ; $(RMF) test01

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *.o
clean:: ; $(RMF) *_?ats.c

######

cleanall:: clean

###### end of [Makefile] ######
