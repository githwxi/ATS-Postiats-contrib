#
# A Simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

ATSPAREMIT=./../atscc2cil

######

MONO=mono
ILASM=ilasm
ILPP=cpp -P -B $(PATSHOMERELOC)/contrib

######

all::
regress::
cleanall::

######

RMF=rm -f
RMRF=rm -rf
CPRF=cp -rf

######

all:: \
fact_dats.exe
fact_dats.c: fact.dats ; \
$(PATSOPT) --output $@ --dynamic $<
fact_dats.ilpp: fact_dats.c ; \
$(ATSPAREMIT) -n 'Postiats' -o $@ -i $<
fact_dats.il: fact_dats.ilpp ; \
$(ILPP) $< $@
fact_dats.exe: fact_dats.il ; \
$(ILASM) /output:$@ $<
fact:: fact_dats.exe ; $(MONO) fact_dats.exe
regress:: fact
cleanall:: ; $(RMF) fact_dats.exe fact_dats.il fact_dats.ilpp fact_dats.c

######

all:: \
fact2_dats.exe
fact2_dats.c: fact2.dats ; \
$(PATSOPT) --output $@ --dynamic $<
fact2_dats.ilpp: fact2_dats.c ; \
$(ATSPAREMIT) -n 'Postiats' -o $@ -i $<
fact2_dats.il: fact2_dats.ilpp ; \
$(ILPP) $< $@
fact2_dats.exe: fact2_dats.il ; \
$(ILASM) /output:$@ $<
fact2:: fact2_dats.exe ; $(MONO) fact2_dats.exe
regress:: fact2
cleanall:: ; $(RMF) fact2_dats.exe fact2_dats.il fact2_dats.ilpp fact2_dats.c

######

all:: \
f91_dats.exe
f91_dats.c: f91.dats ; \
$(PATSOPT) --output $@ --dynamic $<
f91_dats.ilpp: f91_dats.c ; \
$(ATSPAREMIT) -n 'Postiats' -o $@ -i $<
f91_dats.il: f91_dats.ilpp ; \
$(ILPP) $< $@
f91_dats.exe: f91_dats.il ; \
$(ILASM) /output:$@ $<
f91:: f91_dats.exe ; $(MONO) f91_dats.exe
regress:: f91
cleanall:: ; $(RMF) f91_dats.exe f91_dats.il f91_dats.ilpp f91_dats.c

######

all:: \
fib_dats.exe
fib_dats.c: fib.dats ; \
$(PATSOPT) --output $@ --dynamic $<
fib_dats.ilpp: fib_dats.c ; \
$(ATSPAREMIT) -n 'Postiats' -o $@ -i $<
fib_dats.il: fib_dats.ilpp ; \
$(ILPP) $< $@
fib_dats.exe: fib_dats.il ; \
$(ILASM) /output:$@ $<
fib:: fib_dats.exe ; $(MONO) fib_dats.exe
regress:: fib
cleanall:: ; $(RMF) fib_dats.exe fib_dats.il fib_dats.ilpp fib_dats.c
