#
# A simple Makefile
#

###### beg of [Makefile] ######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

test01: \
test01.dats; \
$(PATSCC) --constraint-ignore -o $@ $< -lm
regress:: test01; ./$<
cleanall:: ; rm -f test01

######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.o
clean:: ; rm -f *_?ats.c

######

cleanall:: clean

###### end of [Makefile] ######
