######

PHP=php

######

PATSCC=patscc
ATSCC2JS=atscc2js

######
#
all:: \
Sierpinski_3angle_php.dats
Sierpinski_3angle_php.dats: Sierpinski_3angle.php ; $(PHP) -f $< > $@
Sierpinski_3angle_php_dats.c: Sierpinski_3angle_php.dats; $(PATSCC) -ccats $<
Sierpinski_3angle_php_dats.js: Sierpinski_3angle_php_dats.c; $(ATSCC2JS) -o $@ -i $<
#
# cleanall:: ; $(RMF) Sierpinski_3angle_php.dats
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
