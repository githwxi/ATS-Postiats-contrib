#
MYCFLAGS := -fpermissive -w
#
MYCFLAGS += -D_ATS_CCOMP_HEADER_NONE_
MYCFLAGS += -D_ATS_CCOMP_PRELUDE_NONE_
MYCFLAGS += -D_ATS_CCOMP_PRELUDE_USER_='"arduino/H/pats_ccomp.h"'
MYCFLAGS += -D_ATS_CCOMP_PRELUDE_USER2_='"arduino/H/pats_ccomp2.h"'
MYCFLAGS += -D_ATS_CCOMP_EXCEPTION_NONE_
#
MYCFLAGS += -D_ATSTYPE_VAR_SIZE_=1024
#
MYCFLAGS += -I./../../..
MYCFLAGS += -I$(PATSHOME)
MYCFLAGS += -I$(PATSHOME)/ccomp/runtime
MYCFLAGS += -I$(PATSHOME)/npm-utils/contrib/libats-hwxi
#
CFLAGS_STD = $(MYCFLAGS)
CXXFLAGS_STD = $(MYCFLAGS)
#
BOARD_TAG = uno
#
ARDUINO_LIBS =
#
include ./../../Arduino-Makefile/Arduino.mk
#
######

MAKE=make

######

cleanall:: ; $(MAKE) -f Makefile_ats cleanall

######
#
###### end of [Makefile] ######
