#
# A simple Makefile
#

######

PATSCC=${PATSHOME}/bin/patscc
ATSCC2SCM=${PATSHOME}/bin/atscc2scm
LIBATSCC2SCM=$(PATSHOME_contrib)/contrib/libatscc/libatscc2scm

######
#
SCHEME=guile
SCHEME2=$(SCHEME) -l ./libatscc2scm_all.scm
#
######

all: \
GameOf24_scm_dats.scm

######

GameOf24_scm_dats.c: GameOf24_scm.dats; ${PATSCC} -ccats $<
GameOf24_scm_dats.scm: GameOf24_scm_dats.c; ${ATSCC2SCM} -o $@ -i $<

######
#
libatscc2scm:: ; \
  $(CPRF) $(LIBATSCC2SCM)/libatscc2scm_all.scm ./libatscc2scm
#
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
cleanall:: ; $(RMF) ./libatscc2scm/libatscc2scm_all.scm

###### end of [Makefile] ######
