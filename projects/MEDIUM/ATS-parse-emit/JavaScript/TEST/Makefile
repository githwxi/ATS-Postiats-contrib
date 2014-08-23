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
fact:: fact_dats.js ; $(NODEJS) fact_dats.js 10
regress:: fact
cleanall:: ; $(RMF) fact_dats.js

######

all:: \
fact2_dats.js
fact2_dats.js: fact2.dats ; \
$(PATSOPT) -d $< | $(ATSPAREMIT) -o $@
fact2:: fact2_dats.js ; $(NODEJS) fact2_dats.js 10
regress:: fact2
cleanall:: ; $(RMF) fact2_dats.js

######

all:: \
acker_dats.js
acker_dats.js: acker.dats ; \
$(PATSOPT) -d $< | $(ATSPAREMIT) -o $@
acker:: acker_dats.js ; $(NODEJS) acker_dats.js 3 3
regress:: acker
cleanall:: ; $(RMF) acker_dats.js

######

all:: \
isevn_dats.js
isevn_dats.js: isevn.dats ; \
$(PATSOPT) -d $< | $(ATSPAREMIT) -o $@
isevn:: isevn_dats.js ; $(NODEJS) isevn_dats.js 100
regress:: isevn
cleanall:: ; $(RMF) isevn_dats.js

######

clean:: ; $(RMF) *~

######

cleanall:: clean
cleanall:: ; $(RMF) *_?ats.c

###### end of [Makefile] ######
