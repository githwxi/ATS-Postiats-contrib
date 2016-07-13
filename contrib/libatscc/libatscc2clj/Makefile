#
# For generating libatscc2clj
#

######

PATSOPT=$(PATSHOME)/bin/patsopt
PATSOPT2=$(PATSOPT) --tlcalopt-disable
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
$(PATSOPT2) -d ./DATS/basics.dats | \
$(ATSCC2CLJ) -o ./output/DATS/basics_dats.clj -i
#
all:: ; \
$(PATSOPT2) -d ./DATS/list.dats | \
$(ATSCC2CLJ) -o ./output/DATS/list_dats.clj -i
all:: ; \
$(PATSOPT2) -d ./DATS/option.dats | \
$(ATSCC2CLJ) -o ./output/DATS/option_dats.clj -i
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
