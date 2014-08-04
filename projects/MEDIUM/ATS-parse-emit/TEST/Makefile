#
# A Simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

RMF=rm -f

######

all::

######

all:: \
fact_dats.c
fact_dats.c: fact.dats ; $(PATSCC) -ccats -o $@ $<

######

all:: \
fact2_dats.c
fact2_dats.c: fact2.dats ; $(PATSCC) -ccats -o $@ $<

######

all:: \
fib_dats.c
fib_dats.c: fib.dats ; $(PATSCC) -ccats -o $@ $<

######

all:: \
fib2_dats.c
fib2_dats.c: fib2.dats ; $(PATSCC) -ccats -o $@ $<

######

all:: \
listlen_dats.c
listlen_dats.c: listlen.dats ; $(PATSCC) -ccats -o $@ $<

######

clean:: ; $(RMF) *~

######

cleanall:: clean
cleanall:: ; $(RMF) *_?ats.c

###### end of [Makefile] ######
