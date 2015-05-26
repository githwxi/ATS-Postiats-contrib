##
## ATS-extsolve-z3:
## Solving ATS-constraints with Z3
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

all::

######
#
CFLAGS :=
CFLAGS += -DATS_MEMALLOC_LIBC
#
CFLAGS2 :=
CFLAGS2 += \
-IIATS ${PATSHOMERELOC}/contrib
CFLAGS2 += \
$(shell pkg-config --cflags json-c)
#
######

LDFLAGS :=
LDFLAGS += $(shell pkg-config --libs json-c)

######

EXTRAFLAGS :=

######

INCLUDE :=
INCLUDE += -I$(PATSHOMEQ)
INCLUDE += -I$(PATSHOMEQ)/ccomp/runtime

######

PATSOLVE=./.ATS-extsolve

######

SOURCES_SATS= \
  $(PATSOLVE)/patsolve_cnstrnt.sats \
  $(PATSOLVE)/patsolve_parsing.sats \

######

SOURCES_CATS= \
  $(PATSOLVE)/patsolve_cnstrnt_dats.c \
  $(PATSOLVE)/patsolve_parsing_dats.c \

######

SOURCES_DATS :=
SOURCES_DATS += patsolve_z3_main.dats
SOURCES_DATS += patsolve_z3_commarg.dats
SOURCES_DATS += patsolve_z3_solving.dats

######
#
all:: \
patsolve_z3
patsolve_z3: \
$(SOURCES_DATS); \
$(PATSCC) \
  -DATS_MEMALLOC_GCBDW -O2 -o $@ \
  $(SOURCES_DATS) $(SOURCES_SATS) $(SOURCES_CATS) -lgc
#
######
#
PATSOLVE_source=\
$(PATSHOMERELOC)/projects/MEDIUM/CATS-parsemit
#
pkgreloc:: ; \
$(CPF) $(PATSOLVE_source)/patsolve_cnstrnt.sats $(PATSOLVE)/.
pkgreloc:: ; \
$(CPF) $(PATSOLVE_source)/patsolve_parsing.sats $(PATSOLVE)/.
pkgreloc:: ; \
$(CPF) $(PATSOLVE_source)/CATS/patsolve_cnstrnt_dats.c $(PATSOLVE)/.
pkgreloc:: ; \
$(CPF) $(PATSOLVE_source)/CATS/patsolve_parsing_dats.c $(PATSOLVE)/.
#
######

CPF=cp -f
RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.o
clean:: ; $(RMF) *_?ats.c

######

cleanall:: clean

######

## end of [Makefile] ##
