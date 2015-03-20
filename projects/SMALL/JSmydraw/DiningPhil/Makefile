######

PHP=php

######

PATSCC=patscc
ATSCC2JS=atscc2js

######
#
all:: \
DiningPhil_php_dats.js
#
DiningPhil_php.dats: DiningPhil.php ; $(PHP) -f $< > $@
DiningPhil_php_dats.c: DiningPhil_php.dats; $(PATSCC) -ccats $<
DiningPhil_php_dats.js: DiningPhil_php_dats.c; $(ATSCC2JS) -o $@ -i $<
#
# cleanall:: ; $(RMF) DiningPhil_php.dats
#
######
#
upload_demo:: \
DiningPhil.html \
DiningPhil_php_dats.js ; \
scp $^ ats-hwxi,ats-lang@web.sourceforge.net:htdocs/COMPILED/doc/PROJECT/SMALL/JSmydraw/.
#
######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_dats.c

######

cleanall:: clean
cleanall:: ; $(RMF) *_dats.js

###### end of [Makefile] ######
