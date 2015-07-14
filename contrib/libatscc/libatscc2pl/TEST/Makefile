#
# A simple Makefile
#
######

PERL=perl

######

PATSCC=${PATSHOME}/bin/patscc
PATSOPT=${PATSHOME}/bin/patsopt
ATSCC2PL=${PATSHOME}/bin/atscc2pl

######

all:: test01
test01: \
test01_dats.pl; $(PERL) $<
test01_dats.c: test01.dats; $(PATSOPT) -o $@ -d $<
test01_dats.pl: test01_dats.c; $(ATSCC2PL) -o $@ -i $<

######

all:: test02
test02: \
test02_dats.pl; $(PERL) $<
test02_dats.c: test02.dats; $(PATSOPT) -o $@ -d $<
test02_dats.pl: test02_dats.c; $(ATSCC2PL) -o $@ -i $<

######

all:: test03
test03: \
test03_dats.pl; $(PERL) $<
test03_dats.c: test03.dats; $(PATSOPT) -o $@ -d $<
test03_dats.pl: test03_dats.c; $(ATSCC2PL) -o $@ -i $<

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c

######

cleanall:: clean
cleanall:: ; $(RMF) *_?ats.pl

######

###### end of [Makefile] ######