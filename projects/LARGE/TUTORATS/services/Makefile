#
# A simple Makefile
#

######

all::

######

RMF=rm -f
RMRF=rm -rf

######

CPRF=cp -rf

######
#
libatscc2php:: ; \
$(CPRF) $(PATSHOME_contrib)/contrib/libatscc2php/CATS/* libatscc2php/CATS/.
libatscc2php:: ; \
$(CPRF) $(PATSHOME_contrib)/contrib/libatscc2php/output/DATS/* libatscc2php/DATS/.
#
######

clean::

######

cleanall:: clean
cleanall:: ; $(RMRF) libatscc2php/CATS/*
cleanall:: ; $(RMRF) libatscc2php/DATS/*

###### end of [Makefile] ######
