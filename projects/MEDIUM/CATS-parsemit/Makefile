#
# A simple Makefile
#
######

PATSOPT=$(PATSHOME)/bin/patsopt

######

all:: \
catsparse_mylib.dats; \
$(PATSOPT) -o ./CATS/catsparse_mylib_dats.c --dynamic $<

######

all:: \
catsparse_include_all.dats; \
$(PATSOPT) -o ./CATS/catsparse_include_all_dats.c --dynamic $<

######
#
testall:: \
catsparse_mylib.dats; \
$(PATSOPT) -o ./CATS/catsparse_mylib_dats.c --dynamic $<
testall:: \
catsparse_include_all.dats; \
$(PATSOPT) -o ./CATS/catsparse_include_all_dats.c --dynamic $<
#
######

RMF=rm -f

######

cleanall:: ; $(RMF) ./CATS/catsparse_mylib_dats.c
cleanall:: ; $(RMF) ./CATS/catsparse_include_all_dats.c

###### end of [Makefile] ######
