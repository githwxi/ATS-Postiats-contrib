#
# A Simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

ATSPAREMIT=./../atsparemit

######

all::
regress::
cleanall::

######

RMF=rm -f
RMRF=rm -rf

######

all:: \
fact_dats.py
fact_dats.py: \
fact.dats ; $(PATSOPT) -d $< | $(ATSPAREMIT) > $@
regress:: fact_dats.py ; python3 fact_dats.py 10
cleanall:: ; $(RMF) fact_dats.py

######

all:: \
fact2_dats.py
fact2_dats.py: \
fact2.dats ; $(PATSOPT) -d $< | $(ATSPAREMIT) > $@
regress:: fact2_dats.py ; python3 fact2_dats.py 10
cleanall:: ; $(RMF) fact2_dats.py

######

all:: \
f91_dats.py
f91_dats.py: f91.dats ; $(PATSOPT) -d $< | $(ATSPAREMIT) > $@
regress:: f91_dats.py ; python3 f91_dats.py 23
cleanall:: ; $(RMF) f91_dats.py

######

all:: \
fib_dats.py
fib_dats.py: fib.dats ; $(PATSOPT) -d $< | $(ATSPAREMIT) > $@
regress:: fib_dats.py ; python3 fib_dats.py 100
cleanall:: ; $(RMF) fib_dats.py

######

all:: \
fibats_dats.py
fibats_dats.py: \
fibats.dats ; $(PATSOPT) -d $< | $(ATSPAREMIT) > $@
regress:: fibats_dats.py ; python3 fibats_dats.py 100
cleanall:: ; $(RMF) fibats_dats.py

######

all:: \
acker_dats.py
acker_dats.py: \
acker.dats ; $(PATSOPT) -d $< | $(ATSPAREMIT) > $@
regress:: acker_dats.py ; python3 acker_dats.py 3 3
cleanall:: ; $(RMF) acker_dats.py

######

all:: \
isevn_dats.py
isevn_dats.py: \
isevn.dats ; \
$(PATSOPT) -d $< | $(ATSPAREMIT) > $@
regress:: isevn_dats.py ; python3 isevn_dats.py 100
cleanall:: ; $(RMF) isevn_dats.py

######

all:: \
rtfind_dats.py
rtfind_dats.py: \
rtfind.dats ; \
$(PATSOPT) -d $< | $(ATSPAREMIT) > $@
regress:: rtfind_dats.py ; python3 rtfind_dats.py
cleanall:: ; $(RMF) rtfind_dats.py

######

all:: \
rtfind2_dats.py
rtfind2_dats.py: \
rtfind2.dats ; \
$(PATSOPT) -d $< | $(ATSPAREMIT) > $@
regress:: rtfind2_dats.py ; python3 rtfind2_dats.py
cleanall:: ; $(RMF) rtfind2_dats.py

######

all:: \
listlen_dats.py
listlen_dats.py: \
listlen.dats ; \
$(PATSOPT) -d $< | $(ATSPAREMIT) > $@
regress:: listlen_dats.py ; python3 listlen_dats.py
cleanall:: ; $(RMF) listlen_dats.py

######

all:: \
listmap_dats.py
listmap_dats.py: \
listmap.dats ; \
$(PATSOPT) -d $< | $(ATSPAREMIT) > $@
regress:: listmap_dats.py ; python3 listmap_dats.py
cleanall:: ; $(RMF) listmap_dats.py

######

all:: \
pylist_test_dats.py
pylist_test_dats.py: \
pylist_test.dats ; \
$(PATSOPT) -d $< | $(ATSPAREMIT) > $@
regress:: pylist_test_dats.py ; python3 pylist_test_dats.py
cleanall:: ; $(RMF) pylist_test_dats.py

######

all:: \
twice_dats.py
twice_dats.py: \
twice.dats ; \
$(PATSOPT) -d $< | $(ATSPAREMIT) > $@
regress:: twice_dats.py ; python3 twice_dats.py
cleanall:: ; $(RMF) twice_dats.py

######

all:: \
queens_dats.py
queens_dats.py: \
queens.dats ; \
$(PATSOPT) -d $< | $(ATSPAREMIT) > $@
regress:: queens_dats.py ; python3 queens_dats.py
cleanall:: ; $(RMF) queens_dats.py

######

clean:: ; $(RMF) *~

######

cleanall:: clean
cleanall:: ; $(RMF) *_?ats.c
cleanall:: ; $(RMF) *_?ats.pyc
cleanall:: ; $(RMRF) __pycache__

###### end of [Makefile] ######
