/* ****** ****** */

/*
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
*/

/* ****** ****** */

/*
** Author: Brandon Barker
** Authoremail: bbarkerATgmailDOTcom
** Start time: May, 2014
*/

/* ****** ****** */

/*
** Author: Hongwei Xi
** Authoremail: gmhwxiATgmailDOTcom
** Start time: June, 2014
*/

/* ****** ****** */

#ifndef OPENMP_OMP_CATS
#define OPENMP_OMP_CATS

/* ****** ****** */

#include <omp.h>

/* ****** ****** */
//
// BB: Utilities
//
#define atscntrb_openmp_STR(x) #x
#define atscntrb_openmp_STRINGIFY(x) atscntrb_openmp_STR(x)
#define atscntrb_openmp_CONCATFUN(X, Y) X ( Y )
//
/* ****** ****** */

#define \
atscntrb_openmp_omp_get_num_procs() omp_get_num_procs()

/* ****** ****** */

#define \
atscntrb_openmp_omp_get_num_threads() omp_get_num_threads()
#define \
atscntrb_openmp_omp_set_num_threads(n) omp_set_num_threads(n)

/* ****** ****** */

#define \
atscntrb_openmp_omp_get_thread_num() omp_get_thread_num()

/* ****** ****** */
//
#define \
atscntrb_openmp_pragma_omp_barrier() \
  _Pragma(atscntrb_openmp_STRINGIFY(omp barrier))
//
/* ****** ****** */
//
// #pragma omp parallel private(tid)
//
#define \
atscntrb_openmp_pragma_omp_parallel_private_beg(tid) \
  _Pragma(atscntrb_openmp_STRINGIFY(atscntrb_openmp_CONCATFUN(omp parallel private, tid))) {
//
#define \
atscntrb_openmp_pragma_omp_parallel_private_end(tid) }
//
/* ****** ****** */
//
// #pragma omp parallel for
//
/* ****** ****** */
//
#define \
atscntrb_openmp_pragma_omp_parallel_for() \
  _Pragma(atscntrb_openmp_STRINGIFY(omp parallel for))
//
/* ****** ****** */

#endif // ifndef OPENMP_OMP_CATS

/* ****** ****** */

/* end of [omp.cats] */
