PYTHON_PREFIX = $(shell python-config --prefix)

#
# Modify cflags so that Z3's C API is found
#
CFLAGS += ${PYTHON_PREFIX}/include
#
# Modify ldflags so that Z3 and Python are linked in.
#
LDFLAGS += $(shell python-config --libs --ldflags)
#
# Z3 is stored with Python by default, so try to add the 
# appropriate directories.
#
LDFLAGS +=  -L ${PYTHON_PREFIX}/lib
LDFLAGS += -lz3

PATSOLVE_OBJECTS += solving/Z3/z3.o

setup:: ; make -C solving/Z3
