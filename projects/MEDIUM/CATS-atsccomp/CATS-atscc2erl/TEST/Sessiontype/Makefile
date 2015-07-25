#
# For generating
# Sessiontype_mylibats2erl
#

######

PATSOPT=$(PATSHOME)/bin/patsopt
PATSOPT2=$(PATSOPT) --tlcalopt-disable

######

ATSCC2ERL=./../../atscc2erl

######

CAT=cat
CPF=cp -f
RMF=rm -f

######
#
all:: ; \
$(PATSOPT2) -d ./DATS/list.dats | $(ATSCC2ERL) -o ./output/DATS/list_dats.hrl -i
#
all:: ; \
$(PATSOPT2) -d ./DATS/co-list.dats | $(ATSCC2ERL) -o ./output/DATS/co-list_dats.hrl -i
#
all:: ; \
$(PATSOPT2) -d ./DATS/array.dats | $(ATSCC2ERL) -o ./output/DATS/array_dats.hrl -i
#
######
#
DATE=date
ECHO=echo -n
#
all1_in_one:: ; $(ECHO) | $(CAT) - >mylibats2erl1_all.hrl
all1_in_one:: ; $(ECHO) '%%' | $(CAT) - >>mylibats2erl1_all.hrl
all1_in_one:: ; $(ECHO) '\n%% ' | $(CAT) - >>mylibats2erl1_all.hrl
all1_in_one:: ; $(ECHO) 'Time of Generation:' | $(CAT) - >>mylibats2erl1_all.hrl
all1_in_one:: ; $(ECHO) '\n%% ' | $(CAT) - >>mylibats2erl1_all.hrl
all1_in_one:: ; $(DATE) | $(CAT) - >>mylibats2erl1_all.hrl
all1_in_one:: ; $(ECHO) '%%\n\n' | $(CAT) - >>mylibats2erl1_all.hrl
#

all1_in_one:: ; \
$(CAT) >>mylibats2erl1_all.hrl \
CATS/basis1_cats.hrl \
output/DATS/list_dats.hrl \
output/DATS/co-list_dats.hrl \
output/DATS/array_dats.hrl \

#
all1_in_one:: ; \
  $(ECHO) '\n%% ****** ****** %%\n' | $(CAT) - >>mylibats2erl1_all.hrl
all1_in_one:: ; \
  $(ECHO) '\n%% end of [mylibats2erl1_all.hrl] %%\n' | $(CAT) - >>mylibats2erl1_all.hrl
#
######
#
DATE=date
ECHO=echo -n
#
all2_in_one:: ; $(ECHO) | $(CAT) - >mylibats2erl2_all.hrl
all2_in_one:: ; $(ECHO) '%%' | $(CAT) - >>mylibats2erl2_all.hrl
all2_in_one:: ; $(ECHO) '\n%% ' | $(CAT) - >>mylibats2erl2_all.hrl
all2_in_one:: ; $(ECHO) 'Time of Generation:' | $(CAT) - >>mylibats2erl2_all.hrl
all2_in_one:: ; $(ECHO) '\n%% ' | $(CAT) - >>mylibats2erl2_all.hrl
all2_in_one:: ; $(DATE) | $(CAT) - >>mylibats2erl2_all.hrl
all2_in_one:: ; $(ECHO) '%%\n\n' | $(CAT) - >>mylibats2erl2_all.hrl
#

all2_in_one:: ; \
$(CAT) >>mylibats2erl2_all.hrl \
CATS/basis2_cats.hrl \
output/DATS/list_dats.hrl \
output/DATS/co-list_dats.hrl \
output/DATS/array_dats.hrl \

#
all2_in_one:: ; \
  $(ECHO) '\n%% ****** ****** %%\n' | $(CAT) - >>mylibats2erl2_all.hrl
all2_in_one:: ; \
  $(ECHO) '\n%% end of [mylibats2erl2_all.hrl] %%\n' | $(CAT) - >>mylibats2erl2_all.hrl
#
######

###### end of [Makefile] ######
