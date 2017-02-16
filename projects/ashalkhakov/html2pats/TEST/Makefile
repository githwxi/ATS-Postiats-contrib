#
# A Simple Makefile
#

######

CCOPT=gcc

######

PATSHOMEQ="$(PATSHOME)"
PATSCONTRIBQ="$(PATSCONTRIB)"

######

PATSCC=$(PATSHOMEQ)/bin/patscc
PATSOPT=$(PATSHOMEQ)/bin/patsopt

######

HTML2PATS="./../html2pats"

######

CFLAGS :=
CFLAGS += -I$(PATSCONTRIBQ)/contrib

######

LDFLAGS :=

######

all::
regress::
cleanall::

######

hello.hats: \
DATA/hello.html; $(HTML2PATS) $< $@
cleanall:: ; $(RMF) hello.hats

all:: hellomain
hellomain: hello.hats; \
  $(PATSCC) -DATS_MEMALLOC_LIBC $(CFLAGS) -O2 -o $@ hellomain.dats $(LDFLAGS) -latslib
regress:: hellomain; ./$<
cleanall:: ; $(RMF) hellomain

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
