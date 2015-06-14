#
# A simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######
#
all:: \
gflist_dats.cnstr
gflist_dats.cnstr: \
gflist.dats; $(PATSOPT) -tc --constraint-export -o $@ -d $<
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