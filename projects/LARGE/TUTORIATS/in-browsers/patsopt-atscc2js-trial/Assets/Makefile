######
#
# A simple Makefile
#
######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
ATSCC2JS=$(PATSHOME)/bin/atscc2js

######
#
all:: \
inputform_dats.js
#
######

inputform_dats.c: \
inputform.dats; $(PATSOPT) -o $@ -d $<
inputform_dats.js: \
inputform_dats.c; $(ATSCC2JS) -o $@ -i $<

######
#
CPF=cp -f
RMF=rm -f
#
######
#
pkgreloc:: ; \
$(CPF) $(PATSHOME)/utils/libatsopt/JS/TEST/libatsopt_ext_worker.js .
pkgreloc:: ; \
$(CPF) $(PATSHOME)/utils/libatsopt/JS/TEST/libatsopt_ext_worker.data .
pkgreloc:: ; \
$(CPF) $(PATSHOME)/utils/libatsopt/JS/TEST/libatsopt_ext_worker.js.mem .
pkgreloc:: ; \
$(CPF) $(PATSHOMERELOC)/projects/MEDIUM/CATS-atsccomp/CATS-atscc2js/CBOOT/JS/TEST/libatscc2js_ext_worker.js .
pkgreloc:: ; \
$(CPF) $(PATSHOMERELOC)/projects/MEDIUM/CATS-atsccomp/CATS-atscc2js/CBOOT/JS/TEST/libatscc2js_ext_worker.js.mem .
#
######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.o
clean:: ; $(RMF) *_?ats.c

######
#
cleanall:: clean
#
cleanall:: ; $(RMF) inputform_dats.js
cleanall:: ; $(RMF) libatsopt_ext_worker.js
cleanall:: ; $(RMF) libatsopt_ext_worker.data
cleanall:: ; $(RMF) libatsopt_ext_worker.js.mem
cleanall:: ; $(RMF) libatscc2js_ext_worker.js
cleanall:: ; $(RMF) libatscc2js_ext_worker.js.mem
#
###### end of [Makefile] ######
