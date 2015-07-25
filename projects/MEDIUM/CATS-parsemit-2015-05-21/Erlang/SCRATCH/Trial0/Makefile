#
# A simple Makefile
#
######

ERLCOMP=erl -compile

######

RMF=rm -f

######

all:: echo
all:: test01
all:: test02

######

echo: echo.beam
test01: test01.beam
test02: test02.beam

######

%.beam: %.erl; $(ERLCOMP) $<

######

clean:: ; $(RMF) *~

######

cleanall:: clean
cleanall:: ; $(RMF) *.beam

###### end of [Makefile] ######