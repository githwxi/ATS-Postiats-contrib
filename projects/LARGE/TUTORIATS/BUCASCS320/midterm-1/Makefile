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
midterm-1_dats.py
#
######
#
midterm-1_dats.c: \
  midterm-1.dats; $(PATSOPT) -o $@ -d $<
midterm-1_dats.py: \
  midterm-1_dats.c; $(ATSCC2PY) -o $@ -i $<
#
######
#
regress:: midterm-1_dats.py; $(PYTHON) $<
#
######
#
clean:: ; rm -f *~
clean:: ; rm -f midterm-1_dats.c
#
cleanall:: clean
cleanall:: ; rm -f midterm-1_dats.py
cleanall:: ; rm -f midterm-1_dats.html
#
######

###### end of [Makefile] ######
