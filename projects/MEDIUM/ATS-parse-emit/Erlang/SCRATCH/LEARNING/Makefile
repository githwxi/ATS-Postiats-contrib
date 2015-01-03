#
# A simple Makefile
#
######

ERLCOMP=erl -compile

######

RMF=rm -f

######

scratch02: \
session.beam \
scratch02.beam

scratch07: \
session.beam \
myservice_ints.beam \
myservice_ints_filter.beam \
myservice_primes.beam \
scratch07.beam

######

%.beam: %.erl; $(ERLCOMP) $<

######

clean:: ; $(RMF) *~

######

cleanall:: clean
cleanall:: ; $(RMF) *.beam

###### end of [Makefile] ######