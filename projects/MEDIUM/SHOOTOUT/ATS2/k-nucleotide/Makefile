######
#
# for SHOOTOUT/spectral-norm
#
######

GCC=gcc
GPP=g++

######

PATSCC=$(PATSHOME)/bin/patscc

######

all:: k-nucleotide
all:: k-nucleotide_mt
all:: k-nucleotide_gpp3

######

k-nucleotide: \
k-nucleotide.dats ; \
$(PATSCC) -DATS_MEMALLOC_LIBC \
  -pipe -O3 -fomit-frame-pointer -march=native -std=c99 $< -o $@

######

k-nucleotide_mt: \
k-nucleotide_mt.dats ; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC \
  -pipe -O3 -fomit-frame-pointer -march=native -std=c99 $< -o $@ -lpthread

######

k-nucleotide_gpp3: \
k-nucleotide_gpp3.o ; \
$(GPP) $< -o $@ -Wl,--no-as-needed -lpthread 
k-nucleotide_gpp3.o: \
k-nucleotide_gpp3.c++ ; \
$(GPP) -c -pipe -O3 -fomit-frame-pointer -march=native -std=c++0x $< -o $@

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_dats.o
clean:: ; $(RMF) *_dats.c

######

cleanall:: clean
cleanall:: ; $(RMF) k-nucleotide
cleanall:: ; $(RMF) k-nucleotide_mt
cleanall:: ; $(RMF) k-nucleotide_gpp3
cleanall:: ; $(RMF) k-nucleotide_gpp3.o

###### end of [Makefile] ######
