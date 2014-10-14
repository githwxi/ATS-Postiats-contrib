#
# For generating libatscc2js
#

######

PATSOPT=$(PATSHOME)/bin/patsopt
ATSCC2JS=$(PATSHOME)/bin/atscc2js

######

CAT=cat
CPF=cp -f
RMF=rm -f

######
#
all:: ; \
$(PATSOPT) -d ./DATS/list.dats | $(ATSCC2JS) -o ./output/DATS/list_dats.js -i
all:: ; \
$(PATSOPT) -d ./DATS/intrange.dats | $(ATSCC2JS) -o ./output/DATS/intrange_dats.js -i
#
all:: ; \
$(PATSOPT) -d ./DATS/arrayref.dats | $(ATSCC2JS) -o ./output/DATS/arrayref_dats.js -i
all:: ; \
$(PATSOPT) -d ./DATS/reference.dats | $(ATSCC2JS) -o ./output/DATS/reference_dats.js -i
#
#######

all_in_one:: ; \
$(CAT) >libatscc2js_all.js \
CATS/basics_cats.js \
CATS/integer_cats.js \
CATS/float_cats.js \
CATS/string_cats.js \
CATS/JSmath_cats.js \
CATS/JSdate_cats.js \
CATS/JSarray_cats.js \
CATS/JSglobal_cats.js \
CATS/Ajax/Ajax_cats.js \
CATS/HTML/canvas-2d/canvas2d_cats.js \
output/DATS/list_dats.js \
output/DATS/intrange_dats.js \
output/DATS/reference_dats.js \

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

clean:: ; $(RMF) *~ */*~

#######

cleanall:: clean
cleanall:: ; $(RMF) libatscc2js_all.js

#######

###### end of [Makefile] ######
