#
# A Simple Makefile
#

######

NODEJS=node

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

ATSCC2JS=./../atscc2php

######

all::
regress::
cleanall::

######

RMF=rm -f
RMRF=rm -rf

######

all:: \
fact_dats.php
fact_dats.php: fact.dats ; \
$(PATSOPT) -d $< | $(ATSCC2JS) -o $@
cleanall:: ; $(RMF) fact_dats.php

######

all:: \
fact2_dats.php
fact2_dats.php: fact2.dats ; \
$(PATSOPT) -d $< | $(ATSCC2JS) -o $@
cleanall:: ; $(RMF) fact2_dats.php

######

all:: \
acker_dats.php
acker_dats.php: acker.dats ; \
$(PATSOPT) -d $< | $(ATSCC2JS) -o $@
cleanall:: ; $(RMF) acker_dats.php

######

all:: \
isevn_dats.php
isevn_dats.php: isevn.dats ; \
$(PATSOPT) -d $< | $(ATSCC2JS) -o $@
cleanall:: ; $(RMF) isevn_dats.php

######

clean:: ; $(RMF) *~

######

cleanall:: clean
cleanall:: ; $(RMF) *_?ats.c

###### end of [Makefile] ######
