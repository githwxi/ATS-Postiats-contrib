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
tetris_dats.js
#
tetris_dats.c: \
tetris.dats; $(PATSCC) -ccats tetris.dats
tetris_dats.js: tetris_dats.c; $(ATSCC2JS) -o $@ -i $<
#
######
#
all:: \
tetris_block_dats.js
#
tetris_block_dats.c: \
tetris_block.dats; $(PATSCC) -ccats tetris_block.dats
tetris_block_dats.js: tetris_block_dats.c; $(ATSCC2JS) -o $@ -i $<
#
######
#
all:: \
tetris_piece_dats.js
#
tetris_piece_dats.c: \
tetris_piece.dats; $(PATSCC) -ccats tetris_piece.dats
tetris_piece_dats.js: tetris_piece_dats.c; $(ATSCC2JS) -o $@ -i $<
#
######
#
all:: \
tetris_keyboard_dats.js
#
tetris_keyboard_dats.c: \
tetris_keyboard.dats; $(PATSCC) -ccats tetris_keyboard.dats
tetris_keyboard_dats.js: tetris_keyboard_dats.c; $(ATSCC2JS) -o $@ -i $<
#
######
#
all:: \
tetris_autoplay_dats.js
#
tetris_autoplay_dats.c: \
tetris_autoplay.dats; $(PATSCC) -ccats tetris_autoplay.dats
tetris_autoplay_dats.js: tetris_autoplay_dats.c; $(ATSCC2JS) -o $@ -i $<
#
######
#
all:: \
tetris_gameboard_dats.js
#
tetris_gameboard_dats.c: \
tetris_gameboard.dats; $(PATSCC) -ccats tetris_gameboard.dats
tetris_gameboard_dats.js: tetris_gameboard_dats.c; $(ATSCC2JS) -o $@ -i $<
#
######
#
# Dependency
#
tetris_dats.c: tetris.sats
tetris_block_dats.c: tetris.sats
tetris_piece_dats.c: tetris.sats
tetris_keyboard_dats.c: tetris.sats
tetris_autoplay_dats.c: tetris.sats
tetris_gameboard_dats.c: tetris.sats
#
######
#
#upload_demo:
#scp * ats-hwxi,ats-lang@web.sourceforge.net:htdocs/COMPILED/doc/PROJECT/SMALL/JSmygame/Tetris/.
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
