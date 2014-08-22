#
# A Simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

ATSPAREMIT=./../atsparemit_js

######

JAVASCRIPT=javascript

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
fact:: fact_dats.js ; $(JAVASCRIPT) fact_dats.js 10
regress:: fact
cleanall:: ; $(RMF) fact_dats.js

######

all:: \
acker_dats.js
acker_dats.js: acker.dats ; \
$(PATSOPT) -d $< | $(ATSPAREMIT) -o $@
acker:: acker_dats.js ; $(JAVASCRIPT) acker_dats.js 3 3
regress:: acker
cleanall:: ; $(RMF) acker_dats.js

######

clean:: ; $(RMF) *~

######

cleanall:: clean
cleanall:: ; $(RMF) *_?ats.c
cleanall:: ; $(RMF) *_?ats.pyc

###### end of [Makefile] ######
