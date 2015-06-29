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

CATSPARSEMIT=./.CATS-parsemit

######

SOURCES_DATS :=
SOURCES_DATS += atscc2erl_main.dats
SOURCES_DATS += atscc2erl_emit.dats
SOURCES_DATS += atscc2erl_emit2.dats

SOURCES_SATS :=
SOURCES_SATS += $(CATSPARSEMIT)/catsparse.sats

SOURCES_CATS :=
SOURCES_CATS += $(CATSPARSEMIT)/catsparse_mylib_dats.c
SOURCES_CATS += $(CATSPARSEMIT)/catsparse_include_all_dats.c

######
#
all:: \
atscc2erl
atscc2erl: \
$(SOURCES_DATS); \
$(PATSCC) \
  -DATS_MEMALLOC_GCBDW -O2 -o $@ \
  $(SOURCES_DATS) $(SOURCES_SATS) $(SOURCES_CATS) -lgc
#
######

CPF=cp -f
RMF=rm -f

######
#
CATSPARSEMIT_source=\
$(PATSHOMERELOC)/projects/MEDIUM/CATS-parsemit
#
pkgreloc:: ; \
$(CPF) $(CATSPARSEMIT_source)/SATS/catsparse.sats $(CATSPARSEMIT)/.
pkgreloc:: ; \
$(CPF) $(CATSPARSEMIT_source)/SATS/catsparse_*.sats $(CATSPARSEMIT)/.
pkgreloc:: ; \
$(CPF) $(CATSPARSEMIT_source)/CATS/catsparse_*_dats.c $(CATSPARSEMIT)/.
#
######
#
build:: pkgreloc
build:: atscc2erl
#
testall:: build
testall:: cleanall
#
######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.o
clean:: ; $(RMF) *_?ats.c

######

cleanall:: clean
cleanall:: ; $(RMF) ./atscc2erl
cleanall:: ; $(RMF) ./.CATS-parsemit/*

###### end of [Makefile] ######
