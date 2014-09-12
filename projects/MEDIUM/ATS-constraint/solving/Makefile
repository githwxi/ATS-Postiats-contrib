#
# A simple Makefile
#

######

include \
$(PATSHOME)/share/atsmake-pre.mk

######

PATSCC := $(PATSCC) -IATS ../

######

CFLAGS += $(shell pkg-config --cflags json-c)

######

LDFLAGS :=
LDFLAGS += -L$(PATSHOMEQ)/ccomp/atslib/lib
LDFLAGS += -latslib
LDFLAGS += $(shell pkg-config --libs json-c)

######

all:: solving.o

######

SOURCES_SATS += \
  solver.sats \
  smt.sats \
  smt_ML.sats \
  error.sats \
  stack.sats \

SOURCES_DATS += \
  solver.dats \
  solver_smt.dats \
  solver_s2cstmap.dats \
  solver_s2varmap.dats \
  stack.dats \
  solver_dynload.dats

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

solving.o: $(OBJECTS) ; ld -r -o $@ $^

######

cleanall:: ; $(RMF) solving.o

###### end of [Makefile] ######
