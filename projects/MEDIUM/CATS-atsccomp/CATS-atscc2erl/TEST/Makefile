#
# A Simple Makefile
#

######

ERL=erl

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

ATSCC2ERL=./../atscc2erl

######

all::
cleanall::

######

all:: \
fact_dats.erl
fact_dats.erl: fact.dats ; \
$(PATSOPT) -d $< | $(ATSCC2ERL) -o $@
fact:: fact_dats.erl ; $(PERL) fact_dats.erl
regress:: fact
cleanall:: ; $(RMF) fact_dats.erl

######

all:: \
fact2_dats.erl
fact2_dats.erl: fact2.dats ; \
$(PATSOPT) -d $< | $(ATSCC2ERL) -o $@
fact2:: fact2_dats.erl ; $(PERL) fact2_dats.erl
regress:: fact2
cleanall:: ; $(RMF) fact2_dats.erl

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
