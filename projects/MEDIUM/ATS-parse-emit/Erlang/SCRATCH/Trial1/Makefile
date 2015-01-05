#
# A simple Makefile
#
######

ERLCOMP=erl -compile

######

scratch02: \
session.beam \
scratch02.beam

######

scratch07: \
session.beam \
myservice_ints.beam \
myservice_ints_filter.beam \
myservice_primes.beam \
scratch07.beam

######

scratch08: \
session.beam \
myservice_int2bits.beam \
scratch08.beam

######

%.beam: %.erl; $(ERLCOMP) $<

######

RMF=rm -f

######

clean:: ; $(RMF) *~

######

cleanall:: clean
cleanall:: ; $(RMF) *.beam

###### end of [Makefile] ######