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
BOARD_TAG = unoyun
#
# MONITOR_PORT=192.168.1.9
#
ARDUINO_LIBS = Bridge
#
include ./../../../Arduino-Makefile/Arduino.mk
#
######

SCP=scp
SSH=ssh
MAKE=make

######
#
# Try to find yours: 
#
UNOYUNIP=192.168.1.9
#
######
#
yunload:: yunload_step1
yunload:: yunload_step2
#
yunload_step1:: ; \
$(SCP) build-unoyun/HttpClient.hex root@$(UNOYUNIP):/tmp/.
yunload_step2:: ; \
$(SSH) -l root $(UNOYUNIP) \
  'merge-sketch-with-bootloader.lua /tmp/HttpClient.hex && run-avrdude /tmp/HttpClient.hex'
#
yunload_step3:: ; $(SSH) -l root $(UNOYUNIP) 'telnet localhost 6571'
#
######

cleanall:: ; $(MAKE) -f Makefile_ats cleanall

######
#
###### end of [Makefile] ######
