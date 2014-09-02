#
# A Simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

ATSCC2JS=./../atscc2php

######

all::
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
fibats_dats.php
fibats_dats.php: fibats.dats ; \
$(PATSOPT) -d $< | $(ATSCC2JS) -o $@
cleanall:: ; $(RMF) fibats_dats.php

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

all:: \
twice_dats.php
twice_dats.php: twice.dats ; \
$(PATSOPT) -d $< | $(ATSCC2JS) -o $@
cleanall:: ; $(RMF) twice_dats.php

######

all:: \
rtfind_dats.php
rtfind_dats.php: rtfind.dats ; \
$(PATSOPT) -d $< | $(ATSCC2JS) -o $@
cleanall:: ; $(RMF) rtfind_dats.php

######

all:: \
rtfind2_dats.php
rtfind2_dats.php: rtfind2.dats ; \
$(PATSOPT) -d $< | $(ATSCC2JS) -o $@
cleanall:: ; $(RMF) rtfind2_dats.php

######

all:: mytest
mytest:: mytest.php; php -f mytest.php

######

CPRF=cp -rf

######

libupdate: ; \
$(CPRF) $(PATSHOME_contrib)/contrib/libatscc2php/CATS/* ./libatscc2php/CATS

######

clean:: ; $(RMF) *~

######

cleanall:: clean
cleanall:: ; $(RMF) *_?ats.c

###### end of [Makefile] ######
