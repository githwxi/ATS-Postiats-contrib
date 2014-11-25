#
# A Simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
PATSLIB=$(PATSHOME)/ccomp/atslib/lib

######

CLFAGS =
CLFAGS += -D_BSD_SOURCE

######

RMF=rm -f

######

all:: \
tcpclient_daytime
tcpclient_daytime: \
tcpclient_daytime.dats ; \
$(PATSCC) $(CFLAGS) -o $@ $< -L $(PATSLIB) -latslib

######

all:: \
tcpserver_daytime
tcpserver_daytime: \
tcpserver_daytime.dats ; \
$(PATSCC) $(CFLAGS) -o $@ $< -L $(PATSLIB) -latslib

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c

######

cleanall:: clean
cleanall:: ; $(RMF) tcpclient_daytime
cleanall:: ; $(RMF) tcpserver_daytime

######

###### end of [Makefile] ######


