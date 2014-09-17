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
all:: ; \
$(PATSOPT) -d ./DATS/intrange.dats | $(ATSCC2JS) -o ./output/DATS/intrange_dats.js -i
all:: ; \
$(PATSOPT) -d ./DATS/reference.dats | $(ATSCC2JS) -o ./output/DATS/reference_dats.js -i

#######
#
upload_source:: ; \
scp -r basics_js.sats staloadall.hats CATS SATS DATS \
  ats-hwxi,ats-lang@web.sourceforge.net:htdocs/LIBRARY/contrib/libatscc2js/.
#
upload_DATS_JS:: ; \
scp output/DATS/*_dats.js \
  ats-hwxi,ats-lang@web.sourceforge.net:htdocs/LIBRARY/contrib/libatscc2js/DATS/.
#
#######

###### end of [Makefile] ######
