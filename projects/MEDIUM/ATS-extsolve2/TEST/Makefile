#
# A simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######
#
all:: \
fact_dats.cnstr
fact_dats.cnstr: \
fact.dats; $(PATSOPT) -tc --constraint-export -o $@ -d $<
#
cleanall:: ; $(RMF) fact_dats.cnstr
#
######
#
all:: \
fact2_dats.cnstr
fact2_dats.cnstr: \
fact2.dats; $(PATSOPT) -tc --constraint-export -o $@ -d $<
#
cleanall:: ; $(RMF) fact2_dats.cnstr
#
######

RMF=rm -f

######

clean:: ; $(RMF) *~

######

cleanall:: clean

######

###### end of [Makefile] ######