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
$(PATSOPT) -d ./DATS/list.dats | \
$(ATSCC2PL) -o ./output/DATS/list_dats.pl -i
all:: ; \
$(PATSOPT) -d ./DATS/option.dats | \
$(ATSCC2PL) -o ./output/DATS/option_dats.pl -i
all:: ; \
$(PATSOPT) -d ./DATS/stream.dats | \
$(ATSCC2PL) -o ./output/DATS/stream_dats.pl -i
all:: ; \
$(PATSOPT) -d ./DATS/stream_vt.dats | \
$(ATSCC2PL) -o ./output/DATS/stream_vt_dats.pl -i
all:: ; \
$(PATSOPT) -d ./DATS/intrange.dats | \
$(ATSCC2PL) -o ./output/DATS/intrange_dats.pl -i
all:: ; \
$(PATSOPT) -d ./DATS/reference.dats | \
$(ATSCC2PL) -o ./output/DATS/reference_dats.pl -i

######
#
all:: ; \
$(PATSOPT) -d ./DATS/ML/list0.dats | \
$(ATSCC2PL) -o ./output/DATS/ML/list0_dats.pl -i
all:: ; \
$(PATSOPT) -d ./DATS/ML/array0.dats | \
$(ATSCC2PL) -o ./output/DATS/ML/array0_dats.pl -i
#
######
#
DATE=/bin/date
ECHO=/bin/echo -en
#
all_in_one:: ; $(ECHO) | $(CAT) - >libatscc2pl_all.pl
#
all_in_one:: ; $(ECHO) '######\n' | $(CAT) - >>libatscc2pl_all.pl
all_in_one:: ; $(ECHO) '#\n' | $(CAT) - >>libatscc2pl_all.pl
all_in_one:: ; \
  $(ECHO) '# Time of Generation:\n' | $(CAT) - >>libatscc2pl_all.pl
all_in_one:: ; \
  ($(ECHO) '# ' | $(CAT) - >>libatscc2pl_all.pl; $(DATE) | $(CAT) - >>libatscc2pl_all.pl)
all_in_one:: ; $(ECHO) '#\n' | $(CAT) - >>libatscc2pl_all.pl
all_in_one:: ; $(ECHO) '######\n\n' | $(CAT) - >>libatscc2pl_all.pl
#
######

all_in_one:: ; \
$(CAT) >>libatscc2pl_all.pl \
CATS/basics_cats.pl \
CATS/integer_cats.pl \
CATS/bool_cats.pl \
CATS/float_cats.pl \
CATS/string_cats.pl \
CATS/print_cats.pl \
CATS/PLarray_cats.pl \

all_in_one:: ; \
$(CAT) >>libatscc2pl_all.pl \
output/DATS/list_dats.pl \
output/DATS/option_dats.pl \
output/DATS/stream_dats.pl \
output/DATS/stream_vt_dats.pl \
output/DATS/intrange_dats.pl \
output/DATS/reference_dats.pl \
output/DATS/ML/list0_dats.pl \
output/DATS/ML/array0_dats.pl \

######
#
all_in_one:: ; $(ECHO) '\n' | $(CAT) - >>libatscc2pl_all.pl
all_in_one:: ; $(ECHO) '## ###### ###### ##' | $(CAT) - >>libatscc2pl_all.pl
all_in_one:: ; $(ECHO) '\n' | $(CAT) - >>libatscc2pl_all.pl
#
all_in_one:: ; \
  $(ECHO) '\n## end of [libatscc2pl_all.pl] ##\n' | $(CAT) - >>libatscc2pl_all.pl
#
######

clean:: ; $(RMF) *~ */*~

######

cleanall:: clean
cleanall:: ; $(RMF) libatscc2pl_all.pl

######

###### end of [Makefile] ######
