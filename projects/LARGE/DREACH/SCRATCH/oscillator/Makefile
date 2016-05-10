#
# A simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

ATSCC2JS=$(PATSHOME)/bin/atscc2js

######

all:: oscillator_2d_anim_dats.js

######
#
# oscillator_2d_anim: \
#   oscillator_2d_anim.dats ; \
#   $(PATSCC) -DATS_MEMALLOC_LIBC -o $@ oscillator_2d_anim.dats -lm
#
oscillator_2d_anim_dats.js: \
  oscillator_2d_anim.dats ; \
  $(PATSCC) --constraint-ignore -ccats $<; $(ATSCC2JS) -o $@ -i oscillator_2d_anim_dats.c
#
######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.c
clean:: ; rm -f *_?ats.o

cleanall:: clean
cleanall:: ; rm -f oscillator_2d_anim_dats.js

###### end of [Makefile] ######
