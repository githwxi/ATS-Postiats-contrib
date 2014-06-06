######
#
# for SHOOTOUT/spectral-norm
#
######

GCC=gcc

######

PATSCC=$(PATSHOME)/bin/patscc

######

all:: spectral-norm
all:: spectral-norm_gcc5

######

spectral-norm: \
spectral-norm.dats ; \
$(PATSCC) -DATS_MEMALLOC_LIBC \
  -pipe -O3 -fomit-frame-pointer -march=natived -mfpmath=sse -msse2 $< -o $@ -lm

######

spectral-norm_smp: \
spectral-norm_smp.dats ; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC \
  -pipe -O3 -fomit-frame-pointer -march=native -mfpmath=sse -msse2 $< -o $@ -lm -lpthread

######

spectral-norm_gcc5: spectral-norm_gcc5.c ; \
$(GCC) -pipe -Wall -O3 -fomit-frame-pointer -march=native -fopenmp -mfpmath=sse -msse2 $< -o $@ -lm

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
