#
# For generating libatscc2clj
#

######

PATSOPT=$(PATSHOME)/bin/patsopt
ATSCC2CLJ=$(PATSHOME)/bin/atscc2clj

######

CAT=cat
CPF=cp -f
RMF=rm -f
SCPR=scp -r

######

all::
all_in_one::

######
#
all:: ; \
$(PATSOPT) -d ./DATS/basics.dats | \
$(ATSCC2CLJ) -o ./output/DATS/basics_dats.clj -i
#
all:: ; \
$(PATSOPT) -d ./DATS/list.dats | \
$(ATSCC2CLJ) -o ./output/DATS/list_dats.clj -i
all:: ; \
$(PATSOPT) -d ./DATS/option.dats | \
$(ATSCC2CLJ) -o ./output/DATS/option_dats.clj -i
#
all:: ; \
$(PATSOPT) -d ./DATS/stream.dats | \
$(ATSCC2CLJ) -o ./output/DATS/stream_dats.clj -i
all:: ; \
$(PATSOPT) -d ./DATS/stream_vt.dats | \
$(ATSCC2CLJ) -o ./output/DATS/stream_vt_dats.clj -i
#
all:: ; \
$(PATSOPT) -d ./DATS/intrange.dats | \
$(ATSCC2CLJ) -o ./output/DATS/intrange_dats.clj -i
#
######
#
all:: ; \
$(PATSOPT) -d ./DATS/slistref.dats | \
$(ATSCC2CLJ) -o ./output/DATS/slistref_dats.clj -i
#
all:: ; \
$(PATSOPT) -d ./DATS/qlistref.dats | \
$(ATSCC2CLJ) -o ./output/DATS/qlistref_dats.clj -i
#
######
#
all:: ; \
$(PATSOPT) -d ./DATS/ML/list0.dats | \
$(ATSCC2CLJ) -o ./output/DATS/ML/list0_dats.clj -i
#
######

all_in_one:: libatscc2clj_all

######
#
DATE=/bin/date
ECHO=/bin/echo -en
#
libatscc2clj_all:: ; \
$(ECHO) | $(CAT) - >libatscc2clj_all.clj
libatscc2clj_all:: ; \
$(ECHO) ';;\n' | $(CAT) - >>libatscc2clj_all.clj
libatscc2clj_all:: ; \
$(ECHO) ';; Time of Generation:\n' | $(CAT) - >>libatscc2clj_all.clj
libatscc2clj_all:: ; \
$(ECHO) ';; ' | $(CAT) - >>libatscc2clj_all.clj && $(DATE) | $(CAT) - >>libatscc2clj_all.clj
libatscc2clj_all:: ; \
$(ECHO) ';;\n\n' | $(CAT) - >>libatscc2clj_all.clj
#
libatscc2clj_all:: ; \
$(CAT) >>libatscc2clj_all.clj \
CATS/basics_cats.clj \
CATS/integer_cats.clj \
CATS/bool_cats.clj \
CATS/float_cats.clj \
CATS/print_cats.clj \
CATS/reference_cats.clj
#
libatscc2clj_all:: ; \
$(CAT) >>libatscc2clj_all.clj \
CATS/filebas_cats.clj
#
libatscc2clj_all:: ; \
$(CAT) >>libatscc2clj_all.clj \
CATS/CLJlist_cats.clj
#
libatscc2clj_all:: ; \
$(CAT) >>libatscc2clj_all.clj \
output/DATS/list_dats.clj \
output/DATS/option_dats.clj \
output/DATS/stream_dats.clj \
output/DATS/stream_vt_dats.clj \
output/DATS/intrange_dats.clj \
output/DATS/ML/list0_dats.clj
#
libatscc2clj_all:: ; \
$(ECHO) '\n;; ****** ****** ;;\n' | $(CAT) - >>libatscc2clj_all.clj
libatscc2clj_all:: ; \
$(ECHO) '\n;; end of [libatscc2clj_all.clj] ;;\n' | $(CAT) - >>libatscc2clj_all.clj
#
######
#
upload_source:: ; \
$(SCPR) \
basics_clj.sats \
staloadall.hats \
CATS SATS DATS \
ats-hwxi,ats-lang@web.sourceforge.net:htdocs/LIBRARY/contrib/libatscc/libatscc2clj/.
#
upload_libatscc2clj:: ; \
$(SCPR) \
libatscc2clj_all.clj \
ats-hwxi,ats-lang@web.sourceforge.net:htdocs/LIBRARY/contrib/libatscc/libatscc2clj/.
#
######

clean:: ; $(RMF) *~ */*~

######

cleanall:: clean
cleanall:: ; $(RMF) libatscc2clj_all.clj

######

###### end of [Makefile] ######
