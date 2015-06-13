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
all:: fib
#
fib:: fib.dats; $(PATSCC) --constraint-ignore -o $@ $<
#
fib:: \
fib.dats; \
$(PATSOPT) -tc --constraint-export -d $< | $(PATSOLVE) -i
#
regress:: fib; ./fib 20
#
cleanall:: ; $(RMF) fib
#
######
#
all:: fib2
#
fib2:: fib2.dats; $(PATSCC) --constraint-ignore -o $@ $<
#
fib2:: \
fib2.dats; \
$(PATSOPT) -tc --constraint-export -d $< | $(PATSOLVE) -i
#
regress:: fib2; ./fib2 20
#
cleanall:: ; $(RMF) fib2
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
regress:: fact; ./fact 10
#
cleanall:: ; $(RMF) fact
#
######
#
all:: fact2
#
fact2:: fact2.dats; $(PATSCC) --constraint-ignore -o $@ $<
#
fact2:: \
fact2.dats; \
$(PATSOPT) -tc --constraint-export -d $< | $(PATSOLVE) -i
#
regress:: fact2; ./fact2 10
#
cleanall:: ; $(RMF) fact2
#
######

all:: \
palindrome
palindrome:: \
palindrome.dats; \
$(PATSOPT) -tc --constraint-export -d $< | $(PATSOLVE) -i

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