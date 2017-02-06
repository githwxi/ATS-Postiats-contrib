#
# A Simple Makefile
#

######

include $(PATSHOME)/share/atsmake-pre.mk

######

MYTARGET=MYTARGET
MYCCRULE=MYCCRULE

######

include $(PATSHOME)/share/atsmake-post.mk

######

CCOPT=gcc -std=c99 -D_XOPEN_SOURCE -D_GNU_SOURCE 

######

CFLAGS :=
CFLAGS += -I$(PATSHOMEQ)
CFLAGS += -I$(PATSHOMEQ)/ccomp/runtime
CFLAGS += -I$(PATSHOMEQ)/contrib
CFLAGS +=  $(shell pkg-config --cflags json-c)

######

LDFLAGS :=
LDFLAGS += -lm
LDFLAGS += -lgc
LDFLAGS += -L$(PATSHOMEQ)/ccomp/atslib/lib
LDFLAGS += -latslib
LDFLAGS +=  $(shell pkg-config --libs json-c)

######

MALLOCFLAG=-DATS_MEMALLOC_GCBDW

######

PATSCC2= $(PATSCC) -atsccomp "$(CCOPT)" $(MALLOCFLAG) $(CFLAGS)

######

UTFPLSRC_sta := \
  utfpl.sats \

UTFPLSRC_dyn := \
  utfpl_stamp.dats \
  utfpl_symbol.dats \
  utfpl_location.dats \
  utfpl_label.dats \
  utfpl_d2cst.dats \
  utfpl_d2var.dats \
  utfpl_d2sym.dats \
  utfpl_p2at.dats \
  utfpl_d2exp.dats \
  utfpl_d2ecl.dats \

UTFPLSRC := \
  $(UTFPLSRC_sta) \
  $(UTFPLSRC_dyn) \

######

UTFPLOBJ := $(UTFPLSRC)
UTFPLOBJ := $(patsubst %.sats, %_sats.o, $(UTFPLOBJ))
UTFPLOBJ := $(patsubst %.dats, %_dats.o, $(UTFPLOBJ))

######

all:: UTFPLEVAL

######
#
utfpl.o: $(UTFPLOBJ) ; ld -r -o $@ $^
#
parsing/parsing.o: ; make -C parsing parsing.o
#
evaluating/evaluating.o: ; make -C evaluating evaluating.o
#
######

MAKE=make

######
#
UTFPLEVAL:: ; \
  $(MAKE) -C parsing
UTFPLEVAL:: ; \
  $(MAKE) -C evaluating
UTFPLEVAL:: utfpl.o \
  parsing/parsing.o \
  evaluating/evaluating.o \
  utfpl_dynloadall_dats.o \
  utfpleval_dats.o \
  utfpleval_symenv_dats.o \
  utfpleval_mylib_dats.o ; \
  $(PATSCC2) -o utfpleval $^ $(LDFLAGS)
#
######

%_sats.o: %.sats ; $(PATSCC2) -c $<
%_dats.o: %.dats ; $(PATSCC2) -c $<

######

-include .depend

######

depend:: ; $(RMF) .depend
depend:: ; $(PATSOPT) --output-a .depend --depgen -
depend:: ; $(PATSOPT) --output-a .depend --depgen -s $(UTFPLSRC_sta)
depend:: ; $(PATSOPT) --output-a .depend --depgen -d $(UTFPLSRC_dyn)
depend:: ; $(PATSOPT) --output-a .depend --depgen -s utfpleval.sats
depend:: ; $(PATSOPT) --output-a .depend --depgen -d utfpleval_symenv.dats
depend:: ; $(PATSOPT) --output-a .depend --depgen -d utfpleval.dats

######
#
testall:: UTFPLEVAL
#
testall:: ; $(MAKE) -C TEST
#
testall:: ; ./utfpleval TEST/test01_utfpl.json
testall:: ; ./utfpleval TEST/test02_utfpl.json
testall:: ; ./utfpleval TEST/test03_utfpl.json
testall:: ; ./utfpleval TEST/test04_utfpl.json
testall:: ; ./utfpleval TEST/test05_utfpl.json
testall:: ; ./utfpleval TEST/test06_utfpl.json < TEST/test06_utfpl.json
testall:: ; ./utfpleval TEST/queens_utfpl.json
#
testall:: cleanall
#
######

cleanats:: ; $(RMF) *_?ats.c

######

cleanall:: ; $(RMF) utfpl.o
cleanall:: ; $(RMF) utfpleval
cleanall:: ; make -C parsing cleanall
cleanall:: ; make -C evaluating cleanall
cleanall:: ; make -C TEST cleanall

######

###### end of [Makefile] ######
