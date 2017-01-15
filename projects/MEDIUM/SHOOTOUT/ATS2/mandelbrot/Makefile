######
#
# for SHOOTOUT/mandelbrot
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

all:: mandelbrot
mandelbrot: \
mandelbrot.dats ; \
$(PATSCC) -verbose -D_GNU_SOURCE \
  -pipe -O3 -fomit-frame-pointer -march=native -std=c99 -mfpmath=sse -msse2 $< -o $@

######

ifeq ($(GCC),gcc)
all:: \
mandelbrot_v2df
mandelbrot_v2df: \
mandelbrot_v2df.dats ; \
$(PATSCC) -verbose -D_GNU_SOURCE \
  -DATS_MEMALLOC_LIBC -I$(PATSCONTRIB)/contrib/libats-/hwxi \
  -pipe -O3 -fomit-frame-pointer -march=native -std=c99 -mfpmath=sse -msse2 $< -o $@
endif #end-of-ifeq

######

ifeq ($(GCC),gcc)
all:: \
mandelbrot_v2df_smp
mandelbrot_v2df_smp: \
mandelbrot_v2df_smp.dats ; \
$(PATSCC) -verbose -D_GNU_SOURCE \
  -DATS_MEMALLOC_LIBC -I$(PATSCONTRIB)/contrib/libats-/hwxi \
  -pipe -O3 -fomit-frame-pointer -march=native -std=c99 -mfpmath=sse -msse2 $< -o $@ -lpthread
endif #end-of-ifeq

######

ifeq ($(GCC),gcc)
all:: \
mandelbrot_gcc4
mandelbrot_gcc4: mandelbrot_gcc4.c ; \
$(GCC) -pipe -Wall -O3 -fomit-frame-pointer -march=native -std=c99 -D_GNU_SOURCE -mfpmath=sse -msse2 -fopenmp $< -o $@
endif #end-of-ifeq

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
cleanall:: ; $(RMF) mandelbrot
cleanall:: ; $(RMF) mandelbrot_v2df
cleanall:: ; $(RMF) mandelbrot_v2df_smp
cleanall:: ; $(RMF) mandelbrot_gcc4

###### end of [Makefile] ######
