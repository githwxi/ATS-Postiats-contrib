#
# A Simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

ATSPAREMIT=./../atscc2py

######

PYTHON=python3

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
fact_dats.py: fact.dats ; \
$(PATSOPT) -d $< | $(ATSPAREMIT) -o $@
fact:: fact_dats.py ; $(PYTHON) fact_dats.py 10
regress:: fact
cleanall:: ; $(RMF) fact_dats.py

######

all:: \
fact2_dats.py
fact2_dats.py: fact2.dats ; \
$(PATSOPT) -d $< | $(ATSPAREMIT) -o $@
fact2:: fact2_dats.py ; $(PYTHON) fact2_dats.py 10
regress:: fact2
cleanall:: ; $(RMF) fact2_dats.py

######

all:: \
f91_dats.py
f91_dats.py: f91.dats ; \
$(PATSOPT) -d $< | $(ATSPAREMIT) -o $@
f91:: f91_dats.py ; $(PYTHON) f91_dats.py 23
regress:: f91
cleanall:: ; $(RMF) f91_dats.py

######

all:: \
fib_dats.py
fib_dats.py: fib.dats ; \
$(PATSOPT) -d $< | $(ATSPAREMIT) -o $@
fib:: fib_dats.py ; $(PYTHON) fib_dats.py 100
regress:: fib
cleanall:: ; $(RMF) fib_dats.py

######

all:: \
fibats_dats.py
fibats_dats.py: fibats.dats ; \
$(PATSOPT) -d $< | $(ATSPAREMIT) -o $@
fibats:: fibats_dats.py ; $(PYTHON) fibats_dats.py 100
regress:: fibats
cleanall:: ; $(RMF) fibats_dats.py

######

all:: \
acker_dats.py
acker_dats.py: acker.dats ; \
$(PATSOPT) -d $< | $(ATSPAREMIT) -o $@
acker:: acker_dats.py ; $(PYTHON) acker_dats.py 3 3
regress:: acker
cleanall:: ; $(RMF) acker_dats.py

######

all:: \
isevn_dats.py
isevn_dats.py: isevn.dats ; \
$(PATSOPT) -d $< | $(ATSPAREMIT) -o $@
isevn:: isevn_dats.py ; $(PYTHON) isevn_dats.py 100
regress:: isevn
cleanall:: ; $(RMF) isevn_dats.py

######

all:: \
rtfind_dats.py
rtfind_dats.py: rtfind.dats ; \
$(PATSOPT) -d $< | $(ATSPAREMIT) -o $@
rtfind:: rtfind_dats.py ; $(PYTHON) rtfind_dats.py
regress:: rtfind
cleanall:: ; $(RMF) rtfind_dats.py

######

all:: \
rtfind2_dats.py
rtfind2_dats.py: rtfind2.dats ; \
$(PATSOPT) -d $< | $(ATSPAREMIT) -o $@
rtfind2:: rtfind2_dats.py ; $(PYTHON) rtfind2_dats.py
regress:: rtfind2
cleanall:: ; $(RMF) rtfind2_dats.py

######

all:: \
listlen_dats.py
listlen_dats.py: listlen.dats ; \
$(PATSOPT) -d $< | $(ATSPAREMIT) -o $@
listlen:: listlen_dats.py ; $(PYTHON) listlen_dats.py
regress:: listlen
cleanall:: ; $(RMF) listlen_dats.py

######

all:: \
listmap_dats.py
listmap_dats.py: listmap.dats ; \
$(PATSOPT) -d $< | $(ATSPAREMIT) -o $@
listmap:: listmap_dats.py ; $(PYTHON) listmap_dats.py
regress:: listmap
cleanall:: ; $(RMF) listmap_dats.py

######

all:: \
twice_dats.py
twice_dats.py: twice.dats ; \
$(PATSOPT) -d $< | $(ATSPAREMIT) -o $@
twice:: twice_dats.py ; $(PYTHON) twice_dats.py
regress:: twice
cleanall:: ; $(RMF) twice_dats.py

######

all:: \
queens_dats.py
queens_dats.py: queens.dats ; \
$(PATSOPT) -d $< | $(ATSPAREMIT) -o $@
queens:: queens_dats.py ; $(PYTHON) queens_dats.py
regress:: queens
cleanall:: ; $(RMF) queens_dats.py

######

all:: \
pylist_test_dats.py
pylist_test_dats.py: pylist_test.dats ; \
$(PATSOPT) -d $< | $(ATSPAREMIT) -o $@ -i
pylist:: pylist_test_dats.py ; $(PYTHON) pylist_test_dats.py
regress:: pylist
cleanall:: ; $(RMF) pylist_test_dats.py

######

clean:: ; $(RMF) *~

######

cleanall:: clean
cleanall:: ; $(RMF) *_?ats.c
cleanall:: ; $(RMF) *_?ats.pyc
cleanall:: ; $(RMRF) __pycache__

###### end of [Makefile] ######
