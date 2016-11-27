#
# A simple Makefile
#

######

PYTHON=python3
export PYTHONPATH=libatscc2py3/.

######

PATSCC=${PATSHOME}/bin/patscc
ATSCC2PY=${PATSHOME}/bin/atscc2py3

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
libatscc2py3:: ; \
$(CPRF) $(PATSHOME_contrib)/contrib/libatscc/libatscc2py3/output/* libatscc2py3/.
#
######

clean:: ; $(RMF) *~
clean:: ; $(RMF) GameOf24_py_dats.c

######

cleanall:: clean
cleanall:: ; rm -rf libatscc2py3/*
cleanall:: ; $(RMF) GameOf24_py_dats.py

###### end of [Makefile] ######
