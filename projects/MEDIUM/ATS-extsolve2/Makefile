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

CFLAGS :=

######

LDFLAGS :=
EXTRAFLAGS :=

######

INCLUDE :=
INCLUDE += -I$(PATSHOMEQ)
INCLUDE += -I$(PATSHOMEQ)/ccomp/runtime

######

SOURCES_SATS= \
  patsolve_constraint3.sats \

######

SOURCES_DATS= \
  patsolve_main.dats \
  patsolve_constraint3_stamp.dats \
  patsolve_constraint3_symbol.dats \
  patsolve_constraint3_location.dats \
  patsolve_constraint3_s2cst.dats \
  patsolve_constraint3_s2var.dats \
  patsolve_constraint3_s2vvar.dats \
  patsolve_constraint3_s2exp.dats \

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

PATSCC2 = $(PATSCC) -DATS_MEMALLOC_LIBC

######
#
patsolve: $(OBJECTS) ; \
  $(PATSCC) $(INCLUDE) -o $@ $^ $(LDFLAGS) $(EXTRAFLAGS)
#
######

patsolve_constraint3_sats.o: \
  patsolve_constraint3.sats; $(PATSCC) -c $<

######

patsolve_main_dats.o: patsolve_main.dats; $(PATSCC2) -c $<

######

patsolve_constraint3_stamp_dats.o: \
  patsolve_constraint3_stamp.dats; $(PATSCC2) -c $<

patsolve_constraint3_symbol_dats.o: \
  patsolve_constraint3_symbol.dats; $(PATSCC2) -c $<

patsolve_constraint3_location_dats.o: \
  patsolve_constraint3_location.dats; $(PATSCC2) -c $<

patsolve_constraint3_s2cst_dats.o: \
  patsolve_constraint3_s2cst.dats; $(PATSCC2) -c $<

patsolve_constraint3_s2var_dats.o: \
  patsolve_constraint3_s2var.dats; $(PATSCC2) -c $<

patsolve_constraint3_s2vvar_dats.o: \
  patsolve_constraint3_s2vvar.dats; $(PATSCC2) -c $<

patsolve_constraint3_s2exp_dats.o: \
  patsolve_constraint3_s2exp.dats; $(PATSCC2) -c $<

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
