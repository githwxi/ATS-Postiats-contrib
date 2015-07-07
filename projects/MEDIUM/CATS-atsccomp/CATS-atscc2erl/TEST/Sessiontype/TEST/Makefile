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

ATSCC2ERL=./../../../atscc2erl

######

all::
regress::
cleanall::

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

all:: \
queue_dats.erl
queue_dats.erl: queue.dats ; \
$(PATSOPT2) -d $< | $(ATSCC2ERL) -o $@
queue_dats.beam:: queue_dats.erl ; $(ERLC) $< 
regress:: queue_dats.beam; $(ERL) -run queue_dats main0_erl -run init stop -noshell
cleanall:: ; $(RMF) queue_dats.erl

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
clean:: ; $(RMF) *_?ats.c
clean:: ; $(RMF) *_?ats.beam
clean:: ; $(RMF) erl_crash.dump

######

cleanall:: clean

###### end of [Makefile] ######
