#
# A simple Makefile
#

######
#
PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
#
PATSOLVE=$(PATSHOME)/bin/patsolve_z3
#
######
#
all:: fact
#
fact:: fact.dats; $(PATSCC) --constraint-ignore -o $@ $<
#
fact:: \
fact.dats; \
$(PATSOPT) -tc --constraint-export -d $< | $(PATSOLVE) -i
#
regress: fact; ./fact 10
#
cleanall:: ; $(RMF) fact
#
######

testall:: all
testall:: regress
testall:: cleanall

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c

######

cleanall:: clean

######

###### end of [Makefile] ######