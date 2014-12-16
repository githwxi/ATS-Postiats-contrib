#
# A simple Makefile
#

######

include \
$(PATSHOME)/share/atsmake-pre.mk

######

MYCCRULE=MYCCRULE

######

MALLOCFLAG=-DATS_MEMALLOC_LIBC

######

all::
regress::
cleanall::

######

all:: test01
test01: test01.dats ; \
$(PATSCC2) -O2 $(MALLOCFLAG) -o $@ $< testlib.dats
cleanall:: ; $(RMF) test01

######

all:: test02
test02: test02.dats ; \
$(PATSCC2) -O2 $(MALLOCFLAG) -o $@ $< testlib.dats
cleanall:: ; $(RMF) test02

######

regress:: test01 ; ./test01
regress:: test02 ; ./test02 < DATA/pkgreloc.json

######

include \
$(PATSHOME)/share/atsmake-post.mk

######

testall:: all
testall:: regress
testall:: cleanall

######

cleanats:: ; $(RMF) *_?ats.c

###### end of [Makefile] ######
