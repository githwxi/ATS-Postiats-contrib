#
# A constraint solver based on Z3
#

######

include \
$(PATSHOME)/share/atsmake-pre.mk

######

PATSCC := $(PATSCC) -IATS ../../

######

# CFLAGS += -g
CFLAGS += $(shell python-config --include --cflags)

######

all:: z3.o

######

SOURCES_DATS += \
  z3.dats \
  z3_dynload.dats

######

MYTARGET=MYTARGET

######
#
DATSMEMALLOC=-DATS_MEMALLOC_LIBC
#
######

include $(PATSHOME)/share/atsmake-post.mk

######

OBJECTS :=
OBJECTS += $(MYTARGET_SATS_O)
OBJECTS += $(MYTARGET_DATS_O)

######

z3.o: $(OBJECTS) ; ld -r -o $@ $^

###### end of [Makefile] ######

