#
# A simple Makefile
#

######

include \
$(PATSHOME)/share/atsmake-pre.mk

######

MALLOCFLAG := -DATS_MEMALLOC_LIBC

######

CFLAGS += $(shell pkg-config --cflags json-c)

######

LDFLAGS += -L$(PATSHOMEQ)/ccomp/atslib/lib
LDFLAGS += -latslib
LDFLAGS += $(shell pkg-config --libs json-c)

######

SOURCES_SATS += \
  constraint.sats \

SOURCES_DATS += \
  constraint_stamp.dats \
  constraint_symbol.dats \
  constraint_location.dats \
  constraint_s2rt.dats \
  constraint_s2cst.dats \
  constraint_s2var.dats \
  constraint_s2vvar.dats \
  constraint_s2exp.dats \
  constraint_s3itm.dats \
  constraint_h3ypo.dats \
  constraint_c3nstr.dats \
  constraint_dynload.dats \

######

MYTARGET=MYTARGET

######

include $(PATSHOME)/share/atsmake-post.mk

######

OBJECTS :=
OBJECTS += $(MYTARGET_SATS_O)
OBJECTS += $(MYTARGET_DATS_O)

#
DATSMEMALLOC=-DATS_MEMALLOC_LIBC
#
######

PATSOLVE_OBJECTS :=
PATSOLVE_OBJECTS += $(MAINTARGET_DATS_O)
PATSOLVE_OBJECTS += constraint.o
PATSOLVE_OBJECTS += parsing/parsing.o
PATSOLVE_OBJECTS += solving/solving.o

######

######

all:: setup patsolve
cleanall:: ; $(RMF) patsolve constraint.o

setup::
	make -C parsing
	make -C solving

######

# Load any extra options we need to make Z3 work
include solving/Z3/atsmake-z3.mk

######

constraint.o: $(OBJECTS) ; ld -r -o $@ $^

main_dats.o: main.dats
	$(PATSCC2) main.dats $(DATSMEMALLOC) -c -o $@ $(CFLAGS)

patsolve: $(PATSOLVE_OBJECTS) main_dats.o
	$(PATSCC) -o $@ $^ $(LDFLAGS)

######

cleanall:: ; make -C parsing cleanall
cleanall:: ; make -C solving cleanall
cleanall:: ; make -C solving/Z3 cleanall

###### end of [Makefile] ######
