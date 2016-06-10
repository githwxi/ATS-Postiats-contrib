#
# A simple Makefile
#

######

PATSCC=${PATSHOME}/bin/patscc
ATSCC2SCM=${PATSHOME}/bin/atscc2scm

######

all: \
GameOf24_scm_dats.scm

######

GameOf24_scm_dats.c: GameOf24_scm.dats; ${PATSCC} -ccats $<
GameOf24_scm_dats.scm: GameOf24_scm_dats.c; ${ATSCC2SCM} -o $@ -i $<

######

RMF=rm -f
RMRF=rm -rf

######

CPRF=cp -rf

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) GameOf24_scm_dats.c

######

cleanall:: clean
cleanall:: ; $(RMF) GameOf24_scm_dats.scm

###### end of [Makefile] ######
