#
# Makefile for compiling modules
#

######

MAKE=make

######

PATSCC=${PATSHOME}/bin/patscc
PATSOPT=${PATSHOME}/bin/patsopt

######

obj-m += hello-1_dats.o
obj-m += hello-2_dats.o

######

EXTRA_CFLAGS += -D_ATS_CCOMP_HEADER_NONE
EXTRA_CFLAGS += -D_ATS_CCOMP_PRELUDE_NONE
EXTRA_CFLAGS += -D_ATS_CCOMP_PRELUDE_USER=\"linux/H/pats_ccomp.h\"
EXTRA_CFLAGS += -D_ATS_CCOMP_EXCEPTION_NONE

######

EXTRA_CFLAGS += -I${PATSHOMERELOC}/contrib

######

BUILD=/lib/modules/$(shell uname -r)/build

######

all:: \
hello-1_dats.c
hello-1_dats.c: \
hello-1.dats; $(PATSOPT) -o $@ --dynamic $<

######

all:: \
hello-2_dats.c
hello-2_dats.c: \
hello-2.dats; $(PATSOPT) -o $@ --dynamic $<

######

all:: ; $(MAKE) -C $(BUILD) M=$(PWD) modules

######

RMF=rm -f

######

clean:: ; $(RMF) *~

######

cleanall:: clean
cleanall:: ; $(RMF) hello-1_dats.c
cleanall:: ; $(RMF) hello-2_dats.c
cleanall:: ; $(MAKE) -C $(BUILD) M=$(PWD) clean

###### end of [Makefile] ######
