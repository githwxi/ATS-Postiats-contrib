######

PHP=php

######

PATSCC=patscc
ATSCC2JS=atscc2js

######

all:: \
Sorting_insert_php.dats
Sorting_insert_php.dats: Sorting_insert.php ; $(PHP) -f $< > $@
Sorting_insert_php_dats.c: Sorting_insert_php.dats; $(PATSCC) -ccats $<
Sorting_insert_php_dats.js: Sorting_insert_php_dats.c; $(ATSCC2JS) -o $@ -i $<
#
# cleanall:: ; $(RMF) Sorting_insert_php.dats
#
######
#
upload_demo:: \
Sorting_insert.html \
Sorting_insert_php_dats.js ; \
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
