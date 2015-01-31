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

all:: fasta-redux
all:: fasta-redux_gcc3

######

fasta-redux: \
fasta-redux.dats ; \
$(PATSCC) -verbose -D_GNU_SOURCE \
  -pipe -O3 -fomit-frame-pointer -march=native -std=c99 -mfpmath=sse -msse3 $< -o $@

######

fasta-redux_gcc3: fasta-redux_gcc3.c ; \
$(GCC) -pipe -Wall -O3 -fomit-frame-pointer -march=native -std=c99 -mfpmath=sse -msse3 $< -o $@

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
cleanall:: ; $(RMF) fasta-redux
cleanall:: ; $(RMF) fasta-redux_gcc3

###### end of [Makefile] ######
