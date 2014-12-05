#
# A simple Makefile
#

######

include $(PATSHOME)/share/atsmake-pre.mk

######
#
# You may need to change this:
#
JNIincl=/usr/lib/jvm/java-7-openjdk-amd64/include
#
######

all:: Calculator

######

Calculator:: Gradle
Calculator:: Calculator.h
Calculator:: libCalculator_dats.so

######

JAVA=java
CLASSPATH=build/classes/main

######
#
Gradle: ; gradle build
Calculator.h: ; javah -cp $(CLASSPATH) Calculator
#
Calculator_dats.o: Calculator.dats; \
$(PATSCC) -D_GNU_SOURCE $(INCLUDE) $(INCLUDE_ATS) \
  -IIATS $(PATSHOME)/contrib -I$(JNIincl) -DATS_MEMALLOC_LIBC -fPIC -c Calculator.dats
#
######

libCalculator_dats.so: \
Calculator_dats.o ; gcc -shared -o $@ -Wl,-soname,$@ $< -ldl

######

test:: ; $(JAVA) -cp build/classes/main -Djava.library.path=. Calculator

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

######

###### end of [Makefile] ######
