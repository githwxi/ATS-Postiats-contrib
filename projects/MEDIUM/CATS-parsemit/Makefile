#
# A simple Makefile
#
######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

all:: DATS_C

######

DATS_C:: \
catsparse_all.dats; \
$(PATSOPT) -o ./CATS/catsparse_all_dats.c --dynamic $<
DATS_C:: \
catsparse_mylib.dats; \
$(PATSOPT) -o ./CATS/catsparse_mylib_dats.c --dynamic $<

######
#
testall:: all
testall:: cleanall
#
######

RMF=rm -f

######

cleanall:: ; $(RMF) ./CATS/catsparse_all_dats.c
cleanall:: ; $(RMF) ./CATS/catsparse_mylib_dats.c

###### end of [Makefile] ######
