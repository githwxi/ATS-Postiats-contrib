#
# For generating libatscc2erl
#

######

PATSOPT=$(PATSHOME)/bin/patsopt
ATSCC2JS=$(PATSHOME)/bin/atscc2erl

######

CAT=cat
CPF=cp -f
RMF=rm -f

######
#
DATE=date
ECHO=echo -n
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

#
all_in_one:: ; \
  $(ECHO) '\n%% ****** ****** %%\n' | $(CAT) - >>libatscc2erl_all.hrl
all_in_one:: ; \
  $(ECHO) '\n%% end of [libatscc2erl_all.hrl] %%\n' | $(CAT) - >>libatscc2erl_all.hrl
#
#######

clean:: ; $(RMF) *~ */*~

#######

cleanall:: clean
cleanall:: ; $(RMF) libatscc2erl_all.hrl

#######

###### end of [Makefile] ######
