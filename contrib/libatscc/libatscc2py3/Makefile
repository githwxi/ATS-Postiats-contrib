#
# For generating libatscc2py
#

######

PATSOPT=$(PATSHOME)/bin/patsopt
ATSCC2PY=$(PATSHOME)/bin/atscc2py3

######

CPF=cp -f

######
#
all::
#
# all_in_one::
#
######
#
all:: ; \
$(CPF) ./CATS/basics_cats.py ./output/ats2pypre_basics_cats.py
all:: ; \
$(CPF) ./CATS/integer_cats.py ./output/ats2pypre_integer_cats.py
#
all:: ; \
$(CPF) ./CATS/bool_cats.py ./output/ats2pypre_bool_cats.py
all:: ; \
$(CPF) ./CATS/char_cats.py ./output/ats2pypre_char_cats.py
all:: ; \
$(CPF) ./CATS/float_cats.py ./output/ats2pypre_float_cats.py
all:: ; \
$(CPF) ./CATS/string_cats.py ./output/ats2pypre_string_cats.py
#
all:: ; \
$(CPF) ./CATS/print_cats.py ./output/ats2pypre_print_cats.py
all:: ; \
$(CPF) ./CATS/filebas_cats.py ./output/ats2pypre_filebas_cats.py
#
all:: ; \
$(CPF) ./CATS/PYlist_cats.py ./output/ats2pypre_PYlist_cats.py
all:: ; \
$(CPF) ./CATS/reference_cats.py ./output/ats2pypre_reference_cats.py
#
######

all:: ; \
$(CPF) ./CATS/PYLIBC_random_cats.py ./output/ats2pylibc_random_cats.py
all:: ; \
$(CPF) ./CATS/PYLIBC_datetime_cats.py ./output/ats2pylibc_datetime_cats.py

######

all:: ; \
$(CPF) ./CATS/PYGAME_pygame_cats.py ./output/ats2py_pygame_pyame_cats.py

######
#
all:: ; \
$(PATSOPT) -d ./DATS/list.dats | $(ATSCC2PY) -o ./output/ats2pypre_list_dats.py -i
all:: ; \
$(PATSOPT) -d ./DATS/PYlist.dats | $(ATSCC2PY) -o ./output/ats2pypre_PYlist_dats.py -i
#
all:: ; \
$(PATSOPT) -d ./DATS/option.dats | $(ATSCC2PY) -o ./output/ats2pypre_option_dats.py -i
#
all:: ; \
$(PATSOPT) -d ./DATS/stream.dats | $(ATSCC2PY) -o ./output/ats2pypre_stream_dats.py -i
all:: ; \
$(PATSOPT) -d ./DATS/stream_vt.dats | $(ATSCC2PY) -o ./output/ats2pypre_stream_vt_dats.py -i
#
all:: ; \
$(PATSOPT) -d ./DATS/intrange.dats | $(ATSCC2PY) -o ./output/ats2pypre_intrange_dats.py -i
#
all:: ; \
$(PATSOPT) -d ./DATS/arrayref.dats | $(ATSCC2PY) -o ./output/ats2pypre_arrayref_dats.py -i
all:: ; \
$(PATSOPT) -d ./DATS/matrixref.dats | $(ATSCC2PY) -o ./output/ats2pypre_matrixref_dats.py -i
all:: ; \
$(PATSOPT) -d ./DATS/reference.dats | $(ATSCC2PY) -o ./output/ats2pypre_reference_dats.py -i
#
######
#
all:: ; \
$(PATSOPT) -d ./DATS/slistref.dats | $(ATSCC2PY) -o ./output/ats2pypre_slistref_dats.py -i
all:: ; \
$(PATSOPT) -d ./DATS/qlistref.dats | $(ATSCC2PY) -o ./output/ats2pypre_qlistref_dats.py -i
#
######

all:: ; \
$(PATSOPT) -d ./DATS/ML/list0.dats | $(ATSCC2PY) -o ./output/ats2pypre_ML_list0_dats.py -i
all:: ; \
$(PATSOPT) -d ./DATS/ML/array0.dats | $(ATSCC2PY) -o ./output/ats2pypre_ML_array0_dats.py -i

######

###### end of [Makefile] ######
