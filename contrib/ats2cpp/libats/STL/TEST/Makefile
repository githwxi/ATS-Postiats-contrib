######
#
PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
#
######
#
CXXFLAGS = $(MYCFLAGS)
#
######
#
MYCFLAGS := -fpermissive -w
#
MYCFLAGS += -D_ATS_CCOMP_HEADER_NONE_
MYCFLAGS += -D_ATS_CCOMP_PRELUDE_NONE_
MYCFLAGS += -D_ATS_CCOMP_PRELUDE_USER_='"pats_ccomp.h"'
# MYCFLAGS += -D_ATS_CCOMP_RUNTIME_NONE_
MYCFLAGS += -D_ATS_CCOMP_EXCEPTION_NONE_
MYCFLAGS += -D_ATS_CCOMP_RUNTIME_TRYWITH_NONE_
#
# MYCFLAGS += -D ATSLIB_LIBATS_LIBC_CATS_STDIO
# MYCFLAGS += -D ATSLIB_LIBATS_LIBC_CATS_SYS_STAT
# MYCFLAGS += -D ATSLIB_LIBATS_LIBC_CATS_SYS_TYPES
#
# MYCFLAGS += -D_ATSTYPE_VAR_SIZE_=1024
#
MYCFLAGS += -I${PATSHOMERELOC}/contrib/ats2cpp
MYCFLAGS += -I${PATSHOMERELOC}/contrib/ats2cpp/H
MYCFLAGS += -I${PATSHOMERELOC}/contrib/ats2cpp/ccomp
#
######

CC=gcc
CPP=g++

######

all::

######
#
all:: \
test_deque_queue
test_deque_queue: \
test_deque_queue_dats.c; $(CPP) $(CXXFLAGS) -o $@ $<
test_deque_queue_dats.c: test_deque_queue.dats; $(PATSOPT) -o $@ -d $<
#
regress:: test_deque_queue; ./$<
cleanall:: ; rm -f test_deque_queue
#
######
#
all:: \
test_vector_array
test_vector_array: \
test_vector_array_dats.c; $(CPP) $(CXXFLAGS) -o $@ $<
test_vector_array_dats.c: test_vector_array.dats; $(PATSOPT) -o $@ -d $<
#
regress:: test_vector_array; ./$<
cleanall:: ; rm -f test_vector_array
#
######
#
all:: \
test_vector_stack
test_vector_stack: \
test_vector_stack_dats.c; $(CPP) $(CXXFLAGS) -o $@ $<
test_vector_stack_dats.c: test_vector_stack.dats; $(PATSOPT) -o $@ -d $<
#
regress:: test_vector_stack; ./$<
cleanall:: ; rm -f test_vector_stack
#
######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.c
clean:: ; rm -f *_?ats.o

######

cleanall:: clean

###### end of [Makefile] ######
