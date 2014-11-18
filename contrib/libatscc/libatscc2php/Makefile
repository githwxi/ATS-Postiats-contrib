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
$(PATSOPT) -d ./DATS/list.dats | $(ATSCC2PHP) -o ./output/DATS/list_dats.php -i
all:: ; \
$(PATSOPT) -d ./DATS/intrange.dats | $(ATSCC2PHP) -o ./output/DATS/intrange_dats.php -i
all:: ; \
$(PATSOPT) -d ./DATS/reference.dats | $(ATSCC2PHP) -o ./output/DATS/reference_dats.php -i

#######

all_in_one:: ; \
$(CAT) >libatscc2php_all.php \
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
output/DATS/list_dats.php \
output/DATS/intrange_dats.php \
output/DATS/reference_dats.php \

#######

clean:: ; $(RMF) *~ */*~

#######

cleanall:: clean
cleanall:: ; $(RMF) libatscc2php_all.php

#######

###### end of [Makefile] ######
