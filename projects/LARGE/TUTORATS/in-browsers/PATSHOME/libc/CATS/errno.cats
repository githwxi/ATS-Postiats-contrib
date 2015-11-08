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
** $PATSHOME/libc/CATS/CODEGEN/errno.atxt
** Time of generation: Wed Sep 23 16:09:11 2015
*/

/* ****** ****** */

/*
(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: February, 2013 *)
*/

/* ****** ****** */

#ifndef ATSLIB_LIBC_CATS_ERRNO
#define ATSLIB_LIBC_CATS_ERRNO

/* ****** ****** */

#include <errno.h>

/* ****** ****** */

typedef int errno_t ;

/* ****** ****** */

#define ENONE 0

/* ****** ****** */

#define atslib_the_errno_get() (errno)
#define atslib_the_errno_set(eno) (errno = (eno))
#define atslib_the_errno_reset() (errno = ENONE)

ATSinline()
atstype_bool
atslib_the_errno_test(errno_t eno)
{
  return (errno==(eno)) ? atsbool_true : atsbool_false ;
}

/* ****** ****** */

#endif // ifndef ATSLIB_LIBC_CATS_ERRNO

/* ****** ****** */

/* end of [errno.cats] */
