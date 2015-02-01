#
INCLATS :=
INCLATS += -I${PATSHOME}
INCLATS += -I${PATSHOMERELOC}/contrib
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

PATSCC=$(PATSHOME)/bin/patscc
export PATSCCOMP=gcc -std=c99

######

all:: \
test00
test00: \
test00.dats; \
$(PATSCC) $(INCLATS) $(CFLAGS_ATS) -o $@ -verbose $<
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