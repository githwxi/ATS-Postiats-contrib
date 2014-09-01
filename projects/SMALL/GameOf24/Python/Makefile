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

libupdate: ; \
$(CPRF) $(PATSHOME_contrib)/contrib/libatscc2py/CATS/* ./libatscc2py/CATS

######

clean:: ; $(RMF) GameOf24_py_dats.c

######

cleanall:: clean
cleanall:: ; $(RMF) GameOf24_py_dats.py

###### end of [Makefile] ######
