#
# For generating libatscc2js
#

######

PATSOPT=$(PATSHOME)/bin/patsopt
ATSCC2JS=$(PATSHOME)/bin/atscc2js

######

CPF=cp -f

######

all:: ; \
$(PATSOPT) -d ./DATS/list.dats | $(ATSCC2JS) -o ./output/DATS/list_dats.js -i

#######

###### end of [Makefile] ######
