#
#
# This Makefile is automatically generated
# from executing the following command-line:
#
# make -f Makefile.gen
#
#

######

ATSHOMEQ="$(ATSHOME)"
ATSCC=$(ATSHOMEQ)/bin/atscc
ATSOPT=$(ATSHOMEQ)/bin/atsopt
ATSDOC=$(ATSHOMEQ)/bin/atsdoc

######

PATSHOMEQ="$(PATSHOME)"

######

SHAREDOCU=$(PATSHOMEQ)/share/DOCUGEN

######

INCLUDE:=-I $(PATSHOMEQ)/src
INCLATS:=-IATS $(SHAREDOCU) -IATS $(PATSHOMEQ) -IATS $(ATSHOMEQ)

######

CAT=cat

######

all:: all_html

######

DECLATEXT=   declatext_sats.o   declatext_dats.o 
declatext_sats.o: ;   $(ATSCC) $(INCLUDE) $(INCLATS) -c $(ATSCCFLAGS) $(SHAREDOCU)/declatext.sats
declatext_dats.o: ;   $(ATSCC) $(INCLUDE) $(INCLATS) -c $(ATSCCFLAGS) $(SHAREDOCU)/declatext.dats

######

HTMLGENDECL=   htmlgendecl_sats.o   htmlgendecl_dats.o 
htmlgendecl_sats.o: ;   $(ATSCC) $(INCLUDE) $(INCLATS) -c $(ATSCCFLAGS) $(SHAREDOCU)/htmlgendecl.sats
htmlgendecl_dats.o: ;   $(ATSCC) $(INCLUDE) $(INCLATS) -c $(ATSCCFLAGS) $(SHAREDOCU)/htmlgendecl.dats

htmlgendecl_atxt.dats: ;   $(ATSDOC) --outcode $@ -i $(SHAREDOCU)/htmlgendecl.atxt > htmlgendecl_atxt.txt

######

all_html::

all_html:: HTML/blas.html
HTML/blas.html:   blas_atxt.exe ; ./$< > $@
blas_atxt.txt: blas.atxt ; $(CAT) $< |   $(ATSDOC) --prefix __datatok --outcode htmlgendecl_data_atxt.dats > $@
blas_atxt.exe: htmlgendecl_atxt.dats   blas_atxt.txt $(DECLATEXT) $(HTMLGENDECL) ;   $(ATSCC) $(INCLUDE) $(INCLATS) $(ATSGCFLAG) -o $@ $<     $(DECLATEXT) $(HTMLGENDECL) $(PATSHOMEQ)/libatsynmark/libatsynmark.a -latsdoc
upload_blas:: ;   scp HTML/blas.html ats-hwxi,ats-lang@web.sourceforge.net:htdocs/LIBRARY/contrib/libfloats/SATS/DOCUGEN/HTML
clean:: ; $(RMF) blas_atxt.exe
cleanall:: ; $(RMF) HTML/blas.html

all_html:: HTML/lavector.html
HTML/lavector.html:   lavector_atxt.exe ; ./$< > $@
lavector_atxt.txt: lavector.atxt ; $(CAT) $< |   $(ATSDOC) --prefix __datatok --outcode htmlgendecl_data_atxt.dats > $@
lavector_atxt.exe: htmlgendecl_atxt.dats   lavector_atxt.txt $(DECLATEXT) $(HTMLGENDECL) ;   $(ATSCC) $(INCLUDE) $(INCLATS) $(ATSGCFLAG) -o $@ $<     $(DECLATEXT) $(HTMLGENDECL) $(PATSHOMEQ)/libatsynmark/libatsynmark.a -latsdoc
upload_lavector:: ;   scp HTML/lavector.html ats-hwxi,ats-lang@web.sourceforge.net:htdocs/LIBRARY/contrib/libfloats/SATS/DOCUGEN/HTML
clean:: ; $(RMF) lavector_atxt.exe
cleanall:: ; $(RMF) HTML/lavector.html

all_html:: HTML/lamatrix.html
HTML/lamatrix.html:   lamatrix_atxt.exe ; ./$< > $@
lamatrix_atxt.txt: lamatrix.atxt ; $(CAT) $< |   $(ATSDOC) --prefix __datatok --outcode htmlgendecl_data_atxt.dats > $@
lamatrix_atxt.exe: htmlgendecl_atxt.dats   lamatrix_atxt.txt $(DECLATEXT) $(HTMLGENDECL) ;   $(ATSCC) $(INCLUDE) $(INCLATS) $(ATSGCFLAG) -o $@ $<     $(DECLATEXT) $(HTMLGENDECL) $(PATSHOMEQ)/libatsynmark/libatsynmark.a -latsdoc
upload_lamatrix:: ;   scp HTML/lamatrix.html ats-hwxi,ats-lang@web.sourceforge.net:htdocs/LIBRARY/contrib/libfloats/SATS/DOCUGEN/HTML
clean:: ; $(RMF) lamatrix_atxt.exe
cleanall:: ; $(RMF) HTML/lamatrix.html


######

uploadall:: ;   scp HTML/*.html ats-hwxi,ats-lang@web.sourceforge.net:htdocs/LIBRARY/contrib/libfloats/SATS/DOCUGEN/HTML

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.o *_?ats.c
clean:: ; $(RMF) *_atxt.txt
clean:: ; $(RMF) *_atxt.dats

cleanall:: clean

###### end of [Makefile] ######
