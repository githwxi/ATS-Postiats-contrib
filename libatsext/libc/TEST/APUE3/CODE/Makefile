#
# APUE3-in-ATS2
#

######

CCOMP=gcc

######

APUE3=./..

######

INCLUDE=-I$(PATSHOMERELOC)

######

include $(PATSHOME)/share/atsmake-pre.mk

######

apue3e_error.o: \
$(APUE3)/apue.3e/lib/error.c ; \
$(CCOMP) -I$(APUE3)/apue.3e/include -c -o $@ $<

######
#
all:: \
APUE3-1-3
APUE3-1-3: \
APUE3-1-3.dats \
apue3e_error.o ; \
$(PATSCC2) $(INCLUDE) -o $@ $< apue3e_error.o
cleanall:: ; $(RMF) APUE3-1-3
#
######

include $(PATSHOME)/share/atsmake-post.mk

######

cleanats:: ; $(RMF) *_?ats.c

######

cleanall:: ; $(RMF) apue3_error.o

######

###### end of [Makefile] ######
