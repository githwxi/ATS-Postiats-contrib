#
# For generating libatscc2php
#

######

PATSOPT=$(PATSHOME)/bin/patsopt
ATSCC2PHP=$(PATSHOME)/bin/atscc2php

######

RMF=rm -f

######

all::

######

all:: \
DATS_PHP/inputform_process_dats.php
inputform_process_dats.c: inputform_process.dats ; $(PATSOPT) -o $@ -d $<
DATS_PHP/inputform_process_dats.php: inputform_process_dats.c ; $(ATSCC2PHP) -o $@ -i $<

#######
#
upload_html: ; \
scp inputform.html inputform_process.php \
  ats-hwxi,ats-lang@web.sourceforge.net:htdocs/COMPILED/doc/PROJECT/LARGE/TUTORIATS/services/patsopt-trial/.
#
upload_rest: ; \
scp -r libatscc2php libtutoriats0 DATS_PHP \
  ats-hwxi,ats-lang@web.sourceforge.net:htdocs/COMPILED/doc/PROJECT/LARGE/TUTORIATS/services/patsopt-trial/.
#
#######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_dats.c

#######

cleanall:: clean
cleanall:: ; $(RMF) DATS_PHP/*.php

#######

###### end of [Makefile] ######
