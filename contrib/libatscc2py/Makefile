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
$(CPF) ./CATS/basics_cats.py ./output/prelude_basics_cats.py
all:: ; \
$(CPF) ./CATS/integer_cats.py ./output/prelude_integer_cats.py
all:: ; \
$(CPF) ./CATS/bool_cats.py ./output/prelude_bool_cats.py
all:: ; \
$(CPF) ./CATS/char_cats.py ./output/prelude_char_cats.py
all:: ; \
$(CPF) ./CATS/float_cats.py ./output/prelude_float_cats.py
all:: ; \
$(CPF) ./CATS/string_cats.py ./output/prelude_string_cats.py
all:: ; \
$(CPF) ./CATS/filebas_cats.py ./output/prelude_filebas_cats.py
all:: ; \
$(CPF) ./CATS/PYlist_cats.py ./output/prelude_PYlist_cats.py

#######

all:: ; \
$(PATSOPT) -d ./DATS/list.dats | $(ATSCC2PY) -o ./output/prelude_list_dats.py -i
all:: ; \
$(PATSOPT) -d ./DATS/reference.dats | $(ATSCC2PY) -o ./output/prelude_reference_dats.py -i
all:: ; \
$(PATSOPT) -d ./DATS/array.dats | $(ATSCC2PY) -o ./output/prelude_array_dats.py -i

#######

###### end of [Makefile] ######
