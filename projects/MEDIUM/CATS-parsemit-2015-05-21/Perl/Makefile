#
# Makefile for
# ATS-parse-emit-perl
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

SOURCES_SATS += catsparse.sats
SOURCES_SATS += catsparse_syntax.sats
SOURCES_SATS += catsparse_parsing.sats
SOURCES_SATS += catsparse_emit.sats

######
#
SOURCES_DATS += catsparse_mylib.dats
#
SOURCES_DATS += catsparse_error.dats
SOURCES_DATS += catsparse_print.dats
SOURCES_DATS += catsparse_symbol.dats
SOURCES_DATS += catsparse_fname.dats
SOURCES_DATS += catsparse_posloc.dats
SOURCES_DATS += catsparse_global.dats
SOURCES_DATS += catsparse_syntax.dats
SOURCES_DATS += catsparse_lexerr.dats
SOURCES_DATS += catsparse_lexbuf.dats
SOURCES_DATS += catsparse_lexing.dats
SOURCES_DATS += catsparse_tokbuf.dats
SOURCES_DATS += catsparse_parerr.dats
SOURCES_DATS += catsparse_parsing.dats
SOURCES_DATS += catsparse_parsing_d0exp.dats
SOURCES_DATS += catsparse_parsing_d0ecl.dats
SOURCES_DATS += catsparse_parsing_instr.dats
#
SOURCES_DATS += catsparse_emit.dats
SOURCES_DATS += catsparse_typedef.dats
#
SOURCES_DATS += catsparse_emit_pl.dats
SOURCES_DATS += catsparse_emit2_pl.dats
#
SOURCES_DATS += catsparse_main_pl.dats
#
######

MYTARGET=atscc2pl

######

include $(PATSHOME)/share/atsmake-post.mk

######

WCL=wc -l
srclines: ; $(WCL) *.?ats

######

testall:: all
testall:: cleanall

######

cleanats:: ; $(RMF) *_?ats.c

######

cleanall:: ; $(RMF) atscc2pl

######

###### end of [Makefile] ######
