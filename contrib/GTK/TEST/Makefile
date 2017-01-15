#
# A Makefile for GTK tests
#

######

PATSHOMEQ="$(PATSHOME)"
PATSCONTRIBQ="$(PATSCONTRIB)"

######

PATSCC=$(PATSHOMEQ)/bin/patscc
GTKFLAGS=$(shell pkg-config gtk+-3.0 --cflags --libs)

######

all::
cleanall::

######

all:: test00
test00: test00.dats ; $(PATSCC) -I$(PATSCONTRIBQ)/contrib -o $@ $< $(GTKFLAGS)
cleanall:: ; $(RMF) test00

all:: test01
test01: test01.dats ; $(PATSCC) -I$(PATSCONTRIBQ)/contrib -o $@ $< $(GTKFLAGS)
cleanall:: ; $(RMF) test01

all:: test02
test02: test02.dats ; $(PATSCC) -I$(PATSCONTRIBQ)/contrib -o $@ $< $(GTKFLAGS)
cleanall:: ; $(RMF) test02

all:: test03
test03: test03.dats ; $(PATSCC) -I$(PATSCONTRIBQ)/contrib -o $@ $< $(GTKFLAGS)
cleanall:: ; $(RMF) test03

all:: test04
test04: test04.dats ; $(PATSCC) -I$(PATSCONTRIBQ)/contrib -o $@ $< $(GTKFLAGS)
cleanall:: ; $(RMF) test04

all:: test_textview
test_textview: test_textview.dats ; $(PATSCC) -I$(PATSCONTRIBQ)/contrib -o $@ $< $(GTKFLAGS)
cleanall:: ; $(RMF) test_textview

######

RMF=rm -f

######

testall:: all
testall:: cleanall

######
#
clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.o
clean:: ; $(RMF) *_?ats.c
#
cleanall:: clean
#
###### end of [Makefile] ######
