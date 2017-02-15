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

LDFLAGS += -lreadline

######

include \
$(PATSHOME)/share/atsmake-post.mk

######
#
PATSCC2=\
$(PATSCC) -I$(PATSHOME) \
-I$(PATSHOME)/ccomp/runtime -I$(PATSCONTRIB)/contrib
#
######
#
all:: \
test00
test00: test00.dats ; $(PATSCC2) -o $@ $< $(LDFLAGS)
#
cleanall:: ; $(RMF) test00
#
######
#
all:: \
test01
test01: \
test01.dats ; $(PATSCC2) $(MALLOCFLAG) -o $@ $< $(LDFLAGS)
#
cleanall:: ; $(RMF) test01
#
######
#
all:: \
test02
test02: \
test02.dats ; $(PATSCC2) $(MALLOCFLAG) -o $@ $< $(LDFLAGS)
#
cleanall:: ; $(RMF) test02
#
######

testall:: all
testall:: cleanall

######

cleanats:: ; $(RMF) *_?ats.c

###### end of [Makefile] ######
