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

RMF=rm -f
RMRF=rm -rf

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
fact2:: fact2_dats.pl ; $(PERL) fact2_dats.pl 10
regress:: fact2
cleanall:: ; $(RMF) fact2_dats.pl

######

all:: \
acker_dats.pl
acker_dats.pl: acker.dats ; \
$(PATSOPT) -d $< | $(ATSCC2PL) -o $@
acker:: acker_dats.pl ; $(PERL) acker_dats.pl 3 3
regress:: acker
cleanall:: ; $(RMF) acker_dats.pl

######

CPF=cp -rf

######

libatscc2pl:: ; \
$(CPF) $(PATSHOME_contrib)/contrib/libatscc/libatscc2pl/libatscc2pl_all.pl libatscc2pl/.

######

clean:: ; $(RMF) *~

######

cleanall:: clean
cleanall:: ; $(RMF) *_?ats.c

###### end of [Makefile] ######
