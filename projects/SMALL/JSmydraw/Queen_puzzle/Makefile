######

PHP=php

######

PATSCC=patscc
ATSCC2JS=atscc2js

######
#
all:: \
Queen_puzzle_php_dats.js
#
Queen_puzzle_php.dats: Queen_puzzle.php ; $(PHP) -f $< > $@
Queen_puzzle_php_dats.c: Queen_puzzle_php.dats; $(PATSCC) -ccats $<
Queen_puzzle_php_dats.js: Queen_puzzle_php_dats.c; $(ATSCC2JS) -o $@ -i $<
#
# cleanall:: ; $(RMF) Queen_puzzle_php.dats
#
######
#
upload_demo:: \
Queen_puzzle.html \
Queen_puzzle_php_dats.js ; \
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
