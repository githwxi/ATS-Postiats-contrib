#
# A Simple Makefile
#

######

NODEJS=nodejs

######

ATSCC2JS=./../atscc2js

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

all::
regress::
cleanall::

######

RMF=rm -f
RMRF=rm -rf

######

all:: \
fact_dats.js
fact_dats.js: fact.dats ; \
$(PATSOPT) -d $< | $(ATSCC2JS) -o $@
fact:: fact_dats.js ; $(NODEJS) fact_dats.js
regress:: fact
cleanall:: ; $(RMF) fact_dats.js

######

all:: \
fact2_dats.js
fact2_dats.js: fact2.dats ; \
$(PATSOPT) -d $< | $(ATSCC2JS) -o $@
fact2:: fact2_dats.js ; $(NODEJS) fact2_dats.js
regress:: fact2
cleanall:: ; $(RMF) fact2_dats.js

######

all:: \
f91_dats.js
f91_dats.js: \
f91.dats ; $(PATSOPT) -d $< | $(ATSCC2JS) -o $@
f91:: f91_dats.js ; $(NODEJS) f91_dats.js 23
regress:: f91
cleanall:: ; $(RMF) f91_dats.js

######

all:: \
fib_dats.js
fib_dats.js: \
fib.dats ; $(PATSOPT) -d $< | $(ATSCC2JS) -o $@
fib:: fib_dats.js ; $(NODEJS) fib_dats.js
regress:: fib
cleanall:: ; $(RMF) fib_dats.js

######

all:: \
fibats_dats.js
fibats_dats.js: fibats.dats ; \
$(PATSOPT) -d $< | $(ATSCC2JS) -o $@
fibats:: fibats_dats.js ; $(NODEJS) fibats_dats.js 20
regress:: fibats
cleanall:: ; $(RMF) fibats_dats.js

######

all:: \
acker_dats.js
acker_dats.js: acker.dats ; \
$(PATSOPT) -d $< | $(ATSCC2JS) -o $@
acker:: acker_dats.js ; $(NODEJS) acker_dats.js 3 3
regress:: acker
cleanall:: ; $(RMF) acker_dats.js

######

all:: \
isevn_dats.js
isevn_dats.js: isevn.dats ; \
$(PATSOPT) -d $< | $(ATSCC2JS) -o $@
isevn:: isevn_dats.js ; $(NODEJS) isevn_dats.js
regress:: isevn
cleanall:: ; $(RMF) isevn_dats.js

######

all:: \
rtfind_dats.js
rtfind_dats.js: rtfind.dats ; \
$(PATSOPT) -d $< | $(ATSCC2JS) -o $@
rtfind:: rtfind_dats.js ; $(NODEJS) rtfind_dats.js
regress:: rtfind
cleanall:: ; $(RMF) rtfind_dats.js

######

all:: \
rtfind2_dats.js
rtfind2_dats.js: rtfind2.dats ; \
$(PATSOPT) -d $< | $(ATSCC2JS) -o $@
rtfind2:: rtfind2_dats.js ; $(NODEJS) rtfind2_dats.js
regress:: rtfind2
cleanall:: ; $(RMF) rtfind2_dats.js

######

all:: \
listlen_dats.js
listlen_dats.js: listlen.dats ; \
$(PATSOPT) -d $< | $(ATSCC2JS) -o $@
listlen:: listlen_dats.js ; $(NODEJS) listlen_dats.js
regress:: listlen
cleanall:: ; $(RMF) listlen_dats.js

######

all:: \
listmap_dats.js
listmap_dats.js: listmap.dats ; \
$(PATSOPT) -d $< | $(ATSCC2JS) -o $@
listmap:: listmap_dats.js ; $(NODEJS) listmap_dats.js
regress:: listmap
cleanall:: ; $(RMF) listmap_dats.js

######

all:: \
twice_dats.js
twice_dats.js: twice.dats ; \
$(PATSOPT) -d $< | $(ATSCC2JS) -o $@
twice:: twice_dats.js ; $(NODEJS) twice_dats.js
regress:: twice
cleanall:: ; $(RMF) twice_dats.js

######

all:: \
F-algebra_dats.js
F-algebra_dats.js: F-algebra.dats ; \
$(PATSOPT) -d $< | $(ATSCC2JS) -o $@
F-algebra:: F-algebra_dats.js ; $(NODEJS) F-algebra_dats.js
regress:: F-algebra
cleanall:: ; $(RMF) F-algebra_dats.js

######

all:: \
queens_dats.js
queens_dats.js: queens.dats ; \
$(PATSOPT) -d $< | $(ATSCC2JS) -o $@
queens:: queens_dats.js ; $(NODEJS) queens_dats.js
regress:: queens
cleanall:: ; $(RMF) queens_dats.js

######

all:: \
mergesort_dats.js
mergesort_dats.js: mergesort.dats ; \
$(PATSOPT) -d $< | $(ATSCC2JS) -o $@
mergesort:: mergesort_dats.js ; $(NODEJS) mergesort_dats.js
regress:: mergesort
cleanall:: ; $(RMF) mergesort_dats.js

######

all:: \
sieve_lazy_dats.js
sieve_lazy_dats.js: sieve_lazy.dats ; \
$(PATSOPT) -d $< | $(ATSCC2JS) -o $@
sieve_lazy:: sieve_lazy_dats.js ; $(NODEJS) sieve_lazy_dats.js
regress:: sieve_lazy
cleanall:: ; $(RMF) sieve_lazy_dats.js

######

all:: \
hello_dats.js
hello_dats.c: \
hello.dats ; $(PATSOPT) -o $@ -d $<
hello_dats.js: \
hello_dats.c ; $(ATSCC2JS) -o $@ -i $<
hello:: hello_dats.js ; $(NODEJS) hello_dats.js
regress:: hello
cleanall:: ; $(RMF) hello_dats.js

######

all:: \
process_test_dats.js
process_test_dats.c: \
process_test.dats ; $(PATSOPT) -o $@ -d $<
process_test_dats.js: \
process_test_dats.c ; $(ATSCC2JS) -o $@ -i $<
process_test:: process_test_dats.js ; $(NODEJS) process_test_dats.js
regress:: process_test
cleanall:: ; $(RMF) process_test_dats.js

######

CPRF=cp -rf

######
#
libatscc2js:: ; \
$(CPRF) $(PATSHOME_contrib)/contrib/libatscc/libatscc2js/CATS/* libatscc2js/CATS/.
libatscc2js:: ; \
$(CPRF) $(PATSHOME_contrib)/contrib/libatscc/libatscc2js/output/DATS/* libatscc2js/DATS/.
#
######

clean:: ; $(RMF) *~

######

cleanall:: clean
cleanall:: ; $(RMF) *_?ats.c

###### end of [Makefile] ######
