#
# Modify ldflags so that Z3 and Python are linked in.
#
LDFLAGS += $(shell python-config --libs --ldflags)
LDFLAGS += -lz3

PATSOLVE_OBJECTS += solving/Z3/z3.o

setup:: ; make -C solving/Z3
