#
# A Simple Makefile
#

######

ERL=erl
ERLC=erlc

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
PATSOPT2=$(PATSOPT) --tlcalopt-disable

######

ATSCC2ERL=./../atscc2erl

######

all::
cleanall::

######

all:: \
f91_dats.erl
f91_dats.erl: f91.dats ; \
$(PATSOPT2) -d $< | $(ATSCC2ERL) -o $@
f91_dats.beam:: f91_dats.erl ; $(ERLC) $< 
regress:: f91_dats.beam; $(ERL) -run f91_dats mytest -run init stop -noshell
cleanall:: ; $(RMF) f91_dats.erl

######

all:: \
fact_dats.erl
fact_dats.erl: fact.dats ; \
$(PATSOPT2) -d $< | $(ATSCC2ERL) -o $@
fact_dats.beam:: fact_dats.erl ; $(ERLC) $< 
regress:: fact_dats.beam; $(ERL) -run fact_dats mytest -run init stop -noshell
cleanall:: ; $(RMF) fact_dats.erl

######

all:: \
fact2_dats.erl
fact2_dats.erl: fact2.dats ; \
$(PATSOPT2) -d $< | $(ATSCC2ERL) -o $@
fact2_dats.beam:: fact2_dats.erl ; $(ERLC) $< 
regress:: fact2_dats.beam; $(ERL) -run fact2_dats mytest -run init stop -noshell
cleanall:: ; $(RMF) fact2_dats.erl

######

all:: \
acker_dats.erl
acker_dats.erl: acker.dats ; \
$(PATSOPT2) -d $< | $(ATSCC2ERL) -o $@
acker_dats.beam:: acker_dats.erl ; $(ERLC) $< 
regress:: acker_dats.beam; $(ERL) -run acker_dats mytest -run init stop -noshell
cleanall:: ; $(RMF) acker_dats.erl

######

all:: \
isevn_dats.erl
isevn_dats.erl: isevn.dats ; \
$(PATSOPT2) -d $< | $(ATSCC2ERL) -o $@
isevn_dats.beam:: isevn_dats.erl ; $(ERLC) $< 
regress:: isevn_dats.beam; $(ERL) -run isevn_dats mytest -run init stop -noshell
cleanall:: ; $(RMF) isevn_dats.erl

######

all:: \
listlen_dats.erl
listlen_dats.erl: listlen.dats ; \
$(PATSOPT2) -d $< | $(ATSCC2ERL) -o $@
listlen_dats.beam:: listlen_dats.erl ; $(ERLC) $< 
regress:: listlen_dats.beam; $(ERL) -run listlen_dats mytest -run init stop -noshell
cleanall:: ; $(RMF) listlen_dats.erl

######

all:: \
queens_dats.erl
queens_dats.erl: queens.dats ; \
$(PATSOPT2) -d $< | $(ATSCC2ERL) -o $@
queens_dats.beam:: queens_dats.erl ; $(ERLC) $< 
regress:: queens_dats.beam; $(ERL) -run queens_dats mytest -run init stop -noshell
cleanall:: ; $(RMF) queens_dats.erl

######

CPF=cp -f
CPRF=cp -rf
RMF=rm -f
RMRF=rm -rf

######

libatscc2erl:: ; \
$(CPF) $(PATSHOME_contrib)/contrib/libatscc/libatscc2erl/libatscc2erl_all.hrl libatscc2erl/.

######

clean:: ; $(RMF) *~

######

cleanall:: clean
cleanall:: ; $(RMF) *_?ats.c
cleanall:: ; $(RMF) *_?ats.beam
cleanall:: ; $(RMRF) libatscc2erl/libatscc2erl_all.hrl

###### end of [Makefile] ######
