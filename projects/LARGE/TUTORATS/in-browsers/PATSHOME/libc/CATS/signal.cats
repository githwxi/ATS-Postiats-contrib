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
** $PATSHOME/libc/CATS/CODEGEN/signal.atxt
** Time of generation: Wed Sep 23 16:09:12 2015
*/

/* ****** ****** */

/*
(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: April, 2014 *)
*/

/* ****** ****** */

#ifndef ATSLIB_LIBC_CATS_SIGNAL
#define ATSLIB_LIBC_CATS_SIGNAL

/* ****** ****** */

#include <signal.h>

/* ****** ****** */

typedef int signum_t ;
typedef void (*sighandler_t)(signum_t) ;

/* ****** ****** */

typedef struct sigaction atslib_sigaction_struct ;

/* ****** ****** */

#define atslib_sigaddset sigaddset
#define atslib_sigdelset sigdelset
#define atslib_sigemptyset sigemptyset
#define atslib_sigfillset sigfillset

/* ****** ****** */

#define atslib_signal signal

/* ****** ****** */

#define atslib_sigaction sigaction
#define atslib_sigaction_null(sgn, act) \
  atslib_sigaction(sgn, act, (atslib_sigaction_struct*)0)

/* ****** ****** */

#define atslib_sigset sigset
#define atslib_sighold sighold
#define atslib_sigignore sigignore
#define atslib_sigrelse sigrelse

/* ****** ****** */

#define atslib_kill kill
#define atslib_killpg killpg
#define atslib_raise raise

/* ****** ****** */

#define atslib_sigwait sigwait

/* ****** ****** */

#define atslib_sigpause sigpause
#define atslib_sigsuspend sigsuspend

/* ****** ****** */

#define atslib_sigpending sigpending
#define atslib_siginterrupt siginterrupt

/* ****** ****** */

#define atslib_psignal psignal

/* ****** ****** */

/*
extern
char* strsignal (int signum) ; // declared in <string.h>
*/
#define atslib_strsignal strsignal

/* ****** ****** */

#endif // ifndef ATSLIB_LIBC_CATS_SIGNAL

/* ****** ****** */

/* end of [signal.cats] */
