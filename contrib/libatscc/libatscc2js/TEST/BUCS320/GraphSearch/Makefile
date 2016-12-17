#
# A simple Makefile
#
######

PATSCC=${PATSHOME}/bin/patscc
PATSOPT=${PATSHOME}/bin/patsopt
ATSCC2JS=${PATSHOME}/bin/atscc2js

######

NODEJS=nodejs

######

all::

######

all:: \
QueenPuzzle_dats.js
QueenPuzzle_dats.c: \
QueenPuzzle.dats; $(PATSOPT) -o $@ -d $<
QueenPuzzle_dats.js: \
QueenPuzzle_dats.c; $(ATSCC2JS) -o $@ -i $<
#
regress:: QueenPuzzle_dats.js; $(NODEJS) $<
#
######

testall:: all
testall:: regress
testall:: cleanall

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
