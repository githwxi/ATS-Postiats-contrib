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
libatscc2js:: ; \
$(CPRF) $(PATSHOME_contrib)/contrib/libatscc2js/CATS libatscc2js/.
libatscc2js:: ; \
$(CPRF) $(PATSHOME_contrib)/contrib/libatscc2js/output/DATS libatscc2js/.
#
libatscc2php:: ; \
$(CPRF) $(PATSHOME_contrib)/contrib/libatscc2php/CATS libatscc2php/.
libatscc2php:: ; \
$(CPRF) $(PATSHOME_contrib)/contrib/libatscc2php/output/DATS libatscc2php/.
#
######

clean::

######

cleanall:: clean
cleanall:: ; $(RMRF) libatscc2php/CATS/*
cleanall:: ; $(RMRF) libatscc2php/DATS/*

###### end of [Makefile] ######
