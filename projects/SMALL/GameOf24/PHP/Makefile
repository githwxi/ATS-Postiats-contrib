#
# A simple Makefile
#

######

PHP=php

######

PATSCC=${PATSHOME}/bin/patscc
ATSCC2PHP=${PATSHOME}/bin/atscc2php

######

all:: GameOf24_php_dats.php; $(PHP) -f mytest.php

######

GameOf24_php_dats.c: GameOf24_php.dats; ${PATSCC} -ccats $<
GameOf24_php_dats.php: GameOf24_php_dats.c; ${ATSCC2PHP} -o $@ -i $<

######

RMF=rm -f
RMRF=rm -rf

######

CPRF=cp -rf

######
#
libatscc2php:: ; \
$(CPRF) $(PATSHOME_contrib)/contrib/libatscc2php/CATS/* libatscc2php/CATS/.
libatscc2php:: ; \
$(CPRF) $(PATSHOME_contrib)/contrib/libatscc2php/output/DATS/* libatscc2php/DATS/.
#
######

clean:: ; $(RMF) *~
clean:: ; $(RMF) GameOf24_php_dats.c

######

cleanall:: clean
cleanall:: ; $(RMF) GameOf24_php_dats.php
cleanall:: ; $(RMF) libatscc2php/CATS/*_cats.php
cleanall:: ; $(RMF) libatscc2php/DATS/*_dats.php

###### end of [Makefile] ######
