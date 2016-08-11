#
# A simple Makefile
#
######
#
PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
#
ATSCC2JS=$(PATSHOME)/bin/atscc2js
ATSCC2PY=$(PATSHOME)/bin/atscc2py3
#
######

PYTHON=python3

######
#
all:: \
midterm-2_dats.py
#
######
#
midterm-2_dats.c: \
  midterm-2.dats; $(PATSOPT) -o $@ -d $<
midterm-2_dats.py: \
  midterm-2_dats.c; $(ATSCC2PY) -o $@ -i $<
#
cleanall:: ; rm -f midterm-2_dats.py
cleanall:: ; rm -f midterm-2_dats.html
#
######
#
regress:: midterm-2_dats.py; $(PYTHON) $<
#
######
#
clean:: ; rm -f *~
clean:: ; rm -f midterm-2_dats.c
#
cleanall:: clean
#
######

###### end of [Makefile] ######
