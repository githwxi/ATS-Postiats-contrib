#
# A simple Makefile
#

######

PATSHOMEQ="$(PATSHOME)"

######

PATSCC=$(PATSHOMEQ)/bin/patscc
PATSLIB=$(PATSHOMEQ)/ccomp/atslib/lib

######

all::
all:: test_spinref
all:: test_nwaiter
all:: test_workshop

######

test_spinref: \
test_spinref.dats ; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $< -lpthread

######

test_nwaiter: \
test_nwaiter.dats ; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $< -lpthread

######

test_workshop: \
test_workshop.dats ; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $< -lpthread

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c
clean:: ; $(RMF) *_?ats.o

######

cleanall:: clean
cleanall:: ; $(RMF) test_spinref
cleanall:: ; $(RMF) test_nwaiter
cleanall:: ; $(RMF) test_workshop

###### end of [Makefile] ######
