######

JAVA=java
JAVAC=javac

######

all:: test01

######
#
test01: \
test01.class; \
$(JAVA) -cp ".:./../classes" test01
#
test01.class: \
test01.java; $(JAVAC) -cp "./../classes" $<
#
######

clean:: ; rm -f *~

cleanall:: clean
cleanall:: ; rm -f test01.class

###### end of [Makefile] ######
