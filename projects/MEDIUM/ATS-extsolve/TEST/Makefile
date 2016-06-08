#
# A simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

PATSOLVE=./../patsolve

######
#
all:: \
fact_dats.cnstr
#
fact_dats.cnstr: fact.dats; \
  $(PATSOPT) -tc --constraint-export -o $@ -d $<
#
regress:: \
fact_dats.cnstr; $(PATSOLVE) -i $<
#
cleanall:: ; $(RMF) fact_dats.cnstr
#
######

testall:: all
testall:: regress
testall:: cleanall

######

RMF=rm -f

######

clean:: ; $(RMF) *~

######

cleanall:: clean

######

###### end of [Makefile] ######
