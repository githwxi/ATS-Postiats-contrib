#
# A simple Makefile
#

######

PATSHOMEQ="$(PATSHOME)"
PATSHOMERELOCQ="$(PATSHOMERELOC)"

######

PATSCC=$(PATSHOMEQ)/bin/patscc

######

all::
regress::
cleanall::

######

all:: test00
regress:: test00; ./$<
test00: test00.dats ; \
  $(PATSCC) -I$(PATSHOMERELOCQ)/contrib -o $@ $< -lpcre
cleanall:: ; $(RMF) test00

######

all:: test01
test01: test01.dats ; \
  $(PATSCC) -DATS_MEMALLOC_LIBC -I$(PATSHOMERELOCQ)/contrib -o $@ $< testlib.dats -lpcre
regress:: test01; ./$<
cleanall:: ; $(RMF) test01

######

all:: test02
test02: test02.dats ; \
  $(PATSCC) -DATS_MEMALLOC_LIBC -I$(PATSHOMERELOCQ)/contrib -o $@ $< testlib.dats -lpcre
regress:: test02; ./$<
cleanall:: ; $(RMF) test02

######

all:: test03
test03: test03.dats ; \
  $(PATSCC) -DATS_MEMALLOC_LIBC -I$(PATSHOMERELOCQ)/contrib -o $@ $< testlib.dats -lpcre
regress:: test03; ./$<
cleanall:: ; $(RMF) test03

######

all:: test04
test04: test04.dats ; \
  $(PATSCC) -DATS_MEMALLOC_LIBC -I$(PATSHOMERELOCQ)/contrib -o $@ $< testlib.dats -lpcre
regress:: test04; ./$<
cleanall:: ; $(RMF) test04

######

all:: test05
test05: test05.dats ; \
  $(PATSCC) -DATS_MEMALLOC_LIBC -I$(PATSHOMERELOCQ)/contrib -o $@ $< testlib.dats -latslib -lpcre
regress:: test05 ; \
cat test05.dats | ./test05
cleanall:: ; $(RMF) test05

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c
clean:: ; $(RMF) *_?ats.o

######

cleanall:: clean

###### end of [Makefile] ######
