#
# A simple Makefile
#

######

include \
$(PATSHOME)/share/atsmake-pre.mk

######

PATSCC := $(PATSCC) -IATS ../

######

MALLOCFLAG := -DATS_MEMALLOC_LIBC

######

SOURCES_SATS += \
  constraint.sats

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

######

all:: constraint.o
cleanall:: ; $(RMF) constraint.o

######

constraint.o: $(OBJECTS) ; ld -r -o $@ $^

###### end of [Makefile] ######
