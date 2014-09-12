#
# Makefile for
# ATS-parse-emit-javascript
#

######

include \
$(PATSHOME)/share/atsmake-pre.mk

######
#
CFLAGS += -O2
#
######

LDFLAGS += -lm
LDFLAGS += -lgc
MALLOCFLAG = -DATS_MEMALLOC_GCBDW

######

SOURCES_SATS += atsparemit.sats
SOURCES_SATS += atsparemit_syntax.sats
SOURCES_SATS += atsparemit_parsing.sats
SOURCES_SATS += atsparemit_emit.sats

######
#
SOURCES_DATS += atsparemit_mylib.dats
#
SOURCES_DATS += atsparemit_error.dats
SOURCES_DATS += atsparemit_print.dats
SOURCES_DATS += atsparemit_symbol.dats
SOURCES_DATS += atsparemit_fname.dats
SOURCES_DATS += atsparemit_posloc.dats
SOURCES_DATS += atsparemit_global.dats
SOURCES_DATS += atsparemit_syntax.dats
SOURCES_DATS += atsparemit_lexerr.dats
SOURCES_DATS += atsparemit_lexbuf.dats
SOURCES_DATS += atsparemit_lexing.dats
SOURCES_DATS += atsparemit_tokbuf.dats
SOURCES_DATS += atsparemit_parerr.dats
SOURCES_DATS += atsparemit_parsing.dats
SOURCES_DATS += atsparemit_parsing_d0exp.dats
SOURCES_DATS += atsparemit_parsing_d0ecl.dats
SOURCES_DATS += atsparemit_parsing_instr.dats
#
SOURCES_DATS += atsparemit_emit.dats
SOURCES_DATS += atsparemit_typedef.dats
#
SOURCES_DATS += atsparemit_emit_js.dats
SOURCES_DATS += atsparemit_emit2_js.dats
#
SOURCES_DATS += atsparemit_main_js.dats
#
######

MYTARGET=atscc2js

######

include $(PATSHOME)/share/atsmake-post.mk

######

WCL=wc -l
srclines: ; $(WCL) *.?ats

######

cleanats:: ; $(RMF) *_?ats.c

######

cleanall:: ; $(RMF) atscc2js

######

###### end of [Makefile] ######
