#
# A Simple Makefile
#

######

ERL=erl
ERLC=erlc

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
PATSOPT2=$(PATSOPT) --tlcalopt-disable

######

ATSCC2ERL=$(PATSHOME)/bin/atscc2erl

######

all::
regress::
cleanall::

######

%_dats.erl: \
%.dats ; $(PATSOPT2) -d $< | $(ATSCC2ERL) -o $@
%_dats.beam: \
%_dats.erl; \
$(ERLC) -I $(PATSHOMERELOC)/contrib/libatscc/libatscc2erl $<

######
#
all:: myrftp_server_dats.beam
cleanall:: ; $(RMF) myrftp_server_dats.erl
cleanall:: ; $(RMF) myrftp_server_dats.beam
#
MYRFTPD: \
myrftp_server_dats.beam; \
$(ERL) -sname myrftpd@localhost -setcookie cs520
#
# Then do:
# myrftp_server_dats:main0_erl()
#
######
#
all:: myrftp_client_dats.beam
cleanall:: ; $(RMF) myrftp_client_dats.erl
cleanall:: ; $(RMF) myrftp_client_dats.beam
#
MYRFTP_TEST: \
myrftp_client_dats.beam; \
$(ERL) -noinput \
  -sname myrftp_client@localhost -setcookie cs520
#
# Then do:
# myrftp_client_dats:main0_erl()
#
######

testall:: all
testall:: regress
testall:: cleanall

######

CPF=cp -f
CPRF=cp -rf
RMF=rm -f
RMRF=rm -rf

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c
clean:: ; $(RMF) erl_crash.dump

######

cleanall:: clean

###### end of [Makefile] ######
