#
# A simple Makefile
#
######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

all:: DATS_C

######
#
testall:: all
testall:: cleanall
#
######

RMF=rm -f

######

clean:: ; $(RMF) *~

######

cleanall:: clean

######

cleanall:: ; $(RMF) ./CATS/patsunj2_mylib_dats.c
cleanall:: ; $(RMF) ./CATS/patsunj2_include_all_dats.c

###### end of [Makefile] ######
