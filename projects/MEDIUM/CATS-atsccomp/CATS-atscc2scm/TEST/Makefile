#
# A Simple Makefile
#

######

SCHEME=guile

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
PATSOPT2=$(PATSOPT) --tlcalopt-disable

######

ATSCC2SCM=./../atscc2scm
LIBATSCC2SCM=./libatscc2scm

######

all::
regress::
cleanall::

######

all:: \
f91_dats.scm
f91_dats.scm: f91.dats ; $(PATSOPT2) -d $< | $(ATSCC2SCM) -o $@
regress:: f91_dats.scm ; $(SCHEME) -l $(LIBATSCC2SCM)/libatscc2scm_all.scm $<
cleanall:: ; $(RMF) f91_dats.scm

######

all:: \
fact_dats.scm
fact_dats.scm: fact.dats ; $(PATSOPT2) -d $< | $(ATSCC2SCM) -o $@
regress:: fact_dats.scm ; $(SCHEME) -l $(LIBATSCC2SCM)/libatscc2scm_all.scm $<
cleanall:: ; $(RMF) fact_dats.scm

######

all:: \
fact2_dats.scm
fact2_dats.scm: fact2.dats ; $(PATSOPT2) -d $< | $(ATSCC2SCM) -o $@
regress:: fact2_dats.scm ; $(SCHEME) -l $(LIBATSCC2SCM)/libatscc2scm_all.scm $<
cleanall:: ; $(RMF) fact2_dats.scm

######

all:: \
fact3_dats.scm
fact3_dats.scm: fact3.dats ; $(PATSOPT2) -d $< | $(ATSCC2SCM) -o $@
regress:: fact3_dats.scm ; $(SCHEME) -l $(LIBATSCC2SCM)/libatscc2scm_all.scm $<
cleanall:: ; $(RMF) fact3_dats.scm

######

all:: \
fact4_dats.scm
fact4_dats.scm: fact4.dats ; $(PATSOPT2) -d $< | $(ATSCC2SCM) -o $@
regress:: fact4_dats.scm ; $(SCHEME) -l $(LIBATSCC2SCM)/libatscc2scm_all.scm $<
cleanall:: ; $(RMF) fact4_dats.scm

######

all:: \
acker_dats.scm
acker_dats.scm: acker.dats ; $(PATSOPT2) -d $< | $(ATSCC2SCM) -o $@
regress:: acker_dats.scm ; $(SCHEME) -l $(LIBATSCC2SCM)/libatscc2scm_all.scm $<
cleanall:: ; $(RMF) acker_dats.scm

######

all:: \
isevn_dats.scm
isevn_dats.scm: isevn.dats ; $(PATSOPT2) -d $< | $(ATSCC2SCM) -o $@
regress:: isevn_dats.scm ; $(SCHEME) -l $(LIBATSCC2SCM)/libatscc2scm_all.scm $<
cleanall:: ; $(RMF) isevn_dats.scm

######
#
all:: \
rtfind_dats.scm
rtfind_dats.scm: \
  rtfind.dats ; $(PATSOPT2) -d $< | $(ATSCC2SCM) -o $@
regress:: \
  rtfind_dats.scm ; $(SCHEME) -l $(LIBATSCC2SCM)/libatscc2scm_all.scm $<
cleanall:: ; $(RMF) rtfind_dats.scm
#
all:: \
rtfind2_dats.scm
rtfind2_dats.scm: \
  rtfind2.dats ; $(PATSOPT2) -d $< | $(ATSCC2SCM) -o $@
regress:: \
  rtfind2_dats.scm ; $(SCHEME) -l $(LIBATSCC2SCM)/libatscc2scm_all.scm $<
cleanall:: ; $(RMF) rtfind2_dats.scm
#
######
#
all:: \
twice_dats.scm
twice_dats.scm: \
twice.dats ; $(PATSOPT2) -d $< | $(ATSCC2SCM) -o $@
#
regress:: twice_dats.scm ; \
  $(SCHEME) -l $(LIBATSCC2SCM)/libatscc2scm_all.scm $<
#
cleanall:: ; $(RMF) twice_dats.scm
#
######

all:: \
queens_dats.scm
queens_dats.scm: queens.dats ; $(PATSOPT2) -d $< | $(ATSCC2SCM) -o $@
regress:: queens_dats.scm ; $(SCHEME) -l $(LIBATSCC2SCM)/libatscc2scm_all.scm $<
cleanall:: ; $(RMF) queens_dats.scm

######

all:: \
listlen_dats.scm
listlen_dats.scm: listlen.dats ; $(PATSOPT2) -d $< | $(ATSCC2SCM) -o $@
regress:: listlen_dats.scm ; $(SCHEME) -l $(LIBATSCC2SCM)/libatscc2scm_all.scm $<
cleanall:: ; $(RMF) listlen_dats.scm

######

all:: \
listmap_dats.scm
listmap_dats.scm: listmap.dats ; $(PATSOPT2) -d $< | $(ATSCC2SCM) -o $@
regress:: listmap_dats.scm ; $(SCHEME) -l $(LIBATSCC2SCM)/libatscc2scm_all.scm $<
cleanall:: ; $(RMF) listmap_dats.scm

######

all:: \
weekday_dats.scm
weekday_dats.scm: weekday.dats ; $(PATSOPT2) -d $< | $(ATSCC2SCM) -o $@
regress:: weekday_dats.scm ; $(SCHEME) -l $(LIBATSCC2SCM)/libatscc2scm_all.scm $<
cleanall:: ; $(RMF) weekday_dats.scm

######

all:: \
sieve_lazy_dats.scm
sieve_lazy_dats.scm: sieve_lazy.dats ; $(PATSOPT2) -d $< | $(ATSCC2SCM) -o $@
regress:: sieve_lazy_dats.scm ; $(SCHEME) -l $(LIBATSCC2SCM)/libatscc2scm_all.scm $<
cleanall:: ; $(RMF) sieve_lazy_dats.scm

######

testall:: all
testall:: regress
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
libatscc2scm:: ; \
$(CPRF) $(PATSHOME_contrib)/contrib/libatscc/libatscc2scm/libatscc2scm_all.scm libatscc2scm/.
#
######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c

######

cleanall:: clean

###### end of [Makefile] ######
