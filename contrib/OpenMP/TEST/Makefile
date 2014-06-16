#
# A simple Makefile
#

######

GCC=gcc

######

PATSHOMEQ="$(PATSHOME)"
PATSHOMERELOCQ="$(PATSHOMERELOC)"

######

PATSCC=$(PATSHOMEQ)/bin/patscc
PATSOPT=$(PATSHOMEQ)/bin/patsopt

######

all::
regress::

######

# all:: \
# omp_hello
# omp_hello: \
# omp_hello.c ; $(GCC) -fopenmp -o $@ $<

######

all:: \
omp_hello
omp_hello: \
omp_hello.dats ; $(PATSCC) -I$(PATSHOMERELOC)/contrib -fopenmp -o $@ $<
cleanall:: ; $(RMF) omp_hello

######

regress:: omp_hello; ./omp_hello

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *.o
clean:: ; $(RMF) *_?ats.c

######

cleanall:: clean

###### end of [Makefile] ######
