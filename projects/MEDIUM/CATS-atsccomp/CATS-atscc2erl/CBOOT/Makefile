#
# A simple Makefile
#

######

MAKE=make

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

all::

######

CATSPARSEMIT=./../.CATS-parsemit

######

SOURCES_DATS :=
SOURCES_DATS += atscc2erl_main.dats
SOURCES_DATS += atscc2erl_emit.dats
SOURCES_DATS += atscc2erl_emit2.dats

SOURCES_CATS :=
SOURCES_CATS += catsparse_sats.c
SOURCES_CATS += $(CATSPARSEMIT)/catsparse_mylib_dats.c
SOURCES_CATS += $(CATSPARSEMIT)/catsparse_include_all_dats.c

######

SOURCES_DATS_C := $(patsubst %.dats, %_dats.c, $(SOURCES_DATS))

######
#
all:: \
atscc2erl
atscc2erl: ; \
$(PATSCC) -O2 -o $@ \
  $(SOURCES_DATS_C) $(SOURCES_CATS) -DATS_MEMALLOC_GCBDW -lgc
#
######

CPF=cp -f
RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.o

######

cleanall:: clean
cleanall:: ; $(RMF) ./atscc2erl

###### end of [Makefile] ######
