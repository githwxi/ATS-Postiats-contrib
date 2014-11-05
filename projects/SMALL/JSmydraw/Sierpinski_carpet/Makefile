######

PHP=php

######

PATSCC=patscc
ATSCC2JS=atscc2js

######
#
all:: \
Sierpinski_carpet_php.dats
Sierpinski_carpet_php.dats: Sierpinski_carpet.php ; $(PHP) -f $< > $@
Sierpinski_carpet_php_dats.c: Sierpinski_carpet_php.dats; $(PATSCC) -ccats $<
Sierpinski_carpet_php_dats.js: Sierpinski_carpet_php_dats.c; $(ATSCC2JS) -o $@ -i $<
#
# cleanall:: ; $(RMF) Sierpinski_carpet_php.dats
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
