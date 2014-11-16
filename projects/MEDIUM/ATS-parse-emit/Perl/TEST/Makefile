#
# A Simple Makefile
#

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
cleanall:: ; $(RMF) fact_dats.pl

######

CPF=cp -rf

######

libatscc2pl:: ; \
$(CPF) $(PATSHOME_contrib)/contrib/libatscc/libatscc2pl/CATS/*_cats.pl libatscc2pl/CATS/.
libatscc2pl:: ; \
$(CPF) $(PATSHOME_contrib)/contrib/libatscc/libatscc2pl/output/DATS/*_dats.pl libatscc2pl/DATS/.

######

clean:: ; $(RMF) *~

######

cleanall:: clean
cleanall:: ; $(RMF) *_?ats.c

###### end of [Makefile] ######
