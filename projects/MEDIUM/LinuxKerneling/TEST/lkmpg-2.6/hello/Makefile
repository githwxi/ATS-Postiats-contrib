#
# Makefile for compiling modules
#

######

obj-m += hello-1.o
obj-m += hello-2.o

######

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

######

RMF=rm -f

######

clean:: ; $(RMF) *~

######

cleanall:: clean
cleanall:: ; make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

###### end of [Makefile] ######
