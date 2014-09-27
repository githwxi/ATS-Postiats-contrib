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
ILPP=cpp -P -iquote $(PATSHOMERELOC)/contrib/libatscc

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
fact2:: fact2_dats.exe ; $(MONO) fact2_dats.exe 10
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
f91:: f91_dats.exe ; $(MONO) f91_dats.exe 23
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
fib:: fib_dats.exe ; $(MONO) fib_dats.exe 100
regress:: fib
cleanall:: ; $(RMF) fib_dats.exe fib_dats.il fib_dats.ilpp fib_dats.c

######

all:: \
fibats_dats.exe
fibats_dats.c: fibats.dats ; \
$(PATSOPT) --output $@ --dynamic $<
fibats_dats.ilpp: fibats_dats.c ; \
$(ATSPAREMIT) -n 'Postiats' -o $@ -i $<
fibats_dats.il: fibats_dats.ilpp ; \
$(ILPP) $< $@
fibats_dats.exe: fibats_dats.il ; \
$(ILASM) /output:$@ $<
fibats:: fibats_dats.exe ; $(MONO) fibats_dats.exe 100
regress:: fib
cleanall:: ; $(RMF) fibats_dats.exe fibats_dats.il fibats_dats.ilpp fibats_dats.c

######

all:: \
acker_dats.exe
acker_dats.c: acker.dats ; \
$(PATSOPT) --output $@ --dynamic $<
acker_dats.ilpp: acker_dats.c ; \
$(ATSPAREMIT) -n 'Postiats' -o $@ -i $<
acker_dats.il: acker_dats.ilpp ; \
$(ILPP) $< $@
acker_dats.exe: acker_dats.il ; \
$(ILASM) /output:$@ $<
acker:: acker_dats.exe ; $(MONO) acker_dats.exe 3 3
regress:: acker
cleanall:: ; $(RMF) acker_dats.exe acker_dats.il acker_dats.ilpp acker_dats.c

######

all:: \
isevn_dats.exe
isevn_dats.c: isevn.dats ; \
$(PATSOPT) --output $@ --dynamic $<
isevn_dats.ilpp: isevn_dats.c ; \
$(ATSPAREMIT) -n 'Postiats' -o $@ -i $<
isevn_dats.il: isevn_dats.ilpp ; \
$(ILPP) $< $@
isevn_dats.exe: isevn_dats.il ; \
$(ILASM) /output:$@ $<
isevn:: isevn_dats.exe ; $(MONO) isevn_dats.exe 100
regress:: isevn
cleanall:: ; $(RMF) isevn_dats.exe isevn_dats.il isevn_dats.ilpp isevn_dats.c

######

all:: \
weekday_dats.exe
weekday_dats.c: weekday.dats ; \
$(PATSOPT) --output $@ --dynamic $<
weekday_dats.ilpp: weekday_dats.c ; \
$(ATSPAREMIT) -n 'Postiats' -o $@ -i $<
weekday_dats.il: weekday_dats.ilpp ; \
$(ILPP) $< $@
weekday_dats.exe: weekday_dats.il ; \
$(ILASM) /output:$@ $<
weekday:: weekday_dats.exe ; $(MONO) weekday_dats.exe
regress:: weekday
cleanall:: ; $(RMF) weekday_dats.exe weekday_dats.il weekday_dats.ilpp weekday_dats.c

######

all:: \
rtfind_dats.exe
rtfind_dats.c: rtfind.dats ; \
$(PATSOPT) --output $@ --dynamic $<
rtfind_dats.ilpp: rtfind_dats.c ; \
$(ATSPAREMIT) -n 'Postiats' -o $@ -i $<
rtfind_dats.il: rtfind_dats.ilpp ; \
$(ILPP) $< $@
rtfind_dats.exe: rtfind_dats.il ; \
$(ILASM) /output:$@ $<
rtfind:: rtfind_dats.exe ; $(MONO) rtfind_dats.exe
regress:: rtfind
cleanall:: ; $(RMF) rtfind_dats.exe rtfind_dats.il rtfind_dats.ilpp rtfind_dats.c

######

all:: \
rtfind2_dats.exe
rtfind2_dats.c: rtfind2.dats ; \
$(PATSOPT) --output $@ --dynamic $<
rtfind2_dats.ilpp: rtfind2_dats.c ; \
$(ATSPAREMIT) -n 'Postiats' -o $@ -i $<
rtfind2_dats.il: rtfind2_dats.ilpp ; \
$(ILPP) $< $@
rtfind2_dats.exe: rtfind2_dats.il ; \
$(ILASM) /output:$@ $<
rtfind2:: rtfind2_dats.exe ; $(MONO) rtfind2_dats.exe
regress:: rtfind2
cleanall:: ; $(RMF) rtfind2_dats.exe rtfind2_dats.il rtfind2_dats.ilpp rtfind2_dats.c

