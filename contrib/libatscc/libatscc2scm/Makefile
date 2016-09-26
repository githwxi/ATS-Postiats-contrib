#
# For generating libatscc2scm
#

######

PATSOPT=$(PATSHOME)/bin/patsopt
ATSCC2SCM=$(PATSHOME)/bin/atscc2scm

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
$(ATSCC2SCM) -o ./output/DATS/basics_dats.scm -i
#
all:: ; \
$(PATSOPT) -d ./DATS/list.dats | \
$(ATSCC2SCM) -o ./output/DATS/list_dats.scm -i
all:: ; \
$(PATSOPT) -d ./DATS/option.dats | \
$(ATSCC2SCM) -o ./output/DATS/option_dats.scm -i
#
all:: ; \
$(PATSOPT) -d ./DATS/stream.dats | \
$(ATSCC2SCM) -o ./output/DATS/stream_dats.scm -i
all:: ; \
$(PATSOPT) -d ./DATS/stream_vt.dats | \
$(ATSCC2SCM) -o ./output/DATS/stream_vt_dats.scm -i
#
all:: ; \
$(PATSOPT) -d ./DATS/reference.dats | \
$(ATSCC2SCM) -o ./output/DATS/reference_dats.scm -i
#
######
#
all:: ; \
$(PATSOPT) -d ./DATS/slistref.dats | \
$(ATSCC2SCM) -o ./output/DATS/slistref_dats.scm -i
#
all:: ; \
$(PATSOPT) -d ./DATS/qlistref.dats | \
$(ATSCC2SCM) -o ./output/DATS/qlistref_dats.scm -i
#
######

all_in_one:: libatscc2scm_all

######
#
DATE=/bin/date
ECHO=/bin/echo -en
#
libatscc2scm_all:: ; \
$(ECHO) | $(CAT) - >libatscc2scm_all.scm
libatscc2scm_all:: ; \
$(ECHO) ';;\n' | $(CAT) - >>libatscc2scm_all.scm
libatscc2scm_all:: ; \
$(ECHO) ';; Time of Generation:\n' | $(CAT) - >>libatscc2scm_all.scm
libatscc2scm_all:: ; \
$(ECHO) ';; ' | $(CAT) - >>libatscc2scm_all.scm && $(DATE) | $(CAT) - >>libatscc2scm_all.scm
libatscc2scm_all:: ; \
$(ECHO) ';;\n\n' | $(CAT) - >>libatscc2scm_all.scm
#
libatscc2scm_all:: ; \
$(CAT) >>libatscc2scm_all.scm \
CATS/basics_cats.scm \
CATS/integer_cats.scm \
CATS/bool_cats.scm \
CATS/float_cats.scm \
CATS/print_cats.scm \
CATS/reference_cats.scm
#
libatscc2scm_all:: ; \
$(CAT) >>libatscc2scm_all.scm \
CATS/filebas_cats.scm
#
libatscc2scm_all:: ; \
$(CAT) >>libatscc2scm_all.scm \
CATS/SCMlist_cats.scm
#
libatscc2scm_all:: ; \
$(CAT) >>libatscc2scm_all.scm \
output/DATS/list_dats.scm \
output/DATS/option_dats.scm \
output/DATS/stream_dats.scm \
output/DATS/stream_vt_dats.scm \
output/DATS/reference_dats.scm
#
libatscc2scm_all:: ; \
$(ECHO) '\n;; ****** ****** ;;\n' | $(CAT) - >>libatscc2scm_all.scm
libatscc2scm_all:: ; \
$(ECHO) '\n;; end of [libatscc2scm_all.scm] ;;\n' | $(CAT) - >>libatscc2scm_all.scm
#
######
#
upload_source:: ; \
$(SCPR) \
basics_scm.sats \
staloadall.hats \
CATS SATS DATS \
ats-hwxi,ats-lang@web.sourceforge.net:htdocs/LIBRARY/contrib/libatscc/libatscc2scm/.
#
upload_libatscc2scm:: ; \
$(SCPR) \
libatscc2scm_all.scm \
ats-hwxi,ats-lang@web.sourceforge.net:htdocs/LIBRARY/contrib/libatscc/libatscc2scm/.
#
######

clean:: ; $(RMF) *~ */*~

######

cleanall:: clean
cleanall:: ; $(RMF) libatscc2scm_all.scm

######

###### end of [Makefile] ######
