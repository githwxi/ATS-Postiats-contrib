#
# A Simple Makefile
#

######

all:: upload_html

######

SCP=scp

######
#
upload_html: ; \
$(SCP) \
  mytest.html \
  mytest_process.php \
  mytest2_process.php \
  ats-hwxi,ats-lang@web.sourceforge.net:htdocs/COMPILED/doc/PROJECT/MEDIUM/ATS-parse-emit/PHP/.
#
upload_rest: ; \
$(SCP) DATS_PHP/*.php \
  ats-hwxi,ats-lang@web.sourceforge.net:htdocs/COMPILED/doc/PROJECT/MEDIUM/ATS-parse-emit/PHP/DATS_PHP/.
#
######

###### end of [Makefile] ######
