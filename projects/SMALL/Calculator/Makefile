######
#
# A Simple Makefile
#
######

CPF=cp -f
RMF=rm -f
MAKE=make

######

copy:: ; \
$(CPF) src/*.?ats BUILD/.

######

build:: ; \
$(MAKE) \
-C BUILD -f ../Makefile_build

######

testall:: copy
testall:: build
testall:: clean

######
#
clean:: ; $(RMF) ./BUILD/*.o
clean:: ; $(RMF) ./BUILD/*.c
clean:: ; $(RMF) ./BUILD/*.?ats
#
######
#
cleanall:: clean
#
cleanall:: ; $(RMF) ./BUILD/calc
#
######

###### end of [Makefile] ######
