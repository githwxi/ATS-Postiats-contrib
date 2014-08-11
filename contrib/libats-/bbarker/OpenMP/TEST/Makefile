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
omp_hello omp_for
omp_hello: \
omp_hello.dats ; $(PATSCC) -I$(PATSHOMERELOC)/contrib -fopenmp -o $@ $<
omp_for: \
omp_for.dats ; $(PATSCC) -I$(PATSHOMERELOC)/contrib -fopenmp -DATS_MEMALLOC_LIBC -o $@ $<
cleanall:: ; $(RMF) omp_for

######

regress:: omp_hello; ./omp_hello
regress:: omp_for; ./omp_for

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *.o
clean:: ; $(RMF) *_?ats.c

######

cleanall:: clean

###### end of [Makefile] ######
