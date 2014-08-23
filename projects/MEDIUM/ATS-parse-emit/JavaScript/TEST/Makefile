#
# A Simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

ATSPAREMIT=./../atsparemit_js

######

NODEJS=node

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
$(PATSOPT) -d $< | $(ATSPAREMIT) -o $@
fact:: fact_dats.js ; $(NODEJS) fact_dats.js
regress:: fact
cleanall:: ; $(RMF) fact_dats.js

######

all:: \
fact2_dats.js
fact2_dats.js: fact2.dats ; \
$(PATSOPT) -d $< | $(ATSPAREMIT) -o $@
fact2:: fact2_dats.js ; $(NODEJS) fact2_dats.js
regress:: fact2
cleanall:: ; $(RMF) fact2_dats.js

######

all:: \
f91_dats.js
f91_dats.js: f91.dats ; \
$(PATSOPT) -d $< | $(ATSPAREMIT) -o $@
f91:: f91_dats.js ; $(NODEJS) f91_dats.js
regress:: f91
cleanall:: ; $(RMF) f91_dats.js

######

all:: \
fib_dats.js
fib_dats.js: fib.dats ; \
$(PATSOPT) -d $< | $(ATSPAREMIT) -o $@
fib:: fib_dats.js ; $(NODEJS) fib_dats.js 100
regress:: fib
cleanall:: ; $(RMF) fib_dats.js

######

all:: \
fibats_dats.js
fibats_dats.js: fibats.dats ; \
$(PATSOPT) -d $< | $(ATSPAREMIT) -o $@
fibats:: fibats_dats.js ; $(NODEJS) fibats_dats.js
regress:: fibats
cleanall:: ; $(RMF) fibats_dats.js

######

all:: \
acker_dats.js
acker_dats.js: acker.dats ; \
$(PATSOPT) -d $< | $(ATSPAREMIT) -o $@
acker:: acker_dats.js ; $(NODEJS) acker_dats.js
regress:: acker
cleanall:: ; $(RMF) acker_dats.js

######

all:: \
isevn_dats.js
isevn_dats.js: isevn.dats ; \
$(PATSOPT) -d $< | $(ATSPAREMIT) -o $@
isevn:: isevn_dats.js ; $(NODEJS) isevn_dats.js
regress:: isevn
cleanall:: ; $(RMF) isevn_dats.js

######

all:: \
rtfind_dats.js
rtfind_dats.js: rtfind.dats ; \
$(PATSOPT) -d $< | $(ATSPAREMIT) -o $@
rtfind:: rtfind_dats.js ; $(NODEJS) rtfind_dats.js
regress:: rtfind
cleanall:: ; $(RMF) rtfind_dats.js

######

all:: \
rtfind2_dats.js
rtfind2_dats.js: rtfind2.dats ; \
$(PATSOPT) -d $< | $(ATSPAREMIT) -o $@
rtfind2:: rtfind2_dats.js ; $(NODEJS) rtfind2_dats.js
regress:: rtfind2
cleanall:: ; $(RMF) rtfind2_dats.js

######

all:: \
listlen_dats.js
listlen_dats.js: listlen.dats ; \
$(PATSOPT) -d $< | $(ATSPAREMIT) -o $@
listlen:: listlen_dats.js ; $(NODEJS) listlen_dats.js
regress:: listlen
cleanall:: ; $(RMF) listlen_dats.js

######

all:: \
listmap_dats.js
listmap_dats.js: listmap.dats ; \
$(PATSOPT) -d $< | $(ATSPAREMIT) -o $@
listmap:: listmap_dats.js ; $(NODEJS) listmap_dats.js
regress:: listmap
cleanall:: ; $(RMF) listmap_dats.js

######

all:: \
twice_dats.js
twice_dats.js: twice.dats ; \
$(PATSOPT) -d $< | $(ATSPAREMIT) -o $@
twice:: twice_dats.js ; $(NODEJS) twice_dats.js
regress:: twice
cleanall:: ; $(RMF) twice_dats.js

######

all:: \
queens_dats.js
queens_dats.js: queens.dats ; \
$(PATSOPT) -d $< | $(ATSPAREMIT) -o $@
queens:: queens_dats.js ; $(NODEJS) queens_dats.js
regress:: queens
cleanall:: ; $(RMF) queens_dats.js

######

clean:: ; $(RMF) *~

######

cleanall:: clean
cleanall:: ; $(RMF) *_?ats.c

###### end of [Makefile] ######
