(* ****** ****** *)
//
// API for MPI in ATS
//
(* ****** ****** *)
(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2011-2014 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
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
//
// Author: Hongwei Xi
// Authoremail: gmhwxiATgmailDOTcom
// Starting time: October 15, 2014
//
(* ****** ****** *)

%{#
//
#include "./../CATS/mpi.cats" // HX: wrapping around API for MPI in C
//
%} // end of [%{#]
//

staload "prelude/basics_dyn.sats"

(* ****** ****** *)

#define ATS_PACKNAME "ATSCNTRB.MPI"
#define ATS_EXTERN_PREFIX "atscntrb_mpi_" // prefix for external names

(* ****** ****** *)

typedef interr(i:int) = int(i)
typedef Interr = [i:nat] interr(i)

(* ****** ****** *)

typedef MPI_Comm = $extype"MPI_Comm"

(* ****** ****** *)


fun MPI_Init
  {n:int | n >= 1}
(
  argc: int n, argv: !argv(n)
): int = "mac#%"

(* ****** ****** *)

fun MPI_Finalize
(
): int = "mac#%"

(* ****** ****** *)


fun MPI_Comm_size
(
  comm: MPI_Comm, size: &int? >> _
): int = "mac#%"

(* ****** ****** *)

fun MPI_Comm_rank
(
  comm: MPI_Comm, rank: &int? >> _
): int = "mac#%"

(* ****** ****** *)

fun MPI_Get_processor_name
(
  name: ptr, resultlen: &int? >> _
): int = "mac#%"


macdef 
MPI_MAX_PROCESSOR_NAME = $extval (size_t , "MPI_MAX_PROCESSOR_NAME")


macdef 
MPI_COMM_WORLD = $extval (MPI_Comm , "MPI_COMM_WORLD")


(* ****** ****** *)


(* end of [mpi.sats] *)
