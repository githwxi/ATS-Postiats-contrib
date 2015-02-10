######
#
# for SHOOTOUT/spectral-norm
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

all:: spectral-norm
all:: spectral-norm_smp
all:: spectral-norm_gcc5

######

spectral-norm: \
spectral-norm.dats ; \
$(PATSCC) -verbose -DATS_MEMALLOC_LIBC \
  -pipe -O3 -fomit-frame-pointer -march=native -mfpmath=sse -msse2 $< -o $@ -lm

######

spectral-norm_smp: \
spectral-norm_smp.dats ; \
$(PATSCC) -verbose -D_GNU_SOURCE -DATS_MEMALLOC_LIBC \
  -pipe -O3 -fomit-frame-pointer -march=native -mfpmath=sse -msse2 $< -o $@ -lm -lpthread

######

spectral-norm_gcc5: spectral-norm_gcc5.c ; \
$(GCC) -pipe -Wall -O3 -fomit-frame-pointer -march=native -fopenmp -mfpmath=sse -msse2 $< -o $@ -lm

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
cleanall:: ; $(RMF) spectral-norm
cleanall:: ; $(RMF) spectral-norm_smp
cleanall:: ; $(RMF) spectral-norm_gcc5

###### end of [Makefile] ######
