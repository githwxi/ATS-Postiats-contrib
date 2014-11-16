#
# For generating libatscc2pl
#

######

PATSOPT=$(PATSHOME)/bin/patsopt
ATSCC2PL=$(PATSHOME)/bin/atscc2pl

######

CAT=cat
CPF=cp -f
RMF=rm -f

######

all_in_one:: ; \
$(CAT) >libatscc2pl_all.pl \
CATS/basics_cats.pl \
CATS/integer_cats.pl \

#######

clean:: ; $(RMF) *~ */*~

#######

cleanall:: clean
cleanall:: ; $(RMF) libatscc2pl_all.pl

#######

###### end of [Makefile] ######
