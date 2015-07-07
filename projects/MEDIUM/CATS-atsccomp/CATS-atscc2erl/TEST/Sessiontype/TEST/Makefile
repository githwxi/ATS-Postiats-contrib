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
