#
# A Simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
PATSLIB=$(PATSHOME)/ccomp/atslib/lib

######

RMF=rm -f

######

all:: \
tcpclient_daytime
tcpclient_daytime: \
tcpclient_daytime.dats ; \
$(PATSCC) $(CFLAGS) -o $@ $< -L $(PATSLIB) -latslib
regress:: tcpclient_daytime; ./$<
cleanall:: ; $(RMF) tcpclient_daytime

######

all:: \
tcpserver_daytime
tcpserver_daytime: \
tcpserver_daytime.dats ; \
$(PATSCC) $(CFLAGS) -o $@ $< -L $(PATSLIB) -latslib
#
# regress:: tcpserver_daytime; ./$<
#
cleanall:: ; $(RMF) tcpserver_daytime

######

all_scons:: ; scons -Q

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c

######

cleanall:: clean

######

###### end of [Makefile] ######
