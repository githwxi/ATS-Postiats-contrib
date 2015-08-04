#
# A simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

PATSOLVE=./../patsolve

######
#
all:: \
gflist_dats.cnstr
gflist_dats.cnstr: \
gflist.dats; $(PATSOPT) -tc --constraint-export -o $@ -d $<
#
regress:: \
gflist_dats.cnstr; $(PATSOLVE) -i $<
#
cleanall:: ; $(RMF) gflist_dats.cnstr
#
######

RMF=rm -f

######

clean:: ; $(RMF) *~

######

cleanall:: clean

######

###### end of [Makefile] ######