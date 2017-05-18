#
# A simple Makefile
#

######

include $(PATSHOME)/share/atsmake-pre.mk
include $(PATSHOME)/share/atsmake-post.mk

######
#
# You may need to change this:
#
JNIincl=$(PATSCONTRIB)/contrib
#
######
#
# How to test: java -Djava.library.path=. GameOf24
#
######

all:: GameOf24

######

GameOf24:: GameOf24.h
GameOf24:: GameOf24.class
GameOf24:: libGameOf24_dats.so

######

GameOf24.h: GameOf24.class ; javah ./$<

######
#
# GameOf24.class: GameOf24.java ; javac $<
# GameOf24_dats.o: GameOf24.dats; $(PATSCC2) -I$(JNIincl) -DATS_MEMALLOC_LIBC -fPIC -c $<
# libGameOf24_dats.so: GameOf24_dats.o ; gcc -shared -o $@ -Wl,-soname,$@ $< -ldl -L$(PATSLIB) -latslib
#
# HX-2013: Causing a crash:
# GameOf24.class: GameOf24.java ; javac $<
# GameOf24_dats.o: GameOf24.dats; $(PATSCC2) -I$(JNIincl) -DATS_MEMALLOC_GCBDW -fPIC -c $<
# libGameOf24_dats.so: GameOf24_dats.o ; gcc -shared -o $@ -Wl,-soname,$@ $< -ldl -L$(PATSLIB) -lgc -latslib
#
# HX-2014-11-13: not working yet
#
GameOf24_gcj:: \
GameOf24.class GameOf24_dats.o ; \
gcj -fjni -o $@ GameOf24.class GameOf24_dats.o --main=GameOf24 -L$(PATSLIB) -latslib
GameOf24.class: GameOf24.java ; gcj -C $<
GameOf24_dats.o: GameOf24.dats; $(PATSCC2) -I$(JNIincl) -DATS_MEMALLOC_LIBC -fPIC -c $<
GameOf24_gcj:: \
libGameOf24_dats.so
libGameOf24_dats.so: GameOf24_dats.o ; gcc -shared -o $@ -Wl,-soname,$@ $< -ldl -L$(PATSLIB) -latslib
#
######

regress:: ; \
java -Djava.library.path=. GameOf24

######

testall:: all
testall:: regress
testall:: cleanall

######

RMF=rm -f

######

cleanats:: ; $(RMF) GameOf24_dats.c

######

cleanall:: cleanats
cleanall:: ; $(RMF) GameOf24.h
cleanall:: ; $(RMF) GameOf24.class
cleanall:: ; $(RMF) libGameOf24_dats.so
cleanall:: ; $(RMF) GameOf24_gcj

######

###### end of [Makefile] ######
