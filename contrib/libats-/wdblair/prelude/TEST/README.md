patsolve test
=============

In this folder you will find some ATS programs that try
out the experimental prelude that features new static sorts
provided by SMT solvers such as

   - stamp sequences (arrays)
   - fixed width bit vectors
   - uninterpreted functions


To test our type checking using the external constraint solver, make sure
you built patsolve (in projects/MEDIUM/ATS-extsolve) and run the following

    make


Verified qsort
==============

As a demonstration of how ATS can be used to develop verified low
level programs, we implement the qsort libc function in array_insort.dats
and array_quicksort.dats using insertion sort and quicksort, respectively.
In both cases, the SMT solver proves that the function modifies the buffer
so that it is sorted and has the same length. For Insertion Sort, we also
prove the result is a permutation of its input, but we did not verify this
for quicksort.

Both programs make heavy use of pointer arithmetic which is verified as safe
by using linear types with views. Both of these programs are a little rough 
on the eyes, and I wonder if using abstract types with templates could 
simplify the code without compromising the verification result or the 
efficancy.

### Running qsort

These sorting routines implement the qsort function given in the C library.
There's a client program called sort.c that uses our qsort function to sort
a buffer of structs. You can compile the sorting program for both quicksort
and insertion sort by running the following

    make build

This builds `sort_insort` and `sort_quicksort`, simply run them from the
commandline to see them sort randomly generated data.

Sorting Lists
=============

The file `list_insort.dats` has a more manual approach to verifying insertion
sort for linked lists. Manual in this case means it relies less on the SMT
solver and more on proof terms constructed by the programmer. There are also
a couple examples in `list_insort.dats` that are similar to examples made with
the Liquid Haskell framework.

Bit Hacks
=========

I implemented some of the bit twiddling hacks found online[bits]. For
most of these, a simple specification of how the function works is given
in python to the SMT solver (in SMT/bitvec.py) and then the optimization
is implemented in ATS. The SMT solver automatically proves the implementation
is equivalent to the specification.

Unfortunately, this won't work for algorithms that the SMT solver does not
understand, such as counting the number of bits that are set in an integer.
For these problems, we can use Programming with Theorem Proving to bridge
the gap between what we want to prove and what our constraint solver 
understands. The examples I give using this technique are counting bits 
the naive way (shifting the number one bit and a time and counting how 
many times the least significant bit is set) and through Brian Kernighan's
bit counting algorithm (clearing the least significant set bit at each step).

Uninterpreted Functions
========================

Algorithms can sometimes be described as recurrence relations. For example,
everyone knows that the nth fibonacci number f_n = f_{n-1} + f_n_{n-2}, but
a naive recursive implementation of this relation gives us an exponential
time algorithm. In these examples, we give recursive relations to the SMT 
solvers in python (../SATS/uninterp.py) to describe several algorithms 
(factorial, fibonacci, Euclid's Algorithm) and then implement the algorithm 
in ATS. The SMT solver then automatically checks that our code is 
equivalent to the specification we gave it. 

[bits]: https://graphics.stanford.edu/~seander/bithacks.html
