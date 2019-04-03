#
# A simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

ATSCC2JS=$(PATSHOME)/bin/atscc2js

######

all:: \
bouncing_ball_anim_dats.js
bouncing_ball_anim_dats.js: \
  bouncing_ball_anim.dats ; \
  $(PATSCC) --constraint-ignore -ccats $<; $(ATSCC2JS) -o $@ -i bouncing_ball_anim_dats.c

######

all:: \
bouncing_ball_drag_anim_dats.js
bouncing_ball_drag_anim_dats.js: \
  bouncing_ball_drag_anim.dats ; \
  $(PATSCC) --constraint-ignore -ccats $<; $(ATSCC2JS) -o $@ -i bouncing_ball_drag_anim_dats.c

######
#
all:: \
bouncing_ball2_anim_dats.js
bouncing_ball2_anim_dats.js: \
  bouncing_ball2_anim.dats ; \
  $(PATSCC) --constraint-ignore -ccats $<; $(ATSCC2JS) -o $@ -i bouncing_ball2_anim_dats.c
#
######
#
all:: \
bouncing_ball2_drag_anim_dats.js
bouncing_ball2_drag_anim_dats.js: \
  bouncing_ball2_drag_anim.dats ; \
  $(PATSCC) --constraint-ignore -ccats $<; $(ATSCC2JS) -o $@ -i bouncing_ball2_drag_anim_dats.c
#
######
#
all_tc:: ; $(PATSOPT) -tc --constraint-export -d bouncing_ball.dats | patsolve_z3 -i  
all_tc:: ; $(PATSOPT) -tc --constraint-export -d bouncing_ball_anim.dats | patsolve_z3 -i  
#
all_tc:: ; $(PATSOPT) -tc --constraint-export -d bouncing_ball_drag.dats | patsolve_z3 -i  
all_tc:: ; $(PATSOPT) -tc --constraint-export -d bouncing_ball_drag_anim.dats | patsolve_z3 -i  
#
all_tc:: ; $(PATSOPT) -tc --constraint-export -d bouncing_ball2.dats | patsolve_z3 -i  
all_tc:: ; $(PATSOPT) -tc --constraint-export -d bouncing_ball2_anim.dats | patsolve_z3 -i  
#
all_tc:: ; $(PATSOPT) -tc --constraint-export -d bouncing_ball2_drag.dats | patsolve_z3 -i  
all_tc:: ; $(PATSOPT) -tc --constraint-export -d bouncing_ball2_drag_anim.dats | patsolve_z3 -i  
#
all_tc:: ; $(PATSOPT) -tc --constraint-export -d bouncing_ball3.dats | patsolve_z3 -i  
#
######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.c
clean:: ; rm -f *_?ats.o

######

cleanall:: clean
cleanall:: ; rm -f bouncing_ball_anim_dats.js
cleanall:: ; rm -f bouncing_ball_drag_anim_dats.js
cleanall:: ; rm -f bouncing_ball2_anim_dats.js
cleanall:: ; rm -f bouncing_ball2_drag_anim_dats.js

###### end of [Makefile] ######
