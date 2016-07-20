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
** $PATSHOME/libc/CATS/CODEGEN/string.atxt
** Time of generation: Wed Sep 23 16:09:12 2015
*/

/* ****** ****** */

/*
(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: February, 2013 *)
*/

/* ****** ****** */

#ifndef ATSLIB_LIBC_CATS_STRING
#define ATSLIB_LIBC_CATS_STRING

/* ****** ****** */

#include <errno.h>
#include <string.h>

/* ****** ****** */

#define atslib_strcmp strcmp
#define atslib_strncmp strncmp

/* ****** ****** */

#define atslib_strcoll strcoll

/* ****** ****** */

#define atslib_strspn strspn
#define atslib_strcspn strcspn

/* ****** ****** */

#define atslib_strlen strlen
#define atslib_strnlen strnlen

/* ****** ****** */

#define atslib_strcat strcat
#define atslib_strcat_unsafe strcat
#define atslib_strncat_unsafe strncat

/* ****** ****** */

#define atslib_strcpy strcpy
#define atslib_strcpy_unsafe strcpy
#define atslib_strncpy_unsafe strncpy

/* ****** ****** */

#define atslib_strdup strdup
#define atslib_strndup strndup
#define atslib_strdup_free atsruntime_mfree_libc

#define atslib_strdupa strdupa
#define atslib_strndupa strndupa
#define atslib_strdupa_free atsruntime_afree_libc

/* ****** ****** */

#define atslib_strfry strfry

/* ****** ****** */

#define atslib_memcpy memcpy
#define atslib_memcpy_unsafe memcpy

/* ****** ****** */

#define atslib_memccpy_unsafe memccpy

/* ****** ****** */

#define atslib_mempcpy mempcpy
#define atslib_mempcpy_unsafe mempcpy

/* ****** ****** */

#define atslib_memset_unsafe memset

/* ****** ****** */

#define atslib_memmove_unsafe memmove

/* ****** ****** */

#define atslib_strerror strerror
#define atslib_strerror_r strerror_r

/* ****** ****** */

ATSinline()
atstype_ptr
atslib_strdup_gc
  (atstype_string src)
{
  char *dst ;
  size_t len, len1 ;
  len = atslib_strlen((char*)src) ;
  len1 = len + 1;
  dst = atspre_malloc_gc(len1) ;
  return atslib_memcpy(dst, src, len1) ;
} // end of [atslib_strdup_gc]

/* ****** ****** */

#endif // ifndef ATSLIB_LIBC_CATS_STRING

/* ****** ****** */

/* end of [string.cats] */
