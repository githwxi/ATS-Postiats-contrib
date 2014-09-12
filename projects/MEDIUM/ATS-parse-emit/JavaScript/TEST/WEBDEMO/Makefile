#
# A Simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
ATSCC2JS=$(PATSHOME)/bin/atscc2js

######

all:: upload_html

######

mytest_dats.js: mytest.dats; $(PATSOPT) -d $< | $(ATSCC2JS) -o $@ -i

######
#
upload_html: ; \
  scp mytest.html ats-hwxi,ats-lang@web.sourceforge.net:htdocs/COMPILED/doc/PROJECT/MEDIUM/ATS-parse-emit/JavaScript/.
upload_DATS_JS: mytest_dats.js; \
  scp mytest_dats.js ats-hwxi,ats-lang@web.sourceforge.net:htdocs/COMPILED/doc/PROJECT/MEDIUM/ATS-parse-emit/JavaScript/DATS_JS/.
#
######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_dats.c

######

cleanall:: clean
cleanall:: ; $(RMF) *_dats.js

######

###### end of [Makefile] ######
