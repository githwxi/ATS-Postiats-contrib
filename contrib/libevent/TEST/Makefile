#
# A simple Makefile
#

######

PATSHOMEQ="$(PATSHOME)"
PATSHOMERELOCQ="$(PATSHOMERELOC)"

######

PATSCC=$(PATSHOMEQ)/bin/patscc

######

CFLAGS :=
CFLAGS += $(shell pkg-config --cflags libevent)

######

LDFLAGS :=
LDFLAGS += $(shell pkg-config --libs libevent)

######

all::
all:: test00
all:: test_download

######

test00: test00.dats ; \
  $(PATSCC) -I$(PATSHOMERELOCQ)/contrib $(CFLAGS) -o $@ $< $(LDFLAGS)
cleanall:: ; $(RMF) test00

######

test_download: test_download.dats ; \
  $(PATSCC) -DATS_MEMALLOC_LIBC -I$(PATSHOMERELOCQ)/contrib $(CFLAGS) -o $@ $< $(LDFLAGS)
cleanall:: ; $(RMF) test_download

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c
clean:: ; $(RMF) *_?ats.o

cleanall:: clean

###### end of [Makefile] ######
