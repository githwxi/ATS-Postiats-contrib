#
# A simple Makefile
#

######

PERL=perl
export PERLPATH=libatscc2pl/.

######

PATSCC=${PATSHOME}/bin/patscc
ATSCC2PL=${PATSHOME}/bin/atscc2pl

######

all: GameOf24_pl_dats.pl; $(PERL) $<

######

GameOf24_pl_dats.c: GameOf24_pl.dats; ${PATSCC} -ccats $<
GameOf24_pl_dats.pl: GameOf24_pl_dats.c; ${ATSCC2PL} -o $@ -i $<

######

RMF=rm -f
RMRF=rm -rf

######

CPRF=cp -rf

######
#
libatscc2pl:: ; \
$(CPRF) $(PATSHOME_contrib)/contrib/libatscc/libatscc2pl/libatscc2pl_all.pl libatscc2pl/.
#
######

clean:: ; $(RMF) *~
clean:: ; $(RMF) GameOf24_pl_dats.c

######

cleanall:: clean
cleanall:: ; $(RMF) GameOf24_pl_dats.pl
cleanall:: ; $(RMF) libatscc2pl/libatscc2pl_all.pl

###### end of [Makefile] ######
