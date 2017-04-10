#
# For generating
# Sessiontype_mylibats2erl
#

######

PATSOPT=$(PATSHOME)/bin/patsopt
PATSOPT2=$(PATSOPT) --tlcalopt-disable

######

ATSCC2ERL=$(PATSHOME)/bin/atscc2erl

######

CAT=cat
CPF=cp -f
RMF=rm -f

######
#
all:: ; \
$(PATSOPT2) -d ./DATS/sslist.dats | $(ATSCC2ERL) -o ./output/DATS/sslist_dats.hrl -i
#
all:: ; \
$(PATSOPT2) -d ./DATS/co-sslist.dats | $(ATSCC2ERL) -o ./output/DATS/co-sslist_dats.hrl -i
#
all:: ; \
$(PATSOPT2) -d ./DATS/ssarray.dats | $(ATSCC2ERL) -o ./output/DATS/ssarray_dats.hrl -i
#
######
#
DATE=/bin/date
ECHO=/bin/echo -en
#
all_in_one:: ; $(ECHO) | $(CAT) - >mylibats2erl_all.hrl
all_in_one:: ; $(ECHO) '%%' | $(CAT) - >>mylibats2erl_all.hrl
all_in_one:: ; $(ECHO) '\n%% ' | $(CAT) - >>mylibats2erl_all.hrl
all_in_one:: ; $(ECHO) 'Time of Generation:' | $(CAT) - >>mylibats2erl_all.hrl
all_in_one:: ; $(ECHO) '\n%% ' | $(CAT) - >>mylibats2erl_all.hrl
all_in_one:: ; $(DATE) | $(CAT) - >>mylibats2erl_all.hrl
all_in_one:: ; $(ECHO) '%%\n\n' | $(CAT) - >>mylibats2erl_all.hrl
#

all_in_one:: ; \
$(CAT) >>mylibats2erl_all.hrl \
CATS/basis_cats.hrl \
output/DATS/sslist_dats.hrl \
output/DATS/co-sslist_dats.hrl \
output/DATS/ssarray_dats.hrl \

#
all_in_one:: ; \
  $(ECHO) '\n%% ****** ****** %%\n' | $(CAT) - >>mylibats2erl_all.hrl
all_in_one:: ; \
  $(ECHO) '\n%% end of [mylibats2erl_all.hrl] %%\n' | $(CAT) - >>mylibats2erl_all.hrl
#
######

###### end of [Makefile] ######
