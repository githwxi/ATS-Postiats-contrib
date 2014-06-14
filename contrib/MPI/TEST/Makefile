#
# A simple Makefile
#

######

MPICC=mpicc

######

mpi_hello: \
mpi_hello.c ; $(MPICC) -o $@ $<

######

test:: mpi_hello; mpirun -n 4 ./mpi_hello

######

clean:: ; rm -f *~
clean:: ; rm -f *.o

cleanall:: clean
cleanall:: ; rm -f mpi_hello

###### end of [Makefile] ######
