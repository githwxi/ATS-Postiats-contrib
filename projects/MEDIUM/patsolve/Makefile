#
# A simple Makefile
#

######

include \
$(PATSHOME)/share/atsmake-pre.mk

######

MALLOCFLAG := -DATS_MEMALLOC_LIBC

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
#
DATSMEMALLOC=-DATS_MEMALLOC_LIBC
#
######

OBJECTS :=
OBJECTS += $(MYTARGET_SATS_O)
OBJECTS += $(MYTARGET_DATS_O)

######

all:: patsolve
cleanall:: ; $(RMF) patsolve constraint.o

######

constraint.o: $(OBJECTS) ; ld -r -o $@ $^

patsolve: constraint.o
	make -C parsing
	make -C solving
	make -C solving/Z3
	cp solving/Z3/patsolve ./patsolve

######

cleanall:: ; make -C parsing cleanall
cleanall:: ; make -C solving cleanall
cleanall:: ; make -C solving/Z3 cleanall

###### end of [Makefile] ######
