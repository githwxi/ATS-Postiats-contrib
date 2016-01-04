#
# A Simple Makefile
#

######

include \
$(PATSHOME)/share/atsmake-pre.mk

######

MYCCRULE=MYCCRULE

######

include $(PATSHOME)/share/atsmake-post.mk

######
#
# HX-2013:
# This example shows a straightforward way to using
# one's own malloc/free.
#
######

all:: test
test: \
  program-1-2_dats.c \
  program-1-2-test_dats.c ; \
  $(PATSCC2) -DATS_MEMALLOC_USER -O2 -o $@ myruntime.c $^
cleanall:: ; $(RMF) test

######

%_dats.c: %.dats; $(PATSOPT) --output $@ --dynamic $<

######

cleanats:: ; $(RMF) *_dats.c

###### end of [Makefile] ######
