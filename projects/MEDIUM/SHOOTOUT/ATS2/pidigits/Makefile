######
#
# for SHOOTOUT/pidigits
#
######

GCC=gcc

######

PATSCC=$(PATSHOME)/bin/patscc

######
#
export PATSCCOMP=\
$(GCC) -std=c99 -D_XOPEN_SOURCE \
  -I${PATSHOME} -I${PATSHOME}/ccomp/runtime -L${PATSHOME}/ccomp/atslib/lib
#
######

all:: pidigits
all:: pidigits_gcc

######

pidigits: pidigits.dats ; \
$(PATSCC) -verbose -I${PATSHOMERELOC}/contrib \
  -pipe -O3 -fomit-frame-pointer -march=native $< -o $@ -lgmp

######

pidigits_gcc: pidigits_gcc.c ; \
$(GCC) -pipe -Wall -O3 -fomit-frame-pointer -march=native $< -o $@ -lgmp

######

testall:: all
testall:: cleanall

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
