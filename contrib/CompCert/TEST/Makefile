#
INCLUDATS :=
INCLUDATS += -I${PATSHOME}
INCLUDATS += -I${PATSHOMERELOC}/contrib
#
CFLAGS_ATS :=
CFLAGS_ATS += -D_ATS_CCOMP_HEADER_NONE
CFLAGS_ATS += -D_ATS_CCOMP_PRELUDE_NONE
CFLAGS_ATS += -D_ATS_CCOMP_PRELUDE_USER='\"CompCert/H/pats_ccomp.h\"'
CFLAGS_ATS += -D_ATS_CCOMP_RUNTIME_NONE
CFLAGS_ATS += -D_ATS_CCOMP_EXCEPTION_NONE
CFLAGS_ATS += -D_ATSTYPE_VAR_SIZE=0x10000
#
######

CFLAGS_COMPCERT += -D__signed__=
CFLAGS_COMPCERT += -D__GLIBC_HAVE_LONG_LONG=1

######

COMPCERT=compcert

######

COMPCERT2=\
$(COMPCERT) \
  -fbitfields -flongdouble \
  -fpacked-structs -fstruct-return \
  $(CFLAGS_COMPCERT)

######

export PATSCCOMP=$(COMPCERT2)

######

PATSCC=$(PATSHOME)/bin/patscc

######

all:: \
test00
test00: \
test00.dats; \
$(PATSCC) $(INCLUDATS) $(CFLAGS_ATS) -o $@ -verbose $<
cleanall:: ; $(RMF) test00

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.o
clean:: ; $(RMF) *_?ats.c

######

cleanall:: clean

######

###### end of [Makefile] ######