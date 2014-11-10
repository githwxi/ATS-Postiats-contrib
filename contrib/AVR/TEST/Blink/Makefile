#
# A simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######
#
MCU=atmega328p
F_CPU=16000000UL
#
######

CFLAGS :=
CFLAGS += -D_ATS_CCOMP_HEADER_NONE
CFLAGS += -D_ATS_CCOMP_PRELUDE_NONE
CFLAGS += -D_ATS_CCOMP_PRELUDE_USER=\"kernelats/pats_ccomp.h\"
CFLAGS += -D_ATS_CCOMP_EXCEPTION_NONE
CFLAGS += -D_ATSTYPE_VAR_SIZE=1024
CFLAGS += -Os -mmcu=$(MCU) -DF_CPU=$(F_CPU)
INCLUDE = -I$(PATSHOME) -I$(PATSHOME)/ccomp/runtime -I${PATSHOMERELOC}/contrib

export \
PATSCCOMP = \
avr-gcc $(INCLUDE) $(CFLAGS)

######

all: \
main
main: main.dats ; $(PATSCC) -verbose -o $@ $<

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c

######

cleanall:: clean
cleanall:: ; $(RMF) main

###### end of [Makefile] ######
