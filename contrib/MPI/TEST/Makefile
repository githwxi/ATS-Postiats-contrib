#
# A simple Makefile
#

######

MPICC=mpicc

######

PATSHOMEQ="${PATSHOME}"

######

PATSCC=$(PATSHOMEQ)/bin/patscc
PATSOPT=$(PATSHOMEQ)/bin/patsopt

######

INCLUDE := -I${PATSHOME}
INCLUDE += -I${PATSHOME}/ccomp/runtime 
INCLUDE += -I${PATSHOMERELOC}/contrib

######

all::
regress::

######

all:: \
mpi_hello
mpi_hello: \
mpi_hello_dats.c ; \
$(MPICC) $(INCLUDE) -o $@ $<
mpi_hello_dats.c : mpi_hello.dats; $(PATSCC) -ccats $<

######

regress:: \
mpi_hello; mpirun -n 4 ./mpi_hello

######

clean:: ; rm -f *~
clean:: ; rm -f *.o
clean:: ; rm -f *_dats.c

cleanall:: clean
cleanall:: ; rm -f mpi_hello

###### end of [Makefile] ######
