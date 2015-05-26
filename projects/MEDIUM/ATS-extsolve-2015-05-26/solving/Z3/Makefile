#
# A constraint solver based on Z3
#

######

include \
$(PATSHOME)/share/atsmake-pre.mk

######

PATSCC := $(PATSCC) -IATS ../../

######

PYTHON_PREFIX = $(shell python-config --prefix)

######

CFLAGS += -g
CFLAGS += -O2
CFLAGS += -Wunused-label
CFLAGS += -I${PYTHON_PREFIX}/include
CFLAGS +=  $(shell python-config --includes)
CFLAGS +=  $(shell python-config --cflags)

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

######

cleanall:: ; $(RMF) z3.o

###### end of [Makefile] ######

