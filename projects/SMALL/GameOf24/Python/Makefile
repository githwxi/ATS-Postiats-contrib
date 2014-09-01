#
# A simple Makefile
#

######

PATSCC=${PATSHOME}/bin/patscc
ATSCC2PY=${PATSHOME}/bin/atscc2py

######

all: GameOf24_py_dats.py

######

GameOf24_py_dats.c: GameOf24_py.dats; ${PATSCC} -ccats $<
GameOf24_py_dats.py: GameOf24_py_dats.c; ${ATSCC2PY} -o $@ -i $<

######

RMF=rm -f
CPRF=cp -rf

######

libupdate:: ; \
$(CPRF) \
$(PATSHOME_contrib)/contrib/libatscc2py/CATS/basics_cats.py ./libatscc2py/prelude_basics_cats.py
libupdate:: ; \
$(CPRF) \
$(PATSHOME_contrib)/contrib/libatscc2py/CATS/integer_cats.py ./libatscc2py/prelude_integer_cats.py
libupdate:: ; \
$(CPRF) $(PATSHOME_contrib)/contrib/libatscc2py/CATS/bool_cats.py ./libatscc2py/prelude_bool_cats.py
libupdate:: ; \
$(CPRF) $(PATSHOME_contrib)/contrib/libatscc2py/CATS/char_cats.py ./libatscc2py/prelude_char_cats.py
libupdate:: ; \
$(CPRF) $(PATSHOME_contrib)/contrib/libatscc2py/CATS/float_cats.py ./libatscc2py/prelude_float_cats.py
libupdate:: ; \
$(CPRF) $(PATSHOME_contrib)/contrib/libatscc2py/CATS/string_cats.py ./libatscc2py/prelude_string_cats.py
libupdate:: ; \
$(CPRF) $(PATSHOME_contrib)/contrib/libatscc2py/CATS/filebas_cats.py ./libatscc2py/prelude_filebas_cats.py
libupdate:: ; \
$(CPRF) $(PATSHOME_contrib)/contrib/libatscc2py/CATS/PYlist_cats.py ./libatscc2py/prelude_PYlist_cats.py
#
libupdate:: ; \
$(CPRF) $(PATSHOME_contrib)/contrib/libatscc2py/DATS/list_dats.py ./libatscc2py/prelude_list_dats.py
#
######

clean:: ; $(RMF) GameOf24_py_dats.c

######

cleanall:: clean
cleanall:: ; $(RMF) GameOf24_py_dats.py

###### end of [Makefile] ######
