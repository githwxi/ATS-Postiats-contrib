#
# Testing the External Constraint Solver on new domains
# 
PATSOPT=$(PATSHOME)/bin/patsopt
PATSCC=$(PATSHOME)/bin/patscc

all:: test

test: tc_array_insort \
      tc_array_quicksort \
      tc_list_insort \
      tc_bithack \
      tc_uninterp

# Testing out type checking

tc_array_insort: array_insort.dats ../SMT/insort.py
	$(PATSOPT) --constraint-export -tc -d $< | patsolve -s ../SMT/insort.py

tc_array_quicksort: array_quicksort.dats ../SMT/stampseq.py
	$(PATSOPT) --constraint-export -tc -d $< | patsolve -s ../SMT/stampseq.py

tc_list_insort: list_insort.dats ../SMT/insort.py
	$(PATSOPT) --constraint-export -tc -d $< | patsolve -s ../SMT/insort.py

tc_bithack: bithack.dats ../SMT/bitvec.py
	$(PATSOPT) --constraint-export -tc -d $< | patsolve -s ../SMT/bitvec.py

tc_uninterp: uninterp.dats ../SMT/uninterp.py
	$(PATSOPT) --constraint-export -tc -d $< | patsolve -s ../SMT/uninterp.py


# Compiling Programs
#
build: sort_insort sort_quicksort list_insort

array_insort.o: array_insort.dats tc_array_insort
	$(PATSOPT) --constraint-ignore -o array_insort_dats.c -d $<
	$(CC) -O2 -c -std=c99 -D_XOPEN_SOURCE -DATS_MEMALLOC_LIBC \
	-I $(PATSHOME) -I $(PATSHOME)/ccomp/runtime \
	-I $(PATSHOME) array_insort_dats.c -o $@

array_quicksort.o: array_quicksort.dats tc_array_quicksort 
	$(PATSOPT) --constraint-ignore -o array_quicksort_dats.c -d $<
	$(CC) -O2 -c -std=c99 -D_XOPEN_SOURCE -DATS_MEMALLOC_LIBC \
	-I $(PATSHOME) -I $(PATSHOME)/ccomp/runtime \
	-I $(PATSHOME) array_quicksort_dats.c -o $@

sort_insort: sort.c array_insort.o
	gcc -std=c99 -D_XOPEN_SOURCE=600 -O2 -o $@ $^

sort_quicksort: sort.c array_quicksort.o
	gcc -std=c99 -D_XOPEN_SOURCE=600 -O2 -o $@ $^

.phony: clean

clean:
	rm -f *_dats.c *_dats.o sort_insort sort_quicksort
