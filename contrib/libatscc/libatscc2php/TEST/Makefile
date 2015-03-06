#
# A simple Makefile
#
######

PHP=php

######

PATSCC=${PATSHOME}/bin/patscc
PATSOPT=${PATSHOME}/bin/patsopt
ATSCC2PHP=${PATSHOME}/bin/atscc2php

######

all::

######

all:: \
test01
test01: \
test01_dats.php; $(PHP) -f $<
test01_dats.c: test01.dats; $(PATSOPT) -o $@ -d $<
test01_dats.php: test01_dats.c; $(ATSCC2PHP) -o $@ -i $<

######

all:: \
test02
test02: \
test02_dats.php; $(PHP) -f $<
test02_dats.c: test02.dats; $(PATSOPT) -o $@ -d $<
test02_dats.php: test02_dats.c; $(ATSCC2PHP) -o $@ -i $<

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c

######

cleanall:: clean
cleanall:: ; $(RMF) *_?ats.php

######

###### end of [Makefile] ######
