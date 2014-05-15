#
# A simple Makefile
#

######

PATSHOMEQ="$(PATSHOME)"
PATSHOMERELOCQ="$(PATSHOMERELOC)"

######

PATSCC=$(PATSHOMEQ)/bin/patscc
PATSOPT=$(PATSHOMEQ)/bin/patsopt

######

MAKE=make
ATSPKGRELOC2=$(PATSHOME)/bin/atspkgreloc_wget

######

CFLAGS :=

######

LDFLAGS :=
LDFLAGS += -lev

######

all::

######

all:: \
test00
test00: test00.dats ; \
  $(PATSCC) -I$(PATSHOMERELOCQ)/contrib/libats-/hwxi $(CFLAGS) -o $@ $< $(LDFLAGS)
cleanall:: ; $(RMF) test00

######

RMF=rm -f
RMRF=rm -rf

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c
clean:: ; $(RMF) *_?ats.o

######

cleanall:: clean

###### end of [Makefile] ######
