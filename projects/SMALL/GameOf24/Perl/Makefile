######
#
# A simple Makefile
#
######

RMF=rm -f
RMRF=rm -rf
CPRF=cp -rf

######

PERL=perl
export PERLPATH=libatscc2pl/.

######

PATSCC=${PATSHOME}/bin/patscc
ATSCC2PL=${PATSHOME}/bin/atscc2pl

######

LIBATSCC2PL=\
$(PATSHOME)/contrib/libatscc2pl/ATS2-0.3.2

######
#
all:: \
GameOf24_pl_dats.pl; 
#
GameOf24_pl_dats.c: \
  GameOf24_pl.dats; ${PATSCC} -ccats $<
GameOf24_pl_dats.pl: \
  GameOf24_pl_dats.c; ${ATSCC2PL} -o $@ -i $<
#
######
#
regress:: \
GameOf24_pl_dats.pl; $(PERL) $<
#
cleanall:: ; $(RMF) GameOf24_pl_dats.pl
#
######

testall:: all
testall:: libatscc2pl
testall:: regress
testall:: cleanall

######
#
libatscc2pl:: ; $(CPRF) \
  $(LIBATSCC2PL)/output/libatscc2pl_all.pl libatscc2pl/.
#
######

clean:: ; $(RMF) *~
clean:: ; $(RMF) GameOf24_pl_dats.c

######

cleanall:: clean
cleanall:: ; $(RMF) libatscc2pl/libatscc2pl_all.pl

###### end of [Makefile] ######
