######

PHP=php

######

PATSCC=patscc
ATSCC2JS=atscc2js

######

all:: \
Sorting_quick2_php.dats
Sorting_quick2_php.dats: Sorting_quick2.php ; $(PHP) -f $< > $@
Sorting_quick2_php_dats.c: Sorting_quick2_php.dats; $(PATSCC) -ccats $<
Sorting_quick2_php_dats.js: Sorting_quick2_php_dats.c; $(ATSCC2JS) -o $@ -i $<
#
# cleanall:: ; $(RMF) Sorting_quick2_php.dats
#
######
#
upload_demo:: \
Sorting_quick2.html \
Sorting_quick2_php_dats.js ; \
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
