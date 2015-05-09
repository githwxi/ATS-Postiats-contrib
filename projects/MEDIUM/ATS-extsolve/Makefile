#
# A simple Makefile
#

######

include \
$(PATSHOME)/share/atsmake-pre.mk

######

MALLOCFLAG := -DATS_MEMALLOC_LIBC

######

CFLAGS += -g -O2 -I ./parsing

######

LDFLAGS += -L$(PATSHOMEQ)/ccomp/atslib/lib
LDFLAGS += -latslib

######

SOURCES_SATS += \
  patsolve.sats

SOURCES_DATS += \
  main.dats \
  commarg.dats

######

MYTARGET=MYTARGET

######

include $(PATSHOME)/share/atsmake-post.mk

######

OBJECTS :=
OBJECTS += $(MYTARGET_SATS_O)
OBJECTS += $(MYTARGET_DATS_O)

#
DATSMEMALLOC=-DATS_MEMALLOC_LIBC
#
######

PATSOLVE_OBJECTS :=
PATSOLVE_OBJECTS += $(MYTARGET_DATS_O)
PATSOLVE_OBJECTS += constraint/constraint.o
PATSOLVE_OBJECTS += parsing/parsing.o
PATSOLVE_OBJECTS += solving/solving.o

######

all:: setup patsolve deploy
cleanall:: ; $(RMF) patsolve 

.phony: setup

setup::
	make -C constraint
	make -C parsing
	make -C solving

######

# Load any extra options we need to make Z3 work
include solving/Z3/atsmake-z3.mk

######

patsolve: $(PATSOLVE_OBJECTS)
	$(PATSCC) -o $@ $^ $(LDFLAGS)

deploy: patsolve
	cp patsolve $(PATSHOME)/bin/
	
######

cleanall:: ; make -C parsing cleanall
cleanall:: ; make -C solving cleanall
cleanall:: ; make -C solving/Z3 cleanall

###### end of [Makefile] ######
