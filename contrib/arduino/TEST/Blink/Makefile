#
MYCFLAGS := -fpermissive -w
#
MYCFLAGS += -D_ATS_CCOMP_HEADER_NONE_
MYCFLAGS += -D_ATS_CCOMP_PRELUDE_NONE_
MYCFLAGS += -D_ATS_CCOMP_PRELUDE_USER_='"arduino/H/pats_ccomp.h"'
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
#
# Please make sure Arduino.mk is available
#
Arduino_mk=./../../Arduino-Makefile/Arduino.mk
Arduino_mk_src=https://github.com/sudar/Arduino-Makefile.git
#
.INTERMEDIATE: $(Arduino_mk)
#
$(Arduino_mk): ; git clone $(Arduino_mk_src) ./../../Arduino-Makefile
#
######

cleanall:: ; $(MAKE) -f Makefile_ats cleanall

######
#
###### end of [Makefile] ######
