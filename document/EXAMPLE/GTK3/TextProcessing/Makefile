#
# A Makefile for GTK tests
#

######

PATSHOMEQ="$(PATSHOME)"
PATSCONTRIBQ="$(PATSCONTRIB)"

######

PATSCC=$(PATSHOMEQ)/bin/patscc
GTKFLAGS=`pkg-config gtk+-3.0 --cflags --libs`

######

all:: \
TextProcessing
TextProcessing: \
TextProcessing.dats \
TextProcessing_toplevel.dats ; \
  $(PATSCC) -DATS_MEMALLOC_LIBC -I$(PATSCONTRIBQ)/contrib -o $@ $^ $(GTKFLAGS)
cleanall:: ; $(RMF) TextProcessing

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.o
clean:: ; $(RMF) *_?ats.c

cleanall:: clean

###### end of [Makefile] ######
