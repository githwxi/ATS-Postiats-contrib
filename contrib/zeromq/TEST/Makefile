#
# A simple Makefile
#

######

include $(PATSHOME)/share/atsmake-pre.mk
include $(PATSHOME)/share/atsmake-post.mk

######

all::

######

all:: \
test00
test00: test00.dats ; \
  $(PATSCC2) -I${PATSHOME}/contrib -o $@ $< -lzmq
cleanall:: ; $(RMF) test00

######

all:: \
hwserver
hwserver: hwserver.dats ; \
  $(PATSCC2) -I${PATSHOME}/contrib -o $@ $< testlib.dats -lzmq
cleanall:: ; $(RMF) hwserver

all:: \
hwclient
hwclient: hwclient.dats ; \
  $(PATSCC2) -I${PATSHOME}/contrib -o $@ $< testlib.dats -lzmq
cleanall:: ; $(RMF) hwclient

######

RMF=rm -f

######

cleanats:: ; $(RMF) *_?ats.c

###### end of [Makefile] ######
