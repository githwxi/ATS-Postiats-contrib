#
# A simple Makefile
#

######

PYTHON=python3
export PYTHONPATH=libatscc2py/.

######

PATSCC=${PATSHOME}/bin/patscc
ATSCC2PY=${PATSHOME}/bin/atscc2py

######

all: GameOf24_py_dats.py; $(PYTHON) $<

######

GameOf24_py_dats.c: GameOf24_py.dats; ${PATSCC} -ccats $<
GameOf24_py_dats.py: GameOf24_py_dats.c; ${ATSCC2PY} -o $@ -i $<

######

RMF=rm -f
RMRF=rm -rf

######

CPRF=cp -rf

######
#
libatscc2py:: ; \
$(CPRF) $(PATSHOME_contrib)/contrib/libatscc/libatscc2py/output/* libatscc2py/.
#
######

clean:: ; $(RMF) *~
clean:: ; $(RMF) GameOf24_py_dats.c

######

cleanall:: clean
cleanall:: ; $(RMF) GameOf24_py_dats.py
cleanall:: ; $(RMF) libatscc2py/*_cats.py
cleanall:: ; $(RMF) libatscc2py/*_dats.py
cleanall:: ; $(RMRF) libatscc2py/__pycache__

###### end of [Makefile] ######
