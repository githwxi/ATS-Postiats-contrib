(* ****** ****** *)

(*
** Permission to use, copy, modify, and distribute this software for any
** purpose with or without fee is hereby granted, provided that the above
** copyright notice and this permission notice appear in all copies.
** 
** THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
** WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
** MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
** ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
** WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
** ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
** OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
*)

(* ****** ****** *)

(*
** Author: Brandon Barker
** Authoremail: bbarkerATgmailDOTcom
** Start time: May, 2014
*)

(* ****** ****** *)

(*
** Author: Hongwei Xi
** Authoremail: gmhwxiATgmailDOTcom
** Start time: June, 2014
*)

(* ****** ****** *)

%{#
//
#include "./../CATS/omp.cats"
//
%} // end of [%{#]

(* ****** ****** *)

#define ATS_PACKNAME "ATSCNTRB.OpenMP"
#define ATS_EXTERN_PREFIX "atscntrb_openmp_" // prefix for external names

(* ****** ****** *)

fun omp_get_num_procs (): int = "mac#%"

(* ****** ****** *)

fun omp_get_num_threads (): int = "mac#%"
fun omp_set_num_threads (n:int): void = "mac#%"

(* ****** ****** *)
  
fun omp_get_max_threads (): int = "mac#%"
  
(* ****** ****** *)

fun omp_get_thread_num ((*void*)): int = "mac#%"

(* ****** ****** *)
//
fun
pragma_omp_barrier (): void = "mac#%"
//
(* ****** ****** *)
//
absview omp_parallel_private_v
//
fun
pragma_omp_parallel_private_beg
  (tid: int?)
: (omp_parallel_private_v | void) = "mac#%"
//
fun
pragma_omp_parallel_private_end
  (pf: omp_parallel_private_v | (*void*)): void = "mac#%"
//
(* ****** Work Sharing Constructs ****** *)
//
fun
pragma_omp_parallel_for (): void = "mac#%"
//

(* ****** ****** *)

(* end of [omp.sats] *)
