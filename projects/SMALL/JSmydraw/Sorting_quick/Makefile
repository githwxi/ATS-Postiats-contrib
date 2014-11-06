######

PHP=php

######

PATSCC=patscc
ATSCC2JS=atscc2js

######

# all:: \
# Sorting_quick.dats
# Sorting_quick.dats: Sorting_insert.php ; $(PHP) -f $< > $@
Sorting_quick_dats.c: Sorting_quick.dats; $(PATSCC) -ccats $<
Sorting_quick_dats.js: Sorting_quick_dats.c; $(ATSCC2JS) -o $@ -i $<
#
# cleanall:: ; $(RMF) Sorting_quick.dats
#
######
#
upload_demo:: \
Sorting_insert.html \
Sorting_quick_dats.js ; \
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
