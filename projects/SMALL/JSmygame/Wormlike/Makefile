######
#
# A simple Makefile
#
######

PATSCC=$(PATSHOME)/bin/patscc
ATSCC2JS=$(PATSHOME)/bin/atscc2js

######
#
all:: \
Wormlike_main_dats.js
#
Wormlike_main_dats.c: \
Wormlike.sats Wormlike_main.dats; \
$(PATSCC) -ccats Wormlike_main.dats
Wormlike_main_dats.js: Wormlike_main_dats.c; $(ATSCC2JS) -o $@ -i $<
#
######
#
all:: \
Wormlike_worm_dats.js
#
Wormlike_worm_dats.c: \
Wormlike.sats Wormlike_worm.dats; \
$(PATSCC) -ccats Wormlike_worm.dats
Wormlike_worm_dats.js: Wormlike_worm_dats.c; $(ATSCC2JS) -o $@ -i $<
#
######
#
all:: \
Wormlike_setup_dats.js
#
Wormlike_setup_dats.c: \
Wormlike.sats Wormlike_setup.dats; \
$(PATSCC) -ccats Wormlike_setup.dats
Wormlike_setup_dats.js: Wormlike_setup_dats.c; $(ATSCC2JS) -o $@ -i $<
#
######
#
# all:: \
# Wormlike_keyboard_dats.js
#
Wormlike_keyboard_dats.c: \
Wormlike.sats Wormlike_keyboard.dats; \
$(PATSCC) -ccats Wormlike_keyboard.dats
Wormlike_keyboard_dats.js: Wormlike_keyboard_dats.c; $(ATSCC2JS) -o $@ -i $<
#
######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_dats.c

######

cleanall:: clean
cleanall:: ; $(RMF) *_dats.js

###### end of [Makefile] ######
