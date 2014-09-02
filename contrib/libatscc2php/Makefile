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
$(CPF) ./CATS/string_cats.php ./output/prelude_string_cats.php

#######

all:: ; \
$(PATSOPT) -d ./DATS/list.dats | $(ATSCC2PY) -o ./output/prelude_list_dats.php -i

#######

###### end of [Makefile] ######
