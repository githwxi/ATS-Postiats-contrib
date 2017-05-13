######
#
# A Simple Makefile
#
######

make=make
CPRF=cp -rf
RMRF=rm -rf

######

copy:: ; $(CPRF) DATS/* BUILD/.

######

build:: ; \
$(MAKE) -C BUILD -f ../Makefile_build

######

testall:: ; $(MAKE) -C TEST testall 

######

cleanall:: ; $(RMRF) ./BUILD/*.o
cleanall:: ; $(RMRF) ./BUILD/*.c
cleanall:: ; $(RMRF) ./BUILD/*.dats
cleanall:: ; $(RMRF) ./BUILD/PARSING
cleanall:: ; $(RMRF) ./BUILD/EVALING
cleanall:: ; $(RMRF) ./BUILD/utfpleval

######

###### end of [Makefile] ######
