#
# A simple Makefile
#
######

PATSCC=${PATSHOME}/bin/patscc
PATSOPT=${PATSHOME}/bin/patsopt
PATSOPT2=$(PATSOPT) --tlcalopt-disable
ATSCC2ERL=${PATSHOME}/bin/atscc2erl

######

ERL=erl

######

all::

######

all:: \
test01_dats.erl
test01_dats.c: test01.dats; $(PATSOPT2) -o $@ -d $<
test01_dats.erl: test01_dats.c; $(ATSCC2ERL) -o $@ -i $<
test01_dats.beam:: test01_dats.erl ; $(ERL) -compile $<
regress:: \
regress_test01
regress_test01:: \
test01_dats.beam; $(ERL) -run test01_dats main0_erl -run init stop -noshell
cleanall:: ; $(RMF) test01_dats.erl

######

all:: \
test02_dats.erl
test02_dats.c: test02.dats; $(PATSOPT2) -o $@ -d $<
test02_dats.erl: test02_dats.c; $(ATSCC2ERL) -o $@ -i $<
test02_dats.beam:: test02_dats.erl ; $(ERL) -compile $< 
regress:: \
regress_test02
regress_test02:: \
test02_dats.beam; $(ERL) -run test02_dats main0_erl -run init stop -noshell
cleanall:: ; $(RMF) test02_dats.erl

######

all:: \
test03_dats.erl
test03_dats.c: test03.dats; $(PATSOPT2) -o $@ -d $<
test03_dats.erl: test03_dats.c; $(ATSCC2ERL) -o $@ -i $<
test03_dats.beam:: test03_dats.erl ; $(ERL) -compile $< 
regress:: \
regress_test03
regress_test03:: \
test03_dats.beam; $(ERL) -run test03_dats main0_erl -run init stop -noshell
cleanall:: ; $(RMF) test03_dats.erl
cleanall:: ; $(RMF) test03_dats_.erl

######

testall:: all
testall:: regress
testall:: cleanall

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c
cleanall:: ; $(RMF) *_?ats.beam
cleanall:: ; $(RMF) erl_crash.dump

######

cleanall:: clean

######

###### end of [Makefile] ######
