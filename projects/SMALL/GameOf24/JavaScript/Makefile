#
# A simple Makefile
#

######

NODEJS=node

######

PATSCC=${PATSHOME}/bin/patscc
ATSCC2JS=${PATSHOME}/bin/atscc2js

######

all: GameOf24_js_dats.js; $(NODEJS) $<

######

GameOf24_js_dats.c: GameOf24_js.dats; ${PATSCC} -ccats $<
GameOf24_js_dats.js: GameOf24_js_dats.c; ${ATSCC2JS} -o $@ -i $<

######

RMF=rm -f
RMRF=rm -rf

######

CPRF=cp -rf

######
#
libatscc2js:: ; \
$(CPRF) $(PATSHOME_contrib)/contrib/libatscc2js/CATS/* libatscc2js/CATS/.
libatscc2js:: ; \
$(CPRF) $(PATSHOME_contrib)/contrib/libatscc2js/output/DATS/* libatscc2js/DATS/.
#
######

clean:: ; $(RMF) GameOf24_js_dats.c

######

cleanall:: clean
cleanall:: ; $(RMF) GameOf24_js_dats.js
cleanall:: ; $(RMF) libatscc2js/*_cats.js
cleanall:: ; $(RMF) libatscc2js/*_dats.js

###### end of [Makefile] ######
