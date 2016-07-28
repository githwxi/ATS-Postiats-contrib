#
# A Simple Makefile
#

######

include \
$(PATSHOME)/share/atsmake-pre.mk

######

MYTEXTING=./MYTEXT/bin/mytexting

######

CFLAGS += -O2

######

LDFLAGS :=
LDFLAGS += -lgc

######

MALLOCFLAG := -DATS_MEMALLOC_GCBDW

######

SOURCES_SATS += \
  lamcal.sats \

SOURCES_DATS += \
  lamcal_tvar.dats \
  lamcal_term.dats \
  lamcal_test.dats \

######

MYTARGET=lamcal_test

######
#
MYPORTDIR=MYPORTDIR
#
#MYPORTCPP=MYPORTCPP
#
######

include \
$(PATSHOME)/share/atsmake-post.mk

######

lamcal_declats.hats: \
lamcal.sats; $(MYTEXTING) -o /dev/null -i lamcal.sats > ./$@

######

testall:: all
testall:: regress
testall:: cleanall

######

regress:: lamcal_test; ./lamcal_test

######
#
cleanall:: ; $(RMF) $(MYPORTDIR)/*
cleanats:: ; $(RMF) $(MYPORTDIR)/*_?ats.o
cleanats:: ; $(RMF) $(MYPORTDIR)/*_?ats.c
#
cleanall:: ; $(RMF) lamcal_declats.hats
#
######

###### end of [Makefile] ######
