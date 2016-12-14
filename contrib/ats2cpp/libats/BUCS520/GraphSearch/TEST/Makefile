######
#
PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
#
######
#
CXXFLAGS = $(MYCFLAGS)
#
######
#
MYCFLAGS := -fpermissive -w
#
MYCFLAGS += -D_ATS_CCOMP_HEADER_NONE_
MYCFLAGS += -D_ATS_CCOMP_PRELUDE_NONE_
MYCFLAGS += -D_ATS_CCOMP_PRELUDE_USER_='"pats_ccomp.h"'
# MYCFLAGS += -D_ATS_CCOMP_RUNTIME_NONE_
MYCFLAGS += -D_ATS_CCOMP_EXCEPTION_NONE_
MYCFLAGS += -D_ATS_CCOMP_RUNTIME_TRYWITH_NONE_
#
# MYCFLAGS += -D ATSLIB_LIBATS_LIBC_CATS_STDIO
# MYCFLAGS += -D ATSLIB_LIBATS_LIBC_CATS_SYS_STAT
# MYCFLAGS += -D ATSLIB_LIBATS_LIBC_CATS_SYS_TYPES
#
# MYCFLAGS += -D_ATSTYPE_VAR_SIZE_=1024
#
MYCFLAGS += -I${PATSHOMERELOC}/contrib/ats2cpp
MYCFLAGS += -I${PATSHOMERELOC}/contrib/ats2cpp/H
MYCFLAGS += -I${PATSHOMERELOC}/contrib/ats2cpp/ccomp
#
######

CC=gcc
CPP=g++

######

all::

######
#
all:: \
QueenPuzzle
QueenPuzzle: \
QueenPuzzle_dats.c; $(CPP) $(CXXFLAGS) -o $@ $<
QueenPuzzle_dats.c: QueenPuzzle.dats; $(PATSOPT) -o $@ -d $<
#
regress:: QueenPuzzle; ./$<
cleanall:: ; rm -f QueenPuzzle
#
######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.c
clean:: ; rm -f *_?ats.o

######

cleanall:: clean

###### end of [Makefile] ######
