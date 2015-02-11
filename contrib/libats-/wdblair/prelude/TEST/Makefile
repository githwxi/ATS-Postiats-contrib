#
#
#
PATSOPT=$(PATSHOME)/bin/patsopt

all:: test

test: array_insort

array_insort: array_insort.dats ../SMT/stampseq.py
	$(PATSOPT) --constraint-export -tc -d $< | patsolve -s ../SMT/stampseq.py
	
array_insort.o: array_insort.dats array_insort
	$(PATSOPT) --constraint-ignore -o array_insort_dats.c -d $<
	$(CC) -O2 -c -std=c99 -D_XOPEN_SOURCE -DATS_MEMALLOC_LIBC \
	-I $(PATSHOME) -I $(PATSHOME)/ccomp/runtime \
	-I $(PATSHOME) array_insort_dats.c -o array_insort.o

sort: sort.c array_insort.o
	gcc -std=c99 -D_XOPEN_SOURCE=600 -O2 -o $@ $^

build: sort 
