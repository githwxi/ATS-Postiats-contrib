######

include \
$(PATSHOME)/share/atsmake-pre.mk

######

MALLOCFLAG := -DATS_MEMALLOC_LIBC

######

CFLAGS :=
CFLAGS += -fPIC

LDFLAGS :=
LDFLAGS += -ldl
LDFLAGS += /usr/lib64/libbfd-2.20.51.0.2-5.36.el6.so

######

all:: libpatsbinutil.so

######

SOURCES_SATS += \
  SATS/symbol.sats \
  SATS/library.sats

SOURCES_DATS += \
  DATS/library.dats \
  DATS/symbol.dats

######

MYTARGET=MYTARGET

######

include $(PATSHOME)/share/atsmake-post.mk

######

######
#
DATSMEMALLOC=-DATS_MEMALLOC_LIBC
#
######

OBJECTS :=
OBJECTS += $(MYTARGET_SATS_O)
OBJECTS += $(MYTARGET_DATS_O)

######

libpatsbinutil.so: $(OBJECTS) ; $(CC) -shared -o $@ $^ $(LDFLAGS)

######

.phony: clean

clean:
	rm -f ?ATS/*_?ats.o libpatsbinutil.so
