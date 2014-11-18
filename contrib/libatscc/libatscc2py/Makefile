#
# For generating libatscc2py
#

######

PATSOPT=$(PATSHOME)/bin/patsopt
ATSCC2PY=$(PATSHOME)/bin/atscc2py

######

CPF=cp -f

######

all:: ; \
$(CPF) ./CATS/basics_cats.py ./output/ats2pypre_basics_cats.py
all:: ; \
$(CPF) ./CATS/integer_cats.py ./output/ats2pypre_integer_cats.py
all:: ; \
$(CPF) ./CATS/bool_cats.py ./output/ats2pypre_bool_cats.py
all:: ; \
$(CPF) ./CATS/char_cats.py ./output/ats2pypre_char_cats.py
all:: ; \
$(CPF) ./CATS/float_cats.py ./output/ats2pypre_float_cats.py
all:: ; \
$(CPF) ./CATS/string_cats.py ./output/ats2pypre_string_cats.py
all:: ; \
$(CPF) ./CATS/print_cats.py ./output/ats2pypre_print_cats.py
all:: ; \
$(CPF) ./CATS/filebas_cats.py ./output/ats2pypre_filebas_cats.py
all:: ; \
$(CPF) ./CATS/PYlist_cats.py ./output/ats2pypre_PYlist_cats.py

#######

all:: ; \
$(PATSOPT) -d ./DATS/list.dats | $(ATSCC2PY) -o ./output/ats2pypre_list_dats.py -i
all:: ; \
$(PATSOPT) -d ./DATS/stream.dats | $(ATSCC2PY) -o ./output/ats2pypre_stream_dats.py -i
all:: ; \
$(PATSOPT) -d ./DATS/array.dats | $(ATSCC2PY) -o ./output/ats2pypre_array_dats.py -i
all:: ; \
$(PATSOPT) -d ./DATS/reference.dats | $(ATSCC2PY) -o ./output/ats2pypre_reference_dats.py -i

#######

###### end of [Makefile] ######
