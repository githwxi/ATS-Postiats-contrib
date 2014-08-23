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
f91_dats.js
f91_dats.js: f91.dats ; \
$(PATSOPT) -d $< | $(ATSPAREMIT) -o $@
f91:: f91_dats.js ; $(NODEJS) f91_dats.js
regress:: f91
cleanall:: ; $(RMF) f91_dats.js

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

clean:: ; $(RMF) *~

######

cleanall:: clean
cleanall:: ; $(RMF) *_?ats.c

###### end of [Makefile] ######
