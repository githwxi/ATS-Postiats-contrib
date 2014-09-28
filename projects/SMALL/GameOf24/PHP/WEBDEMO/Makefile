#
# A Simple Makefile
#

######

all:: upload_html
all:: upload_rest

######
#
upload_html: ; \
scp inputform.html inputform_process.php \
  ats-hwxi,ats-lang@web.sourceforge.net:htdocs/COMPILED/doc/PROJECT/SMALL/GameOf24/PHP/.
#
upload_rest: ; \
scp -r libatscc2php DATS_PHP \
  ats-hwxi,ats-lang@web.sourceforge.net:htdocs/COMPILED/doc/PROJECT/SMALL/GameOf24/PHP/.
#
######

###### end of [Makefile] ######
