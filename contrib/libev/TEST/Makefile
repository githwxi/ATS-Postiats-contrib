#
# A simple Makefile
#

######

PATSHOMEQ="$(PATSHOME)"
PATSHOMERELOCQ="$(PATSHOMERELOC)"

######

PATSCC=$(PATSHOMEQ)/bin/patscc
PATSOPT=$(PATSHOMEQ)/bin/patsopt

######

MAKE=make
ATSPKGRELOC2=$(PATSHOME)/bin/atspkgreloc_wget

######

CFLAGS :=

######

LDFLAGS :=
LDFLAGS += -lev

######

all::
regress::
cleanall::

######

all:: \
test00
test00: test00.dats ; \
  $(PATSCC) -I$(PATSHOMERELOCQ)/contrib $(CFLAGS) -o $@ $< $(LDFLAGS)
regress:: test00; ./$<
cleanall:: ; $(RMF) test00

######
#
test00-pkgreloc:: \
test00-pkgreloc.dats ; \
$(PATSCC) -I ./.TEST00/. -IATS ./.TEST00/. \
-DATS ATSPKGRELOCROOT=\\\".TEST00\\\" $(CFLAGS) -o $@ $< $(LDFLAGS)
#
test00-pkgreloc.mk: ; \
$(PATSOPT) --pkgreloc \
-DATS ATSPKGRELOCROOT=\".TEST00\" -d test00-pkgreloc.dats | $(ATSPKGRELOC2) --output-w $@
#
test00-pkgreloc.wget:: test00-pkgreloc.mk ; $(MAKE) -f ./$< wgetall
#
cleanall:: ; $(RMF) test00-pkgreloc
cleanall:: ; $(RMF) test00-pkgreloc.mk
#
######

all:: \
test01
test01: test01.dats ; \
  $(PATSCC) -I$(PATSHOMERELOCQ)/contrib $(CFLAGS) -o $@ $< $(LDFLAGS)
regress:: test01; echo | ./$<
cleanall:: ; $(RMF) test01

######

testall:: all
testall:: regress
testall:: cleanall

######

RMF=rm -f
RMRF=rm -rf

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c
clean:: ; $(RMF) *_?ats.o

######

cleanall:: clean
cleanall:: ; $(RMRF) .TEST00

###### end of [Makefile] ######
