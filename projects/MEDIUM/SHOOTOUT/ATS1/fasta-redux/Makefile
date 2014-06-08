######
#
# For a SHOOTOUT/benchmark
#
######

all:: fasta-redux

######

fasta-redux: \
fasta-redux.dats ; \
  patscc -D_BSD_SOURCE -O3 -msse2 -mfpmath=sse -o $@ $<

######

RMF=rm -f

######

.phony: clean

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_dats.c

cleanall:: clean
cleanall:: ; $(RMF) fasta-redux

###### end of [Makefile] ######
