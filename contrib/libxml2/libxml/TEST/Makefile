#
# A Simple Makefile
#

######

CCOPT=gcc

######

PATSHOMEQ="$(PATSHOME)"
PATSHOMERELOCQ="$(PATSHOMERELOC)"

######

PATSCC=$(PATSHOMEQ)/bin/patscc
PATSOPT=$(PATSHOMEQ)/bin/patsopt

######

CFLAGS :=
CFLAGS += -I$(PATSHOMERELOCQ)/contrib 
CFLAGS += $(shell xml2-config --cflags)

######

LDFLAGS :=
LDFLAGS += $(shell xml2-config --libs)

######

all::
all:: htmlParseDoc
all:: htmlTreeWalk

######

htmlParseDoc: htmlParseDoc.dats; \
  $(PATSCC) -DATS_MEMALLOC_LIBC $(CFLAGS) -O2 -o $@ $< $(LDFLAGS) -latslib
cleanall:: ; $(RMF) htmlParseDoc

######

htmlTreeWalk: htmlTreeWalk.dats; $(PATSCC) $(CFLAGS) -O2 -o $@ $< $(LDFLAGS)
cleanall:: ; $(RMF) htmlTreeWalk

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c
clean:: ; $(RMF) *_?ats.o

######

cleanall:: clean

######

###### end of [Makefile] ######
