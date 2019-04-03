#
# For generating libatscc2php
#

######

PATSOPT=$(PATSHOME)/bin/patsopt
ATSCC2JS=$(PATSHOME)/bin/atscc2js
ATSCC2PHP=$(PATSHOME)/bin/atscc2php

######

RMF=rm -f

######

all::

######

all::\
DATS_JS/inputform_process_js_dats.js
inputform_process_js_dats.c: inputform_process_js.dats ; $(PATSOPT) -o $@ -d $<
DATS_JS/inputform_process_js_dats.js: inputform_process_js_dats.c ; $(ATSCC2JS) -o $@ -i $<

#######

all::\
DATS_PHP/inputform_process_php_dats.php
inputform_process_php_dats.c: inputform_process_php.dats ; $(PATSOPT) -o $@ -d $<
DATS_PHP/inputform_process_php_dats.php: inputform_process_php_dats.c ; $(ATSCC2PHP) -o $@ -i $<

#######
#
upload_html: ; \
scp inputform.html inputform2.html pats2xhtml.php \
  ats-hwxi,ats-lang@web.sourceforge.net:htdocs/COMPILED/doc/PROJECT/LARGE/TUTORIATS/services/pats2xhtml-trial/.
#
upload_rest: ; \
scp -r libatscc2php libtutoriats0 DATS_JS DATS_PHP \
  ats-hwxi,ats-lang@web.sourceforge.net:htdocs/COMPILED/doc/PROJECT/LARGE/TUTORIATS/services/pats2xhtml-trial/.
#
#######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_dats.c

#######

cleanall:: clean
cleanall:: ; $(RMF) DATS_JS/*.js
cleanall:: ; $(RMF) DATS_PHP/*.php

#######

###### end of [Makefile] ######
