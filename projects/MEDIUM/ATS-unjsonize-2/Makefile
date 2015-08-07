##
## ATS-unjsonize-2
## UN-jsonize level-2 syntax
## (that is, level-2 internalization)
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

SOURCES_SATS= \
  patsunj2_synent2.sats \
  patsunj2_parsing.sats \

######

SOURCES_DATS= \
  patsunj2_main.dats \
  patsunj2_mylib.dats \
  patsunj2_commarg.dats \
  patsunj2_parsing.dats \

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

PATSCC2 = $(PATSCC) $(CFLAGS)
PATSCC3 = $(PATSCC) $(CFLAGS) $(CFLAGS2)

######
#
all:: patsunj2
#
patsunj2: $(OBJECTS) ; \
  $(PATSCC) $(INCLUDE) -o $@ $^ $(LDFLAGS) $(EXTRAFLAGS)
#
######

patsunj2_main_dats.o: patsunj2_main.dats; $(PATSCC2) -c $<

######

patsunj2_mylib_dats.o: patsunj2_mylib.dats; $(PATSCC3) -c $<

######

patsunj2_commarg_sats.o: patsunj2_commarg.sats; $(PATSCC) -c $<
patsunj2_commarg_dats.o: patsunj2_commarg.dats; $(PATSCC3) -c $<

######

patsunj2_synent2_sats.o: patsunj2_synent2.sats; $(PATSCC) -c $<

######

patsunj2_parsing_sats.o: patsunj2_parsing.sats; $(PATSCC3) -c $<
patsunj2_parsing_dats.o: patsunj2_parsing.dats; $(PATSCC3) -c $<

######

DATS_C:: \
patsunj2_parsing.dats; \
$(PATSOPT) -o CATS/patsunj2_parsing_dats.c --dynamic $<

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

testall:: all
testall:: cleanall

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
cleanall:: ; $(RMF) patsunj2

######

## end of [Makefile] ##
