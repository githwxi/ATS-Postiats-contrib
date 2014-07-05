#
# Makefile ATS-emitparse
#

######

include \
$(PATSHOME)/share/atsmake-pre.mk

######
#
CFLAGS += -O2
#
######

LDFLAGS += -lgc -lm
MALLOCFLAG = -DATS_MEMALLOC_GCBDW

######

SOURCES_SATS += emitparse.sats

######
#
SOURCES_DATS += emitparse_main.dats
#
SOURCES_DATS += emitparse_print.dats
SOURCES_DATS += emitparse_fname.dats
SOURCES_DATS += emitparse_posloc.dats
SOURCES_DATS += emitparse_global.dats
SOURCES_DATS += emitparse_lexing.dats
#
######

MYTARGET=atsemitparse

######

include $(PATSHOME)/share/atsmake-post.mk

######

cleanats:: ; $(RMF) *_?ats.c

######

cleanall:: ; $(RMF) atsemitparse

######

###### end of [Makefile] ######
