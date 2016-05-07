#
# A simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

ATSCC2JS=$(PATSHOME)/bin/atscc2js

######

bouncing_ball_anim_dats.js: bouncing_ball_anim.dats ; \
$(PATSCC) -ccats $<; $(ATSCC2JS) -o $@ -i bouncing_ball_anim_dats.c

######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.c
clean:: ; rm -f *_?ats.o

cleanall:: clean
cleanall:: ; rm -f bouncing_ball_anim_dats.js

###### end of [Makefile] ######
