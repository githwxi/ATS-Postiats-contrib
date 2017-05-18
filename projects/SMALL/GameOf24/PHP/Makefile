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

GameOf24_php_dats.c: \
GameOf24_php.dats GameOf24_php.sats; ${PATSCC} -ccats $<
GameOf24_php_dats.php: GameOf24_php_dats.c; ${ATSCC2PHP} -o $@ -i $<

######

RMF=rm -f
RMRF=rm -rf

######

CPRF=cp -rf

######
#
libatscc2php:: ; \
$(CPRF) $(PATSHOME)/contrib/libatscc2php/ATS2-0.3.2/CATS libatscc2php/.
libatscc2php:: ; \
$(CPRF) $(PATSHOME)/contrib/libatscc2php/ATS2-0.3.2/output/DATS libatscc2php/.
#
######

clean:: ; $(RMF) *~
clean:: ; $(RMF) GameOf24_php_dats.c

######

cleanall:: clean
cleanall:: ; $(RMF) GameOf24_php_dats.php
cleanall:: ; $(RMRF) libatscc2php/CATS
cleanall:: ; $(RMRF) libatscc2php/DATS

###### end of [Makefile] ######
