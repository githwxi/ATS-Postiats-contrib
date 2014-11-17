#
# A Simple Makefile
#

######

PERL=perl

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

ATSCC2PL=./../atscc2pl

######

all::
cleanall::

######

all:: \
fact_dats.pl
fact_dats.pl: fact.dats ; \
$(PATSOPT) -d $< | $(ATSCC2PL) -o $@
fact:: fact_dats.pl ; $(PERL) fact_dats.pl
regress:: fact
cleanall:: ; $(RMF) fact_dats.pl

######

all:: \
fact2_dats.pl
fact2_dats.pl: fact2.dats ; \
$(PATSOPT) -d $< | $(ATSCC2PL) -o $@
fact2:: fact2_dats.pl ; $(PERL) fact2_dats.pl
regress:: fact2
cleanall:: ; $(RMF) fact2_dats.pl

######

all:: \
acker_dats.pl
acker_dats.pl: acker.dats ; \
$(PATSOPT) -d $< | $(ATSCC2PL) -o $@
acker:: acker_dats.pl ; $(PERL) acker_dats.pl
regress:: acker
cleanall:: ; $(RMF) acker_dats.pl

######

all:: \
isevn_dats.pl
isevn_dats.pl: isevn.dats ; \
$(PATSOPT) -d $< | $(ATSCC2PL) -o $@
isevn:: isevn_dats.pl ; $(PERL) isevn_dats.pl
regress:: isevn
cleanall:: ; $(RMF) isevn_dats.pl

######

all:: \
queens_dats.pl
queens_dats.pl: queens.dats ; \
$(PATSOPT) -d $< | $(ATSCC2PL) -o $@
queens:: queens_dats.pl ; $(PERL) queens_dats.pl
regress:: queens
cleanall:: ; $(RMF) queens_dats.pl

######

all:: \
weekday_dats.pl
weekday_dats.pl: weekday.dats ; \
$(PATSOPT) -d $< | $(ATSCC2PL) -o $@
weekday:: weekday_dats.pl ; $(PERL) weekday_dats.pl
regress:: weekday
cleanall:: ; $(RMF) weekday_dats.pl

######

CPF=cp -f
CPRF=cp -rf
RMF=rm -f
RMRF=rm -rf

######

libatscc2pl:: ; \
$(CPF) $(PATSHOME_contrib)/contrib/libatscc/libatscc2pl/libatscc2pl_all.pl libatscc2pl/.

######

clean:: ; $(RMF) *~

######

cleanall:: clean
cleanall:: ; $(RMF) *_?ats.c
cleanall:: ; $(RMRF) libatscc2pl/*

###### end of [Makefile] ######
