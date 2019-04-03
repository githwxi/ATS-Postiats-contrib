######
#
# A simple Makefile
#
######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######
#
LDPATH :=
LIBRARY = -lgmp -lgc
#
######
#
ATEXTING_MYLIB=\
$(PATSHOME)/utils/atexting/atexting_mylib.dats
#
######

all:: mytexting

######
#
mytexting: \
mytexting.dats ; \
$(PATSCC) -O2 -o bin/$@ -DATS_MEMALLOC_GCBDW \
  mytexting.dats $(ATEXTING_MYLIB) $(LDPATH) $(LIBRARY)
#
######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_dats.c

######

cleanall:: clean
cleanall:: ; $(RMF) bin/mytexting

###### end of [Makefile] ######
