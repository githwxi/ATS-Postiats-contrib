#
MAKE=make
PATSOPT=$(PATSHOME)/bin/patsopt
#
all:: \
BlinkTalk_dats.ino
BlinkTalk_dats.ino: \
BlinkTalk.dats; $(PATSOPT) -o $@ --dynamic $<
#
all:: ; $(MAKE) -f Makefile_ino
#
RMF=rm -f
#
clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c
#
cleanall:: clean
cleanall:: ; $(MAKE) -f Makefile_ino clean
cleanall:: ; $(RMF) *_dats.ino
#
###### end of [Makefile] ######
