#
# A simple Makefile
#
######

PATSCC=${PATSHOME}/bin/patscc
PATSOPT=${PATSHOME}/bin/patsopt
ATSCC2PL=${PATSHOME}/bin/atscc2pl

######

test01_dats.c: test01.dats; $(PATSOPT) -o $@ -d $<
test01_dats.pl: test01_dats.c; $(ATSCC2PL) -o $@ -i $<

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