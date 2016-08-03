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
patsopt_services_dats.js
#
######
#
patsopt_services_dats.c: \
  patsopt_services.dats; $(PATSOPT) -o $@ -d $<
patsopt_services_dats.js: \
  patsopt_services_dats.c; $(ATSCC2JS) -o $@ -i $<
#
######
#
clean:: ; rm -f *~
clean:: ; rm -f patsopt_services_dats.c
#
cleanall:: clean
cleanall:: ; rm -f patsopt_services_dats.js
#
######

###### end of [Makefile] ######
