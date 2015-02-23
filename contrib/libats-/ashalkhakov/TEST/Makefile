#
# A simple Makefile
# for testing libats-ashalkhakov
#

######

CC=gcc

######

PATSHOMEQ="$(PATSHOME)"
PATSHOMERELOCQ="$(PATSHOMERELOC)"

######

PATSCC=$(PATSHOMEQ)/bin/patscc
PATSOPT=$(PATSHOMEQ)/bin/patsopt

######

PATSLIB=$(PATSHOME)/ccomp/atslib/lib

######

PATSCCOMP=$(CC) -D_XOPEN_SOURCE -I${PATSHOME} -I${PATSHOME}/ccomp/runtime

######

export PATSCCOMP

######

all::
regress::
cleanall::

######

# all:: test_sstrbuf
# test01: \
#   test_sstrbuf.dats ; $(PATSCC) -o $@ $<
# regress:: test_sstrbuf; ./$<
# cleanall:: ; $(RMF) test_sstrbuf

######

all:: test_offset
test_offset: \
test_offset.dats ; $(PATSCC) \
  -IIATS $(PATSHOMERELOCQ)contrib -DATS_MEMALLOC_LIBC -o $@ $<
regress:: test_offset; ./$<
cleanall:: ; $(RMF) test_offset

######

all:: test_rbuf
test_rbuf: \
test_rbuf.dats ; $(PATSCC) \
  -IIATS $(PATSHOMERELOCQ)contrib -DATS_MEMALLOC_LIBC -o $@ $<
regress:: test_rbuf; ./$<
cleanall:: ; $(RMF) test_rbuf

######

testall:: all
testall:: regress
testall:: cleanall

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.o *_?ats.c
clean:: ; $(RMF) *_atxt.txt
clean:: ; $(RMF) *_atxt.dats

cleanall:: clean

######

###### end of [Makefile] ######
