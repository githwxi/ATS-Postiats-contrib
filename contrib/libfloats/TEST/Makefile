#
# A simple Makefile for testing libfloats/blas
#

######

# (* Author: Hongwei Xi *)
# (* Authoremail: hwxi AT cs DOT bu DOT edu *)
# (* Start time: July, 2013 *)

# (* ****** ****** *)

# (* Author: Brandon Barker *)
# (* Authoremail: brandon.barker AT gmail DOT com *)
# (* Start time: July, 2013 *)

######

CCOMP=gcc

######

PATSHOMEQ="$(PATSHOME)"
PATSHOMERELOCQ="$(PATSHOMERELOC)"

######

PATSCC=$(PATSHOME)/bin/patscc

######
#
ATSCCOMP=\
$(CCOMP) -D_XOPEN_SOURCE \
  -I${PATSHOME} -I${PATSHOME}/ccomp/runtime -DATS_MEMALLOC_LIBC
#
######

all::
regress::
cleanall::

######

all:: test_gemm
regress:: test_gemm; ./$<
test_gemm: test_gemm.dats ; \
  $(PATSCC) -atsccomp $(ATSCCOMP) -IATS $(PATSHOMERELOCQ)/contrib -o $@ $<
cleanall:: ; $(RMF) test_gemm

all:: test_LUPdec
regress:: test_LUPdec; ./$<
test_LUPdec: test_LUPdec.dats ; \
  $(PATSCC) -atsccomp $(ATSCCOMP) -IATS $(PATSHOMERELOCQ)/contrib -o $@ $<
cleanall:: ; $(RMF) test_LUPdec

all:: test_LUPdec2
regress:: test_LUPdec2; ./$<
test_LUPdec2: test_LUPdec2.dats ; \
  $(PATSCC) -atsccomp $(ATSCCOMP) -IATS $(PATSHOMERELOCQ)/contrib -o $@ $<
cleanall:: ; $(RMF) test_LUPdec2

all:: test_Strassen
regress:: test_Strassen; ./$<
test_Strassen: test_Strassen.dats ; \
  $(PATSCC) -atsccomp $(ATSCCOMP) -IATS $(PATSHOMERELOCQ)/contrib -o $@ $<
cleanall:: ; $(RMF) test_Strassen

######

all:: test_LAgvec
regress:: test_LAgvec; ./$<
test_LAgvec: test_LAgvec.dats ; \
  $(PATSCC) -atsccomp $(ATSCCOMP) -IATS $(PATSHOMERELOCQ)/contrib -o $@ $<
cleanall:: ; $(RMF) test_LAgvec

all:: test_LAgmat
regress:: test_LAgmat; ./$<
test_LAgmat: test_LAgmat.dats ; \
  $(PATSCC) -atsccomp $(ATSCCOMP) -IATS $(PATSHOMERELOCQ)/contrib -o $@ $<
cleanall:: ; $(RMF) test_LAgmat

######

testall:: all
testall:: regress
testall:: cleanall

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.o
clean:: ; $(RMF) *_?ats.c
clean:: ; $(RMF) *_atxt.txt
clean:: ; $(RMF) *_atxt.dats

######

cleanall:: clean

######

###### end of [Makefile] ######
