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

ATSCC2ERL=$(PATSHOME)/bin/atscc2erl

######

all::
regress::
cleanall::

######

all:: \
fact_dats.erl
fact_dats.erl: fact.dats ; \
$(PATSOPT2) -d $< | $(ATSCC2ERL) -o $@
fact_dats.beam:: fact_dats.erl ; $(ERLC) $< 
regress:: fact_dats.beam; $(ERL) -run fact_dats main0_erl -run init stop -noshell
cleanall:: ; $(RMF) fact_dats.erl

######

all:: \
sieve_dats.erl
sieve_dats.erl: sieve.dats ; \
$(PATSOPT2) -d $< | $(ATSCC2ERL) -o $@
sieve_dats.beam:: sieve_dats.erl ; $(ERLC) $< 
regress:: sieve_dats.beam; $(ERL) -run sieve_dats main0_erl -run init stop -noshell
cleanall:: ; $(RMF) sieve_dats.erl

######

all:: \
bitstr_dats.erl
bitstr_dats.erl: bitstr.dats ; \
$(PATSOPT2) -d $< | $(ATSCC2ERL) -o $@
bitstr_dats.beam:: bitstr_dats.erl ; $(ERLC) $< 
regress:: bitstr_dats.beam; $(ERL) -run bitstr_dats main0_erl -run init stop -noshell
cleanall:: ; $(RMF) bitstr_dats.erl

######

testall:: all
testall:: regress
testall:: cleanall

######

CPF=cp -f
CPRF=cp -rf
RMF=rm -f
RMRF=rm -rf

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c
clean:: ; $(RMF) *_?ats.beam
clean:: ; $(RMF) erl_crash.dump

######

cleanall:: clean

###### end of [Makefile] ######
