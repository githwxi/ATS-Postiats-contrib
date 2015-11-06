#
# A simple Makefile
#
######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
ATSCC2JS=$(PATSHOME)/bin/atscc2js

######
#
all:: \
inputform_dats.js
#
######

inputform_dats.c: \
inputform.dats; $(PATSOPT) -o $@ -d $<
inputform_dats.js: \
inputform_dats.c; $(ATSCC2JS) -o $@ -i $<

######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.o
clean:: ; rm -f *_?ats.c

######

cleanall:: clean
cleanall:: ; rm -f inputform_dats.js

###### end of [Makefile] ######
