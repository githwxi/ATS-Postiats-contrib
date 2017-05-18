#
# A simple Makefile
#

######
#
PATSCC=${PATSHOME}/bin/patscc
PATSOPT=${PATSHOME}/bin/patsopt
ATSCC2SCM=${PATSHOME}/bin/atscc2scm
#
LIBATSCC2SCM=$(PATSHOME)/contrib/libatscc2scm/ATS2-0.3.2
#
######
#
SCHEME=guile
SCHEME2=$(SCHEME) -l ./libatscc2scm/libatscc2scm_all.scm
#
######
#
all:: \
GameOf24_scm_dats.scm
GameOf24_scm_dats.c: GameOf24_scm.dats; $(PATSOPT) -o $@ -d $<
GameOf24_scm_dats.scm: GameOf24_scm_dats.c; $(ATSCC2SCM) -o $@ -i $<
#
######
#
regress:: \
GameOf24_scm_dats.scm; $(SCHEME2) $<
cleanall:: ; $(RMF) GameOf24_scm_dats.scm
#
######
#
libatscc2scm:: ; \
  $(CPRF) $(LIBATSCC2SCM)/output/libatscc2scm_all.scm ./libatscc2scm/.
#
######

testall:: all
testall:: regress
testall:: cleanall

######

RMF=rm -f
RMRF=rm -rf

######

CPRF=cp -rf

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) GameOf24_scm_dats.c

######
#
cleanall:: clean
cleanall:: ; $(RMF) GameOf24_scm_dats.scm
#
# cleanall:: ; $(RMF) ./libatscc2scm/libatscc2scm_all.scm
#
###### end of [Makefile] ######
