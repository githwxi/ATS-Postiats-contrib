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
mygame_dats.js
#
mygame_dats.c: \
mygame.sats mygame.dats; $(PATSCC) -ccats mygame.dats
mygame_dats.js: mygame_dats.c; $(ATSCC2JS) -o $@ -i $<
#
######
#
all:: \
mygame_bullet_dats.js
#
mygame_bullet_dats.c: \
mygame.sats mygame_bullet.dats; $(PATSCC) -ccats mygame_bullet.dats
mygame_bullet_dats.js: mygame_bullet_dats.c; $(ATSCC2JS) -o $@ -i $<
#
######
#
all:: \
mygame_enemy_dats.js
#
mygame_enemy_dats.c: \
mygame.sats mygame_enemy.dats; $(PATSCC) -ccats mygame_enemy.dats
mygame_enemy_dats.js: mygame_enemy_dats.c; $(ATSCC2JS) -o $@ -i $<
#
######
#
all:: \
mygame_player_dats.js
#
mygame_player_dats.c: \
mygame.sats mygame_player.dats; $(PATSCC) -ccats mygame_player.dats
mygame_player_dats.js: mygame_player_dats.c; $(ATSCC2JS) -o $@ -i $<
#
######
#
all:: \
mygame_keyboard_dats.js
#
mygame_keyboard_dats.c: \
mygame.sats mygame_keyboard.dats; $(PATSCC) -ccats mygame_keyboard.dats
mygame_keyboard_dats.js: mygame_keyboard_dats.c; $(ATSCC2JS) -o $@ -i $<
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
