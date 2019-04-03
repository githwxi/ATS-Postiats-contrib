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
cleanall:: ; rm -f midterm-1_dats.py
cleanall:: ; rm -f midterm-1_dats.html
#
######
#
midterm-1-q1_dats.c: \
  midterm-1-q1.dats; $(PATSOPT) -o $@ -d $<
midterm-1-q1_dats.py: \
  midterm-1-q1_dats.c; $(ATSCC2PY) -o $@ -i $<
#
cleanall:: ; rm -f midterm-1-q1_dats.py
cleanall:: ; rm -f midterm-1-q1_dats.html
#
######
#
midterm-1-q2_dats.c: \
  midterm-1-q2.dats; $(PATSOPT) -o $@ -d $<
midterm-1-q2_dats.py: \
  midterm-1-q2_dats.c; $(ATSCC2PY) -o $@ -i $<
#
cleanall:: ; rm -f midterm-1-q2_dats.py
cleanall:: ; rm -f midterm-1-q2_dats.html
#
######
#
midterm-1-q3_dats.c: \
  midterm-1-q3.dats; $(PATSOPT) -o $@ -d $<
midterm-1-q3_dats.py: \
  midterm-1-q3_dats.c; $(ATSCC2PY) -o $@ -i $<
#
cleanall:: ; rm -f midterm-1-q3_dats.py
cleanall:: ; rm -f midterm-1-q3_dats.html
#
######
#
regress:: midterm-1_dats.py; $(PYTHON) $< > midterm-1_dats.html
regress:: midterm-1-q1_dats.py; $(PYTHON) $< > midterm-1-q1_dats.html
regress:: midterm-1-q2_dats.py; $(PYTHON) $< > midterm-1-q2_dats.html
regress:: midterm-1-q3_dats.py; $(PYTHON) $< > midterm-1-q3_dats.html
#
######
#
clean:: ; rm -f *~
clean:: ; rm -f midterm-1_dats.c
clean:: ; rm -f midterm-1-q1_dats.c
clean:: ; rm -f midterm-1-q2_dats.c
clean:: ; rm -f midterm-1-q3_dats.c
#
cleanall:: clean
#
######

###### end of [Makefile] ######
