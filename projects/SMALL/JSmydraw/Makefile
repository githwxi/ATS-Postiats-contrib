######

PHP=php

######

PATSCC=patscc
ATSCC2JS=atscc2js

######

all:: \
Sierpinski_triangle_php.dats

######

Sierpinski_triangle_php.dats: \
Sierpinski_triangle.php mydraw.dats; $(PHP) -f $< > $@
Sierpinski_triangle_php_dats.c: Sierpinski_triangle_php.dats; $(PATSCC) -ccats $<
Sierpinski_triangle_php_dats.js: Sierpinski_triangle_php_dats.c; $(ATSCC2JS) -o $@ -i $<

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_dats.c

######

cleanall:: clean
cleanall:: ; $(RMF) *_dats.js
cleanall:: ; $(RMF) Sierpinski_triangle_php.dats

###### end of [Makefile] ######
