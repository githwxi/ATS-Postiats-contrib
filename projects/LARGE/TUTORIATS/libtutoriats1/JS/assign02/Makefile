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
assign02_patsopt_services_dats.js
#
######
#
assign02_patsopt_services_dats.c: \
  assign02_patsopt_services.dats; $(PATSOPT) -o $@ -d $<
assign02_patsopt_services_dats.js: \
  assign02_patsopt_services_dats.c; $(ATSCC2JS) -o $@ -i $<
#
######
#
clean:: ; rm -f *~
clean:: ; rm -f assign02_patsopt_services_dats.c
#
cleanall:: clean
cleanall:: ; rm -f assign02_patsopt_services_dats.js
#
######

###### end of [Makefile] ######
