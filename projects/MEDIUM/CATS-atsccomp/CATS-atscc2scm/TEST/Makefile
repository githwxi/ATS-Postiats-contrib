#
# A Simple Makefile
#

######

SCHEME=scm

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
PATSOPT2=$(PATSOPT) --tlcalopt-disable

######

ATSCC2SCM=./../atscc2scm

######

all::
regress::
cleanall::

######

all:: \
fact_dats.scm
fact_dats.scm: fact.dats ; $(PATSOPT2) -d $< | $(ATSCC2SCM) -o $@
cleanall:: ; $(RMF) fact_dats.scm

######

all:: \
acker_dats.scm
acker_dats.scm: acker.dats ; $(PATSOPT2) -d $< | $(ATSCC2SCM) -o $@
cleanall:: ; $(RMF) acker_dats.scm

######

testall:: all
testall:: cleanall

######
#
CPF=cp -f
CPRF=cp -rf
#
RMF=rm -f
RMRF=rm -rf
#
######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c

######

cleanall:: clean

###### end of [Makefile] ######
