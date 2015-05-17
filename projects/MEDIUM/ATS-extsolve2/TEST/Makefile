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
######

RMF=rm -f

######

clean:: ; $(RMF) *~

######

cleanall:: clean
cleanall:: ; $(RMF) fact_dats.cnstr

######

###### end of [Makefile] ######