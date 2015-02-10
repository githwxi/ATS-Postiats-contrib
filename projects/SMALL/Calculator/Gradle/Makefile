#
# A simple Makefile
#

######

all:: ; gradle -b build.gradle buildall

######

test:: ; java -cp build/classes/main -Djava.library.path=. Calculator

######

RMF=rm -f
RMRF=rm -rf

######

clean::; $(RMF) *~
clean::; $(RMF) Calculator.h
clean::; $(RMF) Calculator_dats.o
clean::; $(RMF) Calculator_dats.c

cleanall:: clean
cleanall:: ; $(RMF) libCalculator_dats.so
cleanall:: ; $(RMRF) build
cleanall:: ; $(RMRF) .gradle

###### end of [Makefile] ######
