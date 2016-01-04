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
** $PATSHOME/libc/CATS/CODEGEN/unistd.atxt
** Time of generation: Wed Sep 23 16:09:13 2015
*/

/* ****** ****** */

/*
(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: April, 2012 *)
*/

/* ****** ****** */

#ifndef ATSLIB_LIBC_CATS_UNISTD
#define ATSLIB_LIBC_CATS_UNISTD

/* ****** ****** */

#include <unistd.h>

/* ****** ****** */

#include "share/H/pats_atslib.h"

/* ****** ****** */

#define atslib_close close
#define atslib_close0 atslib_close
#define atslib_close1 atslib_close
#define atslib_close0_exn atslib_close_exn
#define atslib_close1_exn atslib_close_exn

/* ****** ****** */

#define atslib_dup dup
#define atslib_dup_fildes dup
#define atslib_dup2 dup2
#define atslib_dup3 dup3

/* ****** ****** */

#define atslib_execv(path, argv) execv((char*)path, (char**)argv)
#define atslib_execvp(path, argv) execvp((char*)path, (char**)argv)

/* ****** ****** */

#define atslib_encrypt encrypt

/* ****** ****** */

#define atslib_fork fork

/* ****** ****** */

#define atslib_getcwd getcwd

/* ****** ****** */

#define atslib_getlogin getlogin
#define atslib_getlogin_r getlogin_r

/* ****** ****** */

#define atslib_getpid getpid
#define atslib_getppid getppid

/* ****** ****** */

#define atslib_getuid getuid
#define atslib_setuid setuid
#define atslib_geteuid geteuid
#define atslib_seteuid seteuid

/* ****** ****** */

#define atslib_getgid getgid
#define atslib_setgid setgid
#define atslib_getegid getegid
#define atslib_setegid setegid

/* ****** ****** */

#define atslib_setreuid setreuid
#define atslib_setregid setregid
#define atslib_setresuid setresuid
#define atslib_setresgid setresgid

/* ****** ****** */

#define atslib_setfsuid setfsuid
#define atslib_setfsgid setfsgid

/* ****** ****** */

#define atslib_pause pause

/* ****** ****** */

#define atslib_read_err read
#define atslib_write_err write

/* ****** ****** */

#define atslib_pread pread
#define atslib_pwrite pwrite

/* ****** ****** */

#define atslib_alarm alarm
#define atslib_alarm_set alarm
#define atslib_alarm_cancel() alarm(0)

/* ****** ****** */

#define atslib_sleep_int sleep
#define atslib_sleep_uint sleep

/* ****** ****** */

#define atslib_usleep_int usleep
#define atslib_usleep_uint usleep

/* ****** ****** */

#define atslib_rmdir rmdir

/* ****** ****** */

#define atslib_link link
#define atslib_unlink unlink

/* ****** ****** */

#define atslib_symlink symlink
#define atslib_readlink readlink

/* ****** ****** */

#define atslib_sync sync
#define atslib_fsync fsync
#define atslib_fdatasync fdatasync

/* ****** ****** */

#define atslib_truncate truncate
#define atslib_ftruncate ftruncate

/* ****** ****** */

#endif // ifndef ATSLIB_LIBC_CATS_UNISTD

/* ****** ****** */

/* end of [unistd.cats] */
