#
# For generating libatscc2php
#

######

PATSOPT=$(PATSHOME)/bin/patsopt
ATSCC2PHP=$(PATSHOME)/bin/atscc2php

######

CAT=cat
CPF=cp -f
RMF=rm -f

######

all:: ; \
$(PATSOPT) -d ./DATS/list.dats | \
$(ATSCC2PHP) -o ./output/DATS/list_dats.php -i
all:: ; \
$(PATSOPT) -d ./DATS/option.dats | \
$(ATSCC2PHP) -o ./output/DATS/option_dats.php -i
all:: ; \
$(PATSOPT) -d ./DATS/stream.dats | \
$(ATSCC2PHP) -o ./output/DATS/stream_dats.php -i
all:: ; \
$(PATSOPT) -d ./DATS/stream_vt.dats | \
$(ATSCC2PHP) -o ./output/DATS/stream_vt_dats.php -i
all:: ; \
$(PATSOPT) -d ./DATS/intrange.dats | \
$(ATSCC2PHP) -o ./output/DATS/intrange_dats.php -i
all:: ; \
$(PATSOPT) -d ./DATS/arrayref.dats | \
$(ATSCC2PHP) -o ./output/DATS/arrayref_dats.php -i
all:: ; \
$(PATSOPT) -d ./DATS/reference.dats | \
$(ATSCC2PHP) -o ./output/DATS/reference_dats.php -i

######

all:: ; \
$(PATSOPT) -d ./DATS/ML/list0.dats | \
$(ATSCC2PHP) -o ./output/DATS/ML/list0_dats.php -i
all:: ; \
$(PATSOPT) -d ./DATS/ML/array0.dats | \
$(ATSCC2PHP) -o ./output/DATS/ML/array0_dats.php -i

######
#
DATE=/bin/date
ECHO=/bin/echo -en
#
all_in_one:: ; $(ECHO) | $(CAT) - >libatscc2php_all.php
#
all_in_one:: ; \
  $(ECHO) '<?php\n' | $(CAT) - >>libatscc2php_all.php
#
all_in_one:: ; $(ECHO) '/*\n' | $(CAT) - >>libatscc2php_all.php
#
all_in_one:: ; \
  $(ECHO) '** Time of Generation:\n** ' | $(CAT) - >>libatscc2php_all.php
all_in_one:: ; $(DATE) | $(CAT) - >>libatscc2php_all.php
#
all_in_one:: ; $(ECHO) '*/\n' | $(CAT) - >>libatscc2php_all.php
#
all_in_one:: ; $(ECHO) '?>\n' | $(CAT) - >>libatscc2php_all.php
#

all_in_one:: ; \
$(CAT) >>libatscc2php_all.php \
CATS/basics_cats.php \
CATS/integer_cats.php \
CATS/bool_cats.php \
CATS/float_cats.php \
CATS/string_cats.php \
CATS/print_cats.php \
CATS/filebas_cats.php \
CATS/PHPref_cats.php \
CATS/PHParray_cats.php \
CATS/PHParref_cats.php \

all_in_one:: ; \
$(CAT) >>libatscc2php_all.php \
output/DATS/list_dats.php \
output/DATS/option_dats.php \
output/DATS/stream_dats.php \
output/DATS/stream_vt_dats.php \
output/DATS/intrange_dats.php \
output/DATS/arrayref_dats.php \
output/DATS/reference_dats.php \
output/DATS/ML/list0_dats.php \
output/DATS/ML/array0_dats.php \

#
all_in_one:: ; \
  $(ECHO) '<?php\n' | $(CAT) - >>libatscc2php_all.php
#
all_in_one:: ; \
  $(ECHO) '/*\n** end of [libatscc2php_all.php]\n*/\n' | $(CAT) - >>libatscc2php_all.php
#
all_in_one:: ; $(ECHO) '?>\n' | $(CAT) - >>libatscc2php_all.php
#
######

clean:: ; $(RMF) *~ */*~

######

cleanall:: clean
cleanall:: ; $(RMF) libatscc2php_all.php

######

###### end of [Makefile] ######
