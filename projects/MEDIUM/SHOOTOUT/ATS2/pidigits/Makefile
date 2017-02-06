######
#
# for SHOOTOUT/pidigits
#
######

GCC=gcc

######
#
PATSCC=$(PATSHOME)/bin/patscc
#
PATSLIB=$(PATSHOME)/ccomp/atslib/lib
#
######
#
export \
PATSCCOMP=\
$(GCC) -std=c99 -D_XOPEN_SOURCE \
-I${PATSHOME} -I${PATSHOME}/ccomp/runtime -L$(PATSLIB)
#
######

all:: pidigits
all:: pidigits_gcc

######

pidigits: \
pidigits.dats ; \
$(PATSCC) -verbose \
  -I${PATSHOME}/contrib \
  -pipe -O3 -fomit-frame-pointer -march=native $< -o $@ -lgmp

######

pidigits_gcc: \
pidigits_gcc.c ; \
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
