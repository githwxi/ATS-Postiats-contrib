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
f91_dats.pl
f91_dats.pl: f91.dats ; \
$(PATSOPT) -d $< | $(ATSCC2PL) -o $@
f91:: f91_dats.pl ; $(PERL) f91_dats.pl 23
regress:: f91
cleanall:: ; $(RMF) f91_dats.pl

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

all:: \
rtfind_dats.pl
rtfind_dats.pl: rtfind.dats ; \
$(PATSOPT) -d $< | $(ATSCC2PL) -o $@
rtfind:: rtfind_dats.pl ; $(PERL) rtfind_dats.pl
regress:: rtfind
cleanall:: ; $(RMF) rtfind_dats.pl

######

all:: \
rtfind2_dats.pl
rtfind2_dats.pl: rtfind2.dats ; \
$(PATSOPT) -d $< | $(ATSCC2PL) -o $@
rtfind2:: rtfind2_dats.pl ; $(PERL) rtfind2_dats.pl
regress:: rtfind2
cleanall:: ; $(RMF) rtfind2_dats.pl

######

all:: \
listlen_dats.pl
listlen_dats.pl: listlen.dats ; \
$(PATSOPT) -d $< | $(ATSCC2PL) -o $@
listlen:: listlen_dats.pl ; $(PERL) listlen_dats.pl
regress:: listlen
cleanall:: ; $(RMF) listlen_dats.pl

######

all:: \
listmap_dats.pl
listmap_dats.pl: listmap.dats ; \
$(PATSOPT) -d $< | $(ATSCC2PL) -o $@
listmap:: listmap_dats.pl ; $(PERL) listmap_dats.pl
regress:: listmap
cleanall:: ; $(RMF) listmap_dats.pl

######

all:: \
twice_dats.pl
twice_dats.pl: twice.dats ; \
$(PATSOPT) -d $< | $(ATSCC2PL) -o $@
twice:: twice_dats.pl ; $(PERL) twice_dats.pl
regress:: twice
cleanall:: ; $(RMF) twice_dats.pl

######

all:: \
sieve_lazy_dats.pl
sieve_lazy_dats.pl: sieve_lazy.dats ; \
$(PATSOPT) -d $< | $(ATSCC2PL) -o $@
sieve_lazy:: sieve_lazy_dats.pl ; $(PERL) sieve_lazy_dats.pl
regress:: sieve_lazy
cleanall:: ; $(RMF) sieve_lazy_dats.pl

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
