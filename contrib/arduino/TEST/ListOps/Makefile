#
MYCFLAGS := -fpermissive -w
MYCFLAGS += -D_ATS_CCOMP_HEADER_NONE
MYCFLAGS += -D_ATS_CCOMP_PRELUDE_NONE
MYCFLAGS += -D_ATS_CCOMP_PRELUDE_USER='"arduino/H/pats_ccomp.h"'
MYCFLAGS += -D_ATS_CCOMP_PRELUDE_USER2='"arduino/H/pats_ccomp2.h"'
MYCFLAGS += -D_ATS_CCOMP_EXCEPTION_NONE
MYCFLAGS += -D_ATSTYPE_VAR_SIZE=1024
MYCFLAGS += -I$(PATSHOME) -I$(PATSHOME)/ccomp/runtime -I${PATSHOMERELOC}/contrib
#
CFLAGS_STD = $(MYCFLAGS)
CXXFLAGS_STD = $(MYCFLAGS)
#
BOARD_TAG = uno
ARDUINO_LIBS =
include ./../../Arduino-Makefile/Arduino.mk
#
######

MAKE=make

######

cleanall:: ; $(MAKE) -f Makefile_ats cleanall

######
#
###### end of [Makefile] ######
