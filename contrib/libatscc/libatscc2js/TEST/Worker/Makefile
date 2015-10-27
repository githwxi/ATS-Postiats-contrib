#
# A simple Makefile
#
######
#
PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
#
ATSCC2JS=$(PATSHOME)/bin/atscc2js
#
######

all:: rpc_client_dats.js
all:: rpc_server_dats_.js

######
#
rpc_client_dats.c: rpc_client.dats; $(PATSOPT) -o $@ -d $<
rpc_client_dats.js: rpc_client_dats.c; $(ATSCC2JS) -o $@ -i $<
#
rpc_server_dats.c: rpc_server.dats; $(PATSOPT) -o $@ -d $<
rpc_server_dats.js: rpc_server_dats.c; $(ATSCC2JS) -o $@ -i $<
#
rpc_server_dats_.js: rpc_server_dats.js; $(CAT) ./../../libatscc2js_all.js $< > $@
#
######


CAT=cat
RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c

######

cleanall:: clean
cleanall:: ; $(RMF) rpc_client_dats.js
cleanall:: ; $(RMF) rpc_server_dats.js
cleanall:: ; $(RMF) rpc_server_dats_.js

###### end of [Makefile] ######
