######
#
# A simple Makefile
#
######

PATSCC=$(PATSHOME)/bin/patscc
ATSCC2JS=$(PATSHOME)/bin/atscc2js

######
#
all:: \
DiningPhil_dats.js
#
DiningPhil_dats.c: DiningPhil.dats; $(PATSCC) -ccats $<
DiningPhil_dats.js: DiningPhil_dats.c; $(ATSCC2JS) -o $@ -i $<
#
######
#
upload_demo:: \
DiningPhil.html \
DiningPhil_dats.js ; \
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
