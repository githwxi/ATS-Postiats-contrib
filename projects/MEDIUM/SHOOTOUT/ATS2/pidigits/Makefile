######
#
# for SHOOTOUT/pidigits
#
######

GCC=gcc

######

PATSCC=$(PATSHOME)/bin/patscc

######

all:: pidigits_gcc

######

pidigits: pidigits.dats ; \
$(PATSCC) -I${PATSHOMERELOC}/contrib \
  -pipe -O3 -fomit-frame-pointer -march=native $< -o $@ -lgmp

######

pidigits_gcc: pidigits_gcc.c ; \
$(GCC) -pipe -Wall -O3 -fomit-frame-pointer -march=native $< -o $@ -lgmp

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_dats.c

######

cleanall:: clean
cleanall:: ; $(RMF) pidigits
cleanall:: ; $(RMF) pidigits_gcc

###### end of [Makefile] ######
