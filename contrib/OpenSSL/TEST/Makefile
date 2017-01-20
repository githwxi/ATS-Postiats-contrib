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

CFLAGS :=

######

LDFLAGS :=
LDFLAGS += -lcrypto

######

all::

######

all:: \
test01
test01: \
test01.dats ; \
$(PATSCC) \
-IIATS $(PATSCONTRIBQ)/contrib -o $@ $< $(LDFLAGS)
# 
# regress:: test01; ./$<
#
cleanall:: ; $(RMF) test01

######

all:: \
test02
test02: \
test02.dats ; \
$(PATSCC) -DATS_MEMALLOC_LIBC \
-IIATS $(PATSCONTRIBQ)/contrib -o $@ $< $(LDFLAGS)
regress:: test02; ./$<
cleanall:: ; $(RMF) test02

######

all:: \
test03
test03: \
test03.dats ; \
$(PATSCC) -DATS_MEMALLOC_LIBC \
-IIATS $(PATSCONTRIBQ)/contrib -o $@ $< $(LDFLAGS)
regress:: \
test03; ./$< < test03.dats
cleanall:: ; $(RMF) test03

######

testall:: all
testall:: regress
testall:: cleanall

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
