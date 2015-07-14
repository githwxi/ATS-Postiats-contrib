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
regress:: test01_dats.beam; $(ERL) -run test01_dats main0_erl -run init stop -noshell

######

all:: \
test02_dats.erl
test02_dats.c: test02.dats; $(PATSOPT2) -o $@ -d $<
test02_dats.erl: test02_dats.c; $(ATSCC2ERL) -o $@ -i $<
test02_dats.beam:: test02_dats.erl ; $(ERL) -compile $< 
regress:: test02_dats.beam; $(ERL) -run test02_dats main0_erl -run init stop -noshell

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c
cleanall:: ; $(RMF) *_?ats.beam

######

cleanall:: clean
cleanall:: ; $(RMF) *_?ats.erl

######

###### end of [Makefile] ######
