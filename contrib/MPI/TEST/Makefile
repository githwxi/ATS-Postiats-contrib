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
INCLUDE += -I${PATSCONTRIB}/contrib

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

all:: \
mpi_hello2
mpi_hello2: \
mpi_hello2_dats.c ; \
$(MPICC) $(INCLUDE) -o $@ $<
mpi_hello2_dats.c : mpi_hello2.dats; $(PATSCC) -ccats $<

######

regress:: \
mpi_hello; mpirun -n 4 ./mpi_hello
regress:: \
mpi_hello2; mpirun -n 4 ./mpi_hello2

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; rm -f *~
clean:: ; rm -f *.o
clean:: ; rm -f *_dats.c

cleanall:: clean
cleanall:: ; rm -f mpi_hello
cleanall:: ; rm -f mpi_hello2

###### end of [Makefile] ######
