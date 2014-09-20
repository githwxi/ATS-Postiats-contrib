#
# A simple Makefile
#
######

PATSCC=${PATSHOME}/bin/patscc
PATSOPT=${PATSHOME}/bin/patsopt
ATSCC2JS=${PATSHOME}/bin/atscc2js

######

test01_dats.c: test01.dats; $(PATSOPT) -o $@ -d $<
test01_dats.js: test01_dats.c; $(ATSCC2JS) -o $@ -i $<

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c

######

cleanall:: clean
cleanall:: ; $(RMF) *_?ats.js

######

###### end of [Makefile] ######