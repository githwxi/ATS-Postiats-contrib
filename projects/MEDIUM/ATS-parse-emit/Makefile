#
# Makefile ATS-parsemit
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

SOURCES_SATS += atsparemit.sats

######
#
SOURCES_DATS += atsparemit_main.dats
SOURCES_DATS += atsparemit_mylib.dats
#
SOURCES_DATS += atsparemit_print.dats
SOURCES_DATS += atsparemit_fname.dats
SOURCES_DATS += atsparemit_posloc.dats
SOURCES_DATS += atsparemit_global.dats
SOURCES_DATS += atsparemit_lexbuf.dats
SOURCES_DATS += atsparemit_lexing.dats
SOURCES_DATS += atsparemit_parsing.dats
#
######

MYTARGET=atsparemit

######

include $(PATSHOME)/share/atsmake-post.mk

######

cleanats:: ; $(RMF) *_?ats.c

######

cleanall:: ; $(RMF) atsparemit

######

###### end of [Makefile] ######
