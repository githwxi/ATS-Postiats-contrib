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
f91_dats.scm
f91_dats.scm: f91.dats ; $(PATSOPT2) -d $< | $(ATSCC2SCM) -o $@
cleanall:: ; $(RMF) f91_dats.scm

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

all:: \
isevn_dats.scm
isevn_dats.scm: isevn.dats ; $(PATSOPT2) -d $< | $(ATSCC2SCM) -o $@
cleanall:: ; $(RMF) isevn_dats.scm

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
#
libatscc2scm:: ; \
$(CPRF) $(PATSHOME_contrib)/contrib/libatscc/libatscc2scm/CATS/* libatscc2scm/CATS/.
#
######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c

######

cleanall:: clean

###### end of [Makefile] ######
