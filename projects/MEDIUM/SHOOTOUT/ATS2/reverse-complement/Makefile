######
#
# for SHOOTOUT/fasta-redux
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

all:: revcomp
all:: revcomp_mt
all:: revcomp_gcc2

######

revcomp: revcomp.dats ; \
$(PATSCC) -verbose -D_GNU_SOURCE \
  -pipe -O3 -fomit-frame-pointer -march=native -std=c99 $< -o $@

######

revcomp_mt: revcomp_mt.dats ; \
$(PATSCC) -verbose -D_GNU_SOURCE -DATS_MEMALLOC_LIBC \
  -pipe -O3 -fomit-frame-pointer -march=native -std=c99 $< -o $@ -lpthread

######

revcomp_gcc2: revcomp_gcc2.c ; \
$(GCC) -pipe -Wall -O3 -fomit-frame-pointer -march=native -pthread -std=c99 $< -o $@

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
cleanall:: ; $(RMF) revcomp
cleanall:: ; $(RMF) revcomp_mt
cleanall:: ; $(RMF) revcomp_gcc2

###### end of [Makefile] ######
