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

all:: ; \
$(PATSOPT) -d ./DATS/list.dats | $(ATSCC2PL) -o ./output/DATS/list_dats.pl -i
all:: ; \
$(PATSOPT) -d ./DATS/stream.dats | $(ATSCC2PL) -o ./output/DATS/stream_dats.pl -i
all:: ; \
$(PATSOPT) -d ./DATS/intrange.dats | $(ATSCC2PL) -o ./output/DATS/intrange_dats.pl -i

######

all_in_one:: ; \
$(CAT) >libatscc2pl_all.pl \
CATS/basics_cats.pl \
CATS/integer_cats.pl \
CATS/bool_cats.pl \
CATS/float_cats.pl \
CATS/string_cats.pl \
CATS/print_cats.pl \
CATS/PLarray_cats.pl \
output/DATS/list_dats.pl \
output/DATS/stream_dats.pl \
output/DATS/intrange_dats.pl \

#######

clean:: ; $(RMF) *~ */*~

#######

cleanall:: clean
cleanall:: ; $(RMF) libatscc2pl_all.pl

#######

###### end of [Makefile] ######
