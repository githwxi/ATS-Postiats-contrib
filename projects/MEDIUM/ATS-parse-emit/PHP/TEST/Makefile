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
cleanall:: ; $(RMF) fact_dats.js

######

clean:: ; $(RMF) *~

######

cleanall:: clean
cleanall:: ; $(RMF) *_?ats.c

###### end of [Makefile] ######
