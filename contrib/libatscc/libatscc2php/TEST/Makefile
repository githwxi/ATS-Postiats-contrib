#
# A simple Makefile
#
######

PATSCC=${PATSHOME}/bin/patscc
PATSOPT=${PATSHOME}/bin/patsopt
ATSCC2PHP=${PATSHOME}/bin/atscc2php

######

test01_dats.c: test01.dats; $(PATSOPT) -o $@ -d $<
test01_dats.php: test01_dats.c; $(ATSCC2PHP) -o $@ -i $<

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c

######

cleanall:: clean
cleanall:: ; $(RMF) *_?ats.php

######

###### end of [Makefile] ######