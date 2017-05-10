# Learn ATS by Solving Math Puzzles

## Project Description

ATS is equipped with a highly expressive type system rooted
in the framework Applied Types System, which also gives the
language its name. It is, however, non-trivial to make effective
use of types in ATS. Many people wanted to learn ATS and made
a great deal of effort to do so but failed at the end.

In the past, I found that solving math puzzles in ATS could greatly help
someone learn dependent types and theorem-proving. In this project, I am
seeking help from the ats-lang-users community as well as other people
interested in ATS to translate into ATS some of the problems published at
[Project Euler](https://projecteuler.net). The ATS code translated from the
description of a problem is referred to as a formal specification for the
problem. It is my hope that there will be considerably large interest
(originated from the ats-lang-users community and elsewhere) in
implementing the specifications posted here.

I will be eagerly collecting both specifications and their implementations.
Note that a problem may be given multiple specificatons (of varying degree
of accuracy or completeness) and each specification may be implemented in many
different styles.

## The very first example

Please follow the [link](https://projecteuler.net/problem=1) to find the
first problem at Project Euler. Let us use P1 to refer to this problem.
For easy access, the description of P1 is pasted as follows:

```text
If we list all the natural numbers below 10 that are multiples of 3 or 5,
we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
```

Here is one way to translate this description into ATS code:

```ocaml
(* ****** ****** *)
//
// SUM35 (n, t) =
// sum of i <= n such that i mod 3 = 0 or i mod 5 = 0
//
dataprop SUM35
(
  int(*n*), int(*t*)
) =
  | SUM35bas (0, 0) of ()
  | {n:pos}{s1:nat}
    SUM35ind1 (n, s1+n) of (SUM35 (n-1, s1), MOD (n, 3, 0))
  | {n:pos}{s1:nat}
    SUM35ind2 (n, s1+n) of (SUM35 (n-1, s1), MOD (n, 5, 0))
  | {n:pos}{s1:nat}{r3,r5:pos}
    SUM35ind3 (n, s1) of (SUM35 (n-1, s1), MOD (n, 3, r3), MOD (n, 5, r5))
// end of [SUM35]
//
(* ****** ****** *)
//
// HX-2015-01-13:
// please implement this one:
//
fun sum35{n:nat}(n: int n): [t:nat] (SUM35 (n, t) | int t)
//
(* ****** ****** *)
```

If an implementation of the function `sum35` passes typechecking in ATS,
then its return value from a call on 1000 is *guaranteed* to yield the
correct answer to P1. This is really just a tiny showcase for the powerful
paradigm of programming with theorem-proving (PwTP) in ATS.

## List of Problems Having Specifications

* [P1](https://github.com/githwxi/ATS-Postiats-contrib/blob/master/projects/MEDIUM/PEULER/P1/.):
  See [description](https://projecteuler.net/problem=1)
* [P2](https://github.com/githwxi/ATS-Postiats-contrib/blob/master/projects/MEDIUM/PEULER/P2/.):
  See [description](https://projecteuler.net/problem=2)
* [P15](https://github.com/githwxi/ATS-Postiats-contrib/blob/master/projects/MEDIUM/PEULER/P15/.):
  See [description](https://projecteuler.net/problem=15)
* [P16](https://github.com/githwxi/ATS-Postiats-contrib/blob/master/projects/MEDIUM/PEULER/P16/.):
  See [description](https://projecteuler.net/problem=16)

Please try to contribute either a specification or a solution
(that is, implementation), or both. The success of this project
relies on the joint effort of the ats-lang-users community and beyond.
Thanks!

## The End of [README.md]
