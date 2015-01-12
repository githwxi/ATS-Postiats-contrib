#
# A simple Makefile
#

######

include \
$(PATSHOME)/share/atsmake-pre.mk

######

PATSCCOMP = $(CC) -D_XOPEN_SOURCE

######

######
#
# You may need to change this:
#
JNIincl=/usr/lib/jvm/java-7-openjdk-amd64/include
#
######

all:: Calculator

######

Calculator:: Calculator.h
Calculator:: Calculator.class
Calculator:: libCalculator_dats.so

######
#
Calculator.h: \
Calculator.class; javah Calculator
Calculator.class: Calculator.java ; javac $<
#
Calculator_dats.o: Calculator.dats; \
$(PATSCC) -D_GNU_SOURCE $(INCLUDE) $(INCLUDE_ATS) \
  -IIATS $(PATSHOMERELOC)/contrib -I$(JNIincl) -DATS_MEMALLOC_LIBC -fPIC -c Calculator.dats
#
######

libCalculator_dats.so: Calculator_dats.o ; gcc -shared -o $@ -Wl,-soname,$@ $< -ldl

######

JAVA=java

######

test:: ; $(JAVA) -cp . -Djava.library.path=. Calculator

######

RMF=rm -f

######

clean::; $(RMF) *~
clean::; $(RMF) Calculator.h
clean::; $(RMF) Calculator_dats.o
clean::; $(RMF) Calculator_dats.c

cleanall:: clean
cleanall::; $(RMF) Calculator.class
cleanall:: ; $(RMF) libCalculator_dats.so

######

###### end of [Makefile] ######
