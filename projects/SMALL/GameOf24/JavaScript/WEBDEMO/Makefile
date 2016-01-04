#
# A Simple Makefile
#

######

all:: upload

######

upload:: upload_html
upload:: upload_DATS_JS

######
#
upload_html: ; \
scp inputform.html \
  ats-hwxi,ats-lang@web.sourceforge.net:htdocs/COMPILED/doc/PROJECT/SMALL/GameOf24/JavaScript/.
upload_DATS_JS: ; \
scp -r DATS_JS \
  ats-hwxi,ats-lang@web.sourceforge.net:htdocs/COMPILED/doc/PROJECT/SMALL/GameOf24/JavaScript/.
#
######

###### end of [Makefile] ######
