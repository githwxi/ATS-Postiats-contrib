#
# For generating libatscc2erl
#

######

PATSOPT=$(PATSHOME)/bin/patsopt
ATSCC2ERL=$(PATSHOME)/bin/atscc2erl

######

PATSOPT2=$(PATSOPT) --tlcalopt-disable

######

CAT=cat
CPF=cp -f
RMF=rm -f

######
#
all:: ; \
$(PATSOPT2) \
  -d ./DATS/basics.dats | $(ATSCC2ERL) -o ./output/DATS/basics_dats.hrl -i
#
all:: ; \
$(PATSOPT2) -d ./DATS/list.dats | $(ATSCC2ERL) -o ./output/DATS/list_dats.hrl -i
all:: ; \
$(PATSOPT2) -d ./DATS/option.dats | $(ATSCC2ERL) -o ./output/DATS/option_dats.hrl -i
all:: ; \
$(PATSOPT2) -d ./DATS/intrange.dats | $(ATSCC2ERL) -o ./output/DATS/intrange_dats.hrl -i
#
######
#
DATE=/bin/date
ECHO=/bin/echo -en
#
all_in_one:: ; $(ECHO) | $(CAT) - >libatscc2erl_all.hrl
all_in_one:: ; $(ECHO) '%%' | $(CAT) - >>libatscc2erl_all.hrl
all_in_one:: ; $(ECHO) '\n%% ' | $(CAT) - >>libatscc2erl_all.hrl
all_in_one:: ; $(ECHO) 'Time of Generation:' | $(CAT) - >>libatscc2erl_all.hrl
all_in_one:: ; $(ECHO) '\n%% ' | $(CAT) - >>libatscc2erl_all.hrl
all_in_one:: ; $(DATE) | $(CAT) - >>libatscc2erl_all.hrl
all_in_one:: ; $(ECHO) '%%\n\n' | $(CAT) - >>libatscc2erl_all.hrl
#

all_in_one:: ; \
$(CAT) >>libatscc2erl_all.hrl \
CATS/basics_cats.hrl \
CATS/integer_cats.hrl \
CATS/bool_cats.hrl \
CATS/float_cats.hrl \
CATS/print_cats.hrl \
CATS/reference_cats.hrl \

all_in_one:: ; \
$(CAT) >>libatscc2erl_all.hrl \
CATS/Erlang/file_cats.hrl \

all_in_one:: ; \
$(CAT) >>libatscc2erl_all.hrl \
output/DATS/basics_dats.hrl \
output/DATS/list_dats.hrl \
output/DATS/option_dats.hrl \
output/DATS/intrange_dats.hrl \

#
all_in_one:: ; \
  $(ECHO) '\n%% ****** ****** %%\n' | $(CAT) - >>libatscc2erl_all.hrl
all_in_one:: ; \
  $(ECHO) '\n%% end of [libatscc2erl_all.hrl] %%\n' | $(CAT) - >>libatscc2erl_all.hrl
#
######

clean:: ; $(RMF) *~ */*~

######

cleanall:: clean
cleanall:: ; $(RMF) libatscc2erl_all.hrl

######

###### end of [Makefile] ######
