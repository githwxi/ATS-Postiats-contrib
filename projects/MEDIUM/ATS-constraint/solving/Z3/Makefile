#
# A constraint solver based on Z3
#

######

include \
$(PATSHOME)/share/atsmake-pre.mk

######

PATSCC := $(PATSCC) -IATS ../../

######

CFLAGS += $(shell pkg-config --cflags json-c)

######

LDFLAGS :=
LDFLAGS += -L$(PATSHOMEQ)/ccomp/atslib/lib
LDFLAGS += -latslib
LDFLAGS += $(shell pkg-config --libs json-c)
LDFLAGS += -lz3

######

all:: patsolve

######

SOURCES_DATS += \
  main.dats \
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

OBJECTS += ../../constraint.o
OBJECTS += ../../parsing/parsing.o
OBJECTS += ../solving.o

######

patsolve: $(OBJECTS); $(CC) -o $@ $^ $(LDFLAGS)

######

cleanall:: ; $(RMF) patsolve

###### end of [Makefile] ######

