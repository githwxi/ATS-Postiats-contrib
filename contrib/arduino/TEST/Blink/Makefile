#
PATSOPT=$(PATSHOME)/bin/patsopt
#
MYCFLAGS := -fpermissive -w
MYCFLAGS += -D_ATS_CCOMP_HEADER_NONE
MYCFLAGS += -D_ATS_CCOMP_PRELUDE_NONE
MYCFLAGS += -D_ATS_CCOMP_PRELUDE_USER=\"kernelats/pats_ccomp.h\"
MYCFLAGS += -D_ATS_CCOMP_EXCEPTION_NONE
MYCFLAGS += -D_ATSTYPE_VAR_SIZE=1024
MYCFLAGS += -I$(PATSHOME) -I$(PATSHOME)/ccomp/runtime -I${PATSHOMERELOC}/contrib
#
CFLAGS_STD = $(MYCFLAGS)
CXXFLAGS_STD = $(MYCFLAGS)
#
BOARD_TAG = uno
ARDUINO_LIBS =
include ../Arduino.mk
#
Blink_dats.ino: Blink.dats; $(PATSOPT) -o $@ --dynamic $<
#
###### end of [Makefile] ######
