######
#
# For a SHOOTOUT/benchmark
#
######

all:: k-nucleotide

######

k-nucleotide: k-nucleotide.dats; patscc -DATS_MEMALLOC_GCBDW -O3 -o $@ $< -lm -lgc

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_dats.c

cleanall:: clean
cleanall:: ; $(RMF) k-nucleotide

###### end of [Makefile] ######
