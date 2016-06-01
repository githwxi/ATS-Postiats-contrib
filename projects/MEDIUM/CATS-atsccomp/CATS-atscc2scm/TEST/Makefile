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
fact2_dats.scm
fact2_dats.scm: fact2.dats ; $(PATSOPT2) -d $< | $(ATSCC2SCM) -o $@
cleanall:: ; $(RMF) fact2_dats.scm

######

all:: \
fact3_dats.scm
fact3_dats.scm: fact3.dats ; $(PATSOPT2) -d $< | $(ATSCC2SCM) -o $@
cleanall:: ; $(RMF) fact3_dats.scm

######

all:: \
fact4_dats.scm
fact4_dats.scm: fact4.dats ; $(PATSOPT2) -d $< | $(ATSCC2SCM) -o $@
cleanall:: ; $(RMF) fact4_dats.scm

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

all:: \
rtfind_dats.scm
rtfind_dats.scm: \
  rtfind.dats ; $(PATSOPT2) -d $< | $(ATSCC2SCM) -o $@
cleanall:: ; $(RMF) rtfind_dats.scm

all:: \
rtfind2_dats.scm
rtfind2_dats.scm: \
  rtfind2.dats ; $(PATSOPT2) -d $< | $(ATSCC2SCM) -o $@
cleanall:: ; $(RMF) rtfind2_dats.scm

######

all:: \
twice_dats.scm
twice_dats.scm: twice.dats ; $(PATSOPT2) -d $< | $(ATSCC2SCM) -o $@
cleanall:: ; $(RMF) twice_dats.scm

######

all:: \
queens_dats.scm
queens_dats.scm: queens.dats ; $(PATSOPT2) -d $< | $(ATSCC2SCM) -o $@
cleanall:: ; $(RMF) queens_dats.scm

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
