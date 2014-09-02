#
# For generating libatscc2php
#

######

PATSOPT=$(PATSHOME)/bin/patsopt
ATSCC2PY=$(PATSHOME)/bin/atscc2php

######

CPF=cp -f

######

all:: ; \
$(CPF) ./CATS/basics_cats.php ./output/prelude_basics_cats.php
all:: ; \
$(CPF) ./CATS/integer_cats.php ./output/prelude_integer_cats.php
all:: ; \
$(CPF) ./CATS/float_cats.php ./output/prelude_float_cats.php
all:: ; \
$(CPF) ./CATS/string_cats.php ./output/prelude_string_cats.php
all:: ; \
$(CPF) ./CATS/filebas_cats.php ./output/prelude_filebas_cats.php
#
all:: ; \
$(CPF) ./CATS/PHParref_cats.php ./output/prelude_PHParref_cats.php
#
#######

all:: ; \
$(PATSOPT) -d ./DATS/list.dats | $(ATSCC2PY) -o ./output/prelude_list_dats.php -i

#######

###### end of [Makefile] ######
