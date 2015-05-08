##
## ATS-extsolve:
## For solving ATS-constraints
## with external SMT-solvers
##

######
##
## Author: Hongwei Xi
## Authoremail: gmhwxiATgmailDOTcom
##
## Start time: May, 2015
##
######

CC=gcc

######

ifdef PATSHOME
  PATSHOMEQ="$(PATSHOME)"
else
ifdef ATSHOME
  PATSHOMEQ="$(ATSHOME)"
else
  PATSHOMEQ="/usr/local/lib/ats2-postiats"
endif
endif

######

ifdef PATSHOMERELOC
  PATSHOMERELOCQ="$(PATSHOMERELOC)"
else
ifdef ATSHOMERELOC
  PATSHOMERELOCQ="$(ATSHOMERELOC)"
else
  PATSHOMERELOCQ="/usr/local/lib/ats2-postiats"
endif
endif

######

PATSCC=$(PATSHOMEQ)/bin/patscc
PATSOPT=$(PATSHOMEQ)/bin/patsopt

######

LDFLAGS :=
EXTRAFLAGS :=

######

INCLUDE :=
INCLUDE += -I$(PATSHOMEQ)
INCLUDE += -I$(PATSHOMEQ)/ccomp/runtime

######

SOURCES_SATS= \
  patsolve_constraint3.sats

SOURCES_DATS= \
  patsolve_main.dats

######

OBJECTS_SATS_O := \
  $(patsubst %.sats, %_sats.o, $(SOURCES_SATS))

OBJECTS_DATS_O := \
  $(patsubst %.dats, %_dats.o, $(SOURCES_DATS))

######

OBJECTS :=
OBJECTS += $(OBJECTS_SATS_O)
OBJECTS += $(OBJECTS_DATS_O)

######
#
patsolve: $(OBJECTS) ; \
  $(PATSCC) $(INCLUDE) $(CFLAGS) -o $@ $^ $(LDFLAGS) $(EXTRAFLAGS)
#
######

patsolve_constraint3_sats.o: \
  patsolve_constraint3.sats; $(PATSCC) -c $<

######

patsolve_main_dats.o: patsolve_main.dats; $(PATSCC) -c $<

######
#
-include .depend
#
depend:: ; $(RMF) .depend
#
ifeq ("$(strip $(SOURCES_SATS))","")
else
depend:: ; $(PATSOPT) --output-a .depend --depgen -s $(SOURCES_SATS)
endif
ifeq ("$(strip $(SOURCES_DATS))","")
else
depend:: ; $(PATSOPT) --output-a .depend --depgen -d $(SOURCES_DATS)
endif
#
######

RMF=rm -f

######

cleanats:: ; $(RMF) *~
cleanats:: ; $(RMF) *_?ats.o
cleanats:: ; $(RMF) *_?ats.c

######

clean: cleanats

######

cleanall:: cleanats
cleanall:: ; $(RMF) .depend
cleanall:: ; $(RMF) patsolve

######

## end of [Makefile] ##
