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
#include "MPI/CATS/mpi.cats" // HX: [mpi.h] is included in [mpi.cats]
//
%} // end of [%{#]

(* ****** ****** *)

#define ATS_PACKNAME "ATSCNTRB.MPI"
#define ATS_EXTERN_PREFIX "atscntrb_mpi_" // prefix for external names

(* ****** ****** *)
//
abst@ype
MPI_Datatype =
$extype"MPI_Datatype"
//
(* ****** ****** *)
//
macdef
MPI_CHAR = $extval(MPI_Datatype, "MPI_CHAR")
macdef
MPI_SIGNED_CHAR = $extval(MPI_Datatype, "MPI_SIGNED_CHAR")
macdef
MPI_UNSIGNED_CHAR = $extval(MPI_Datatype, "MPI_UNSIGNED_CHAR")
macdef
MPI_BYTE = $extval(MPI_Datatype, "MPI_BYTE")
macdef
MPI_WCHAR = $extval(MPI_Datatype, "MPI_WCHAR")
macdef
MPI_SHORT = $extval(MPI_Datatype, "MPI_SHORT")
macdef
MPI_UNSIGNED_SHORT = $extval(MPI_Datatype, "MPI_UNSIGNED_SHORT")
macdef
MPI_INT = $extval(MPI_Datatype, "MPI_INT")
macdef
MPI_UNSIGNED = $extval(MPI_Datatype, "MPI_UNSIGNED")
macdef
MPI_LONG = $extval(MPI_Datatype, "MPI_LONG")
macdef
MPI_UNSIGNED_LONG = $extval(MPI_Datatype, "MPI_UNSIGNED_LONG")
macdef
MPI_FLOAT = $extval(MPI_Datatype, "MPI_FLOAT")
macdef
MPI_DOUBLE = $extval(MPI_Datatype, "MPI_DOUBLE")
macdef
MPI_LONG_DOUBLE = $extval(MPI_Datatype, "MPI_LONG_DOUBLE")
macdef
MPI_LONG_LONG = $extval(MPI_Datatype, "MPI_LONG_LONG")
macdef
MPI_LONG_LONG_INT = $extval(MPI_Datatype, "MPI_LONG_LONG_INT")
macdef
MPI_UNSIGNED_LONG_LONG = $extval(MPI_Datatype, "MPI_UNSIGNED_LONG_LONG")
//
(* ****** ****** *)
//
macdef
MPI_LB = $extval(MPI_Datatype, "MPI_LB")
macdef
MPI_UB = $extval(MPI_Datatype, "MPI_UB")
macdef
MPI_PACKED = $extval(MPI_Datatype, "MPI_PACKED")
//
(* ****** ****** *)
//
macdef
MPI_2INT = $extval(MPI_Datatype, "MPI_2INT")
macdef
MPI_LONG_INT = $extval(MPI_Datatype, "MPI_LONG_INT")
macdef
MPI_SHORT_INT = $extval(MPI_Datatype, "MPI_SHORT_INT")
macdef
MPI_FLOAT_INT = $extval(MPI_Datatype, "MPI_FLOAT_INT")
macdef
MPI_DOUBLE_INT = $extval(MPI_Datatype, "MPI_DOUBLE_INT")
macdef
MPI_LONG_DOUBLE_INT = $extval(MPI_Datatype, "MPI_LONG_DOUBLE_INT")
//
(* ****** ****** *)
//
macdef
MPI_REAL4 = $extval(MPI_Datatype, "MPI_REAL4")
macdef
MPI_REAL8 = $extval(MPI_Datatype, "MPI_REAL8")
macdef
MPI_REAL16 = $extval(MPI_Datatype, "MPI_REAL16")
macdef
MPI_COMPLEX8 = $extval(MPI_Datatype, "MPI_COMPLEX8")
macdef
MPI_COMPLEX16 = $extval(MPI_Datatype, "MPI_COMPLEX16")
macdef
MPI_COMPLEX32 = $extval(MPI_Datatype, "MPI_COMPLEX32")
macdef
MPI_INTEGER1 = $extval(MPI_Datatype, "MPI_INTEGER1")
macdef
MPI_INTEGER2 = $extval(MPI_Datatype, "MPI_INTEGER2")
macdef
MPI_INTEGER4 = $extval(MPI_Datatype, "MPI_INTEGER4")
macdef
MPI_INTEGER8 = $extval(MPI_Datatype, "MPI_INTEGER8")
macdef
MPI_INTEGER16 = $extval(MPI_Datatype, "MPI_INTEGER16")
//
(* ****** ****** *)
//
macdef
MPI_INT8_T = $extval(MPI_Datatype, "MPI_INT8_T")
macdef
MPI_INT16_T = $extval(MPI_Datatype, "MPI_INT16_T")
macdef
MPI_INT32_T = $extval(MPI_Datatype, "MPI_INT32_T")
macdef
MPI_INT64_T = $extval(MPI_Datatype, "MPI_INT64_T")
macdef
MPI_UINT8_T = $extval(MPI_Datatype, "MPI_UINT8_T")
macdef
MPI_UINT16_T = $extval(MPI_Datatype, "MPI_UINT16_T")
macdef
MPI_UINT32_T = $extval(MPI_Datatype, "MPI_UINT32_T")
macdef
MPI_UINT64_T = $extval(MPI_Datatype, "MPI_UINT64_T")
//
macdef
MPI_C_BOOL = $extval(MPI_Datatype, "MPI_C_BOOL")
macdef
MPI_C_COMPLEX = $extval(MPI_Datatype, "MPI_C_COMPLEX")
macdef
MPI_C_FLOAT_COMPLEX = $extval(MPI_Datatype, "MPI_C_FLOAT_COMPLEX")
macdef
MPI_C_DOUBLE_COMPLEX = $extval(MPI_Datatype, "MPI_C_DOUBLE_COMPLEX")
macdef
MPI_C_LONG_DOUBLE_COMPLEX = $extval(MPI_Datatype, "MPI_C_LONG_DOUBLE_COMPLEX")
//
(* ****** ****** *)
//
macdef
MPI_AINT = $extval(MPI_Datatype, "MPI_AINT")
macdef
MPI_OFFSET = $extval(MPI_Datatype, "MPI_OFFSET")
//
(* ****** ****** *)
//
abst@ype
MPI_Comm = $extype"MPI_Comm"
//
macdef
MPI_COMM_SELF = $extval(MPI_Comm, "MPI_COMM_SELF")
macdef
MPI_COMM_WORLD = $extval(MPI_Comm, "MPI_COMM_WORLD")
//
(* ****** ****** *)
//
abst@ype
MPI_Group = $extype"MPI_Group"
//
macdef
MPI_GROUP_EMPTY = $extval(MPI_Group, "MPI_GROUP_EMPTY")
//
(* ****** ****** *)
//
macdef
MPI_COMM_NULL = $extval(MPI_Comm, "MPI_COMM_NULL")
macdef
MPI_GROUP_NULL = $extval(MPI_Group, "MPI_GROUP_NULL")
macdef
MPI_DATATYPE_NULL = $extval(MPI_Datatype, "MPI_DATATYPE_NULL")
//
(* ****** ****** *)
//
abst@ype MPI_Op = $extype"MPI_Op"
//
macdef
MPI_MAX = $extval(MPI_Op, "MPI_MAX")
macdef
MPI_MIN = $extval(MPI_Op, "MPI_MIN")
macdef
MPI_SUM = $extval(MPI_Op, "MPI_SUM")
macdef
MPI_PROD = $extval(MPI_Op, "MPI_PROD")
macdef
MPI_LAND = $extval(MPI_Op, "MPI_LAND")
macdef
MPI_BAND = $extval(MPI_Op, "MPI_BAND")
macdef
MPI_LOR = $extval(MPI_Op, "MPI_LOR")
macdef
MPI_BOR = $extval(MPI_Op, "MPI_BOR")
macdef
MPI_LXOR = $extval(MPI_Op, "MPI_LXOR")
macdef
MPI_BXOR = $extval(MPI_Op, "MPI_BXOR")
macdef
MPI_MINLOC = $extval(MPI_Op, "MPI_MINLOC")
macdef
MPI_MAXLOC = $extval(MPI_Op, "MPI_MAXLOC")
macdef
MPI_REPLACE = $extval(MPI_Op, "MPI_REPLACE")
//
macdef
MPI_OP_NULL = $extval(MPI_Op, "MPI_OP_NULL")
//
(* ****** ****** *)
//
stacst
MPI_MAX_ERROR_STRING: int
macdef
MPI_MAX_ERROR_STRING =
  $extval(int(MPI_MAX_ERROR_STRING), "MPI_MAX_ERROR_STRING")
//
stacst
MPI_MAX_PROCESSOR_NAME: int
macdef
MPI_MAX_PROCESSOR_NAME =
  $extval(int(MPI_MAX_PROCESSOR_NAME), "MPI_MAX_PROCESSOR_NAME")
//
stacst
MPI_MAX_PORT_NAME: int
macdef
MPI_MAX_PORT_NAME =
  $extval(int(MPI_MAX_PORT_NAME), "MPI_MAX_PORT_NAME")
stacst
MPI_MAX_OBJECT_NAME: int
macdef
MPI_MAX_OBJECT_NAME =
  $extval(int(MPI_MAX_OBJECT_NAME), "MPI_MAX_OBJECT_NAME")
//
(* ****** ****** *)
//
typedef interr = int
//
(* ****** ****** *)
//
fun
MPI_Comm_size
  (MPI_Comm, size: &int? >> _) : interr = "mac#%"
//
fun
MPI_Comm_rank
  (MPI_Comm, rank: &int? >> _) : interr = "mac#%"
//
(* ****** ****** *)
//
fun
MPI_Group_size
  (MPI_Group, size: &int? >> _) : interr = "mac#%"
//
fun
MPI_Group_rank
  (MPI_Group, rank: &int? >> _) : interr = "mac#%"
//
(* ****** ****** *)
//
/*
int MPI_Get_version(int *, int *);
*/
fun
MPI_Get_version
  (version: &int? >> _, subversion: &int? >> _): interr = "mac#%"
//
(* ****** ****** *)

/*
int MPI_Get_processor_name(char *, int *);
*/
fun
MPI_Get_processor_name
(
  name: arrayref(char, MPI_MAX_PROCESSOR_NAME), namelen: &int? >> _
) : interr = "mac#%" // end of [MPI_Get_processor_name]

(* ****** ****** *)

abst@ype
MPI_Status = $extype"MPI_Status"  
  
(* ****** ****** *)

fun
MPI_Send
  {a:t0p}{m:nat}
(
  msg: arrayref(a, m), len: natLte(m)
, MPI_Datatype, dest: int, tag: int, MPI_Comm
) : interr = "mac#%" // end of [MPI_Send]

fun
MPI_Recv
  {a:t0p}{m:nat}
(
  msg: arrayref(a, m), len: natLte(m)
, MPI_Datatype, dest: int, tag: int, MPI_Comm, &MPI_Status? >> _
) : interr = "mac#%" // end of [MPI_Recv]

(* ****** ****** *)

(* end of [mpi.sats] *)
