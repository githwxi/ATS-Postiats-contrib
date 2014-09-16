#
# For generating libatscc2php
#

######

PATSOPT=$(PATSHOME)/bin/patsopt
ATSCC2PHP=$(PATSHOME)/bin/atscc2php

######

CPF=cp -f

######

all:: ; \
$(PATSOPT) -d ./DATS/list.dats | $(ATSCC2PHP) -o ./output/DATS/list_dats.php -i
all:: ; \
$(PATSOPT) -d ./DATS/reference.dats | $(ATSCC2PHP) -o ./output/DATS/reference_dats.php -i

#######

###### end of [Makefile] ######
