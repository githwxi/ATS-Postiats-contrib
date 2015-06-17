#
# For testing ATS-extsolve-z3
#
######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

PATSOLVE=$(PATSHOME)/bin/patsolve_z3

######

all::

######
#
all:: ; \
$(PATSOPT) -tc --constraint-export -d ./DATS/gflist.dats | $(PATSOLVE) -i
#
######

###### end of [Makefile_test] ######
