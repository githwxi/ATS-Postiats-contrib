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
#
all:: \
GameOf24_pl_dats.pl; 
GameOf24_pl_dats.c: GameOf24_pl.dats; ${PATSCC} -ccats $<
GameOf24_pl_dats.pl: GameOf24_pl_dats.c; ${ATSCC2PL} -o $@ -i $<
#
######
#
regress:: \
GameOf24_pl_dats.pl; $(PERL) $<
cleanall:: ; $(RMF) GameOf24_pl_dats.pl
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
#
libatscc2pl:: ; \
$(CPRF) $(PATSHOME)/contrib/libatscc2pl/ATS2-0.3.2/output/libatscc2pl_all.pl libatscc2pl/.
#
######

clean:: ; $(RMF) *~
clean:: ; $(RMF) GameOf24_pl_dats.c

######

cleanall:: clean
cleanall:: ; $(RMF) libatscc2pl/libatscc2pl_all.pl

###### end of [Makefile] ######
