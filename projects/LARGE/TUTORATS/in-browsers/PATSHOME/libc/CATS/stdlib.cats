/***********************************************************************/
/*                                                                     */
/*                         Applied Type System                         */
/*                                                                     */
/***********************************************************************/

/* (*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2010-2013 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
** Free Software Foundation; either version 3, or (at  your  option)  any
** later version.
**
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
**
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see the  file COPYING.  If not, please write to the
** Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
** 02110-1301, USA.
*) */

/* ****** ****** */

/*
** Source:
** $PATSHOME/libc/CATS/CODEGEN/stdlib.atxt
** Time of generation: Wed Sep 23 16:09:12 2015
*/

/* ****** ****** */

/*
(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: February, 2013 *)
*/

/* ****** ****** */

#ifndef ATSLIB_LIBC_CATS_STDLIB
#define ATSLIB_LIBC_CATS_STDLIB

/* ****** ****** */

#include <stdlib.h>

/* ****** ****** */

#include "share/H/pats_atslib.h"

/* ****** ****** */

#define atslib__Exit _Exit
#define atslib_atexit atexit

/* ****** ****** */

#define atslib_abort abort

/* ****** ****** */

#define atslib_abs abs
#define atslib_labs labs
#define atslib_llabs llabs

/* ****** ****** */

#define atslib_div div
#define atslib_ldiv ldiv
#define atslib_lldiv lldiv

/* ****** ****** */

#define atslib_a64l a64l
#define atslib_l64a l64a

/* ****** ****** */

#define atslib_atoi atoi
#define atslib_atol atol
#define atslib_atoll atoll
#define atslib_atof atof

/* ****** ****** */

#define atslib_strtol0(nptr, base) atslib_strtol_unsafe(nptr, 0, base)
#define atslib_strtol1(nptr, endptr, base) atslib_strtol_unsafe(nptr, endptr, base)
#define atslib_strtol_unsafe(nptr, endptr, base) strtol((char*)(nptr), (char**)(endptr), base)

/* ****** ****** */

#define atslib_strtoll0(nptr, base) atslib_strtoll_unsafe(nptr, 0, base)
#define atslib_strtoll1(nptr, endptr, base) atslib_strtoll_unsafe(nptr, endptr, base)
#define atslib_strtoll_unsafe(nptr, endptr, base) strtoll((char*)(nptr), (char**)(endptr), base)

/* ****** ****** */

#define atslib_strtof0(nptr) atslib_strtof_unsafe(nptr, 0)
#define atslib_strtof1(nptr, endptr) atslib_strtof_unsafe(nptr, endptr)
#define atslib_strtof_unsafe(nptr, endptr) strtof((char*)(nptr), (char**)(endptr))

/* ****** ****** */

#define atslib_strtod0(nptr) atslib_strtod_unsafe(nptr, 0)
#define atslib_strtod1(nptr, endptr) atslib_strtod_unsafe(nptr, endptr)
#define atslib_strtod_unsafe(nptr, endptr) strtod((char*)(nptr), (char**)(endptr))

/* ****** ****** */

#define atslib_getenv getenv
#define atslib_putenv putenv
#define atslib_setenv setenv
#define atslib_unsetenv unsetenv

/* ****** ****** */

#define atslib_rand rand
#define atslib_srand srand
#define atslib_rand_r rand_r

/* ****** ****** */

#define atslib_random random
#define atslib_srandom srandom

/* ****** ****** */

#define atslib_drand48 drand48
#define atslib_erand48 erand48
#define atslib_lrand48 lrand48
#define atslib_nrand48 nrand48
#define atslib_mrand48 mrand48
#define atslib_jrand48 jrand48
#define atslib_srand48 srand48
#define atslib_seed48 seed48
#define atslib_lcong48 lcong48

/* ****** ****** */

#define \
atslib_qsort(base, nmemb, size, compar) \
  qsort(base, nmemb, size, (void*)compar)

/* ****** ****** */

#define \
atslib_bsearch(key, base, nmemb, size, compar) \
  bsearch(key, base, nmemb, size, (void*)compar)

/* ****** ****** */

#define atslib_mkstemp mkstemp
#define atslib_mkostemp mkostemp

/* ****** ****** */

#define atslib_mfree_libc free
#define atslib_malloc_libc malloc

/* ****** ****** */

#define atslib_system system

/* ****** ****** */

#endif // ifndef ATSLIB_LIBC_CATS_STDLIB

/* ****** ****** */

/* end of [stdlib.cats] */
