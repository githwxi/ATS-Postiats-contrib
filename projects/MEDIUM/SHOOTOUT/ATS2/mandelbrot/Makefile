######
#
# Makefile a CLBG benchmark
#
######

GCC=gcc

######

PATSCC=$(PATSHOME)/bin/patscc

######

all:: mandelbrot

######

mandelbrot: \
mandelbrot.dats ; \
$(PATSCC) -pipe -O3 -fomit-frame-pointer -march=native -std=c99 -D_GNU_SOURCE -mfpmath=sse -msse2 -fopenmp $< -o $@

######

mandelbrot_v2df: \
mandelbrot_v2df.dats ; \
$(PATSCC) -I$(PATSHOMERELOC)/contrib/libats-/hwxi -pipe -O3 -fomit-frame-pointer -march=native -std=c99 -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -mfpmath=sse -msse2 -fopenmp $< -o $@

######

mandelbrot_v2df_smp: \
mandelbrot_v2df_smp.dats ; \
$(PATSCC) -I$(PATSHOMERELOC)/contrib/libats-/hwxi -pipe -O3 -fomit-frame-pointer -march=native -std=c99 -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -mfpmath=sse -msse2 -fopenmp $< -o $@ -lpthread

######

mandelbrot.gcc-4.gcc_run: mandelbrot.gcc-4.c ; \
$(GCC) -pipe -Wall -O3 -fomit-frame-pointer -march=native -std=c99 -D_GNU_SOURCE -mfpmath=sse -msse2 -fopenmp mandelbrot.gcc-4.c -o $@

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
cleanall:: ; $(RMF) mandelbrot.gcc-4.gcc_run

###### end of [Makefile] ######
