######
#
PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
#
######
#
MYCFLAGS := -fpermissive -w
#
MYCFLAGS += -D_ATS_CCOMP_HEADER_NONE_
MYCFLAGS += -D_ATS_CCOMP_PRELUDE_NONE_
MYCFLAGS += -D_ATS_CCOMP_PRELUDE_USER_='"ats2cpp/H/pats_ccomp.h"'
MYCFLAGS += -D_ATS_CCOMP_EXCEPTION_NONE_
#
MYCFLAGS += -D_ATSTYPE_VAR_SIZE_=1024
#
MYCFLAGS += -I$(PATSHOME) -I$(PATSHOME)/ccomp/runtime -I${PATSHOMERELOC}/contrib
#
CFLAGS = $(MYCFLAGS)
CXXFLAGS = $(MYCFLAGS)
#
######

CC=gcc
CPP=g++

######
#
test01_main: \
test01_main.dats test01_dats.o; \
$(PATSCC) -o $@ $^
#
test01_dats.o: \
test01_dats.c; $(CC) -c $(CXXFLAGS) -o $@ $<
#
test01_dats.c: test01.dats; $(PATSOPT) -o $@ -d $<
#
######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.c
clean:: ; rm -f *_?ats.o

######

cleanall:: clean
cleanall:: ; rm -f test01_main

###### end of [Makefile] ######
