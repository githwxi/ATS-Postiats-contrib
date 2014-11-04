######

PHP=php

######

PATSCC=patscc
ATSCC2JS=atscc2js

######

all:: \
Sierpinski_3angle_php.dats
all:: \
Sierpinski_carpet_php.dats

######

Sierpinski_3angle_php.dats: \
Sierpinski_3angle.php mydraw.dats; $(PHP) -f $< > $@
Sierpinski_3angle_php_dats.c: Sierpinski_3angle_php.dats; $(PATSCC) -ccats $<
Sierpinski_3angle_php_dats.js: Sierpinski_3angle_php_dats.c; $(ATSCC2JS) -o $@ -i $<

######

Sierpinski_carpet_php.dats: \
Sierpinski_carpet.php mydraw.dats; $(PHP) -f $< > $@
Sierpinski_carpet_php_dats.c: Sierpinski_carpet_php.dats; $(PATSCC) -ccats $<
Sierpinski_carpet_php_dats.js: Sierpinski_carpet_php_dats.c; $(ATSCC2JS) -o $@ -i $<

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_dats.c

######

cleanall:: clean
cleanall:: ; $(RMF) *_dats.js
cleanall:: ; $(RMF) Sierpinski_3angle_php.dats
cleanall:: ; $(RMF) Sierpinski_carpet_php.dats

###### end of [Makefile] ######
