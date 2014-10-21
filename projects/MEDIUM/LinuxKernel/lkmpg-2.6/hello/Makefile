#
# Makefile for compiling modules
#

######

obj-m += hello-1.o

######

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

######

clean:: ; rm -f *~

######

cleanall:: clean
cleanall:: ; make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

###### end of [Makefile] ######
