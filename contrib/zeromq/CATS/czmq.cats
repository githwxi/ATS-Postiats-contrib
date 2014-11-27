/***********************************************************************/
/*                                                                     */
/*                         Applied Type System                         */
/*                                                                     */
/***********************************************************************/

/* (*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2011-2014 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of the GNU LESSER GENERAL PUBLIC LICENSE as published by the
** Free Software Foundation; either version 2.1, or (at your option)  any
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
(*
** Author: Hongwei Xi
** Authoremail: gmhwxiATgmailDOTcom
** Start Time: November, 2014
*)
*/

/* ****** ****** */

#ifndef ZEROMQ_CATS_CZMQ
#define ZEROMQ_CATS_CZMQ

/* ****** ****** */

#include <czmq.h>

/* ****** ****** */
//
// ZSOCK
//
/* ****** ****** */
//
#define \
atscntrb_zeromq_zsock_new_pair(e) zsock_new_pair((char*)e)
//
/* ****** ****** */
//
#define \
atscntrb_zeromq_zsock_destroy(ref) zsock_destroy((zsock_t**)ref)
//
ATSinline()
atsvoid_t0ype
atscntrb_zeromq_zsock_destroy_val
  (atstype_ptr val)
{
  atscntrb_zeromq_zsock_destroy(&val); return;
}
//
/* ****** ****** */
//
// ZSTR
//
/* ****** ****** */
//
#define \
atscntrb_zeromq_zstr_recv(inp) zstr_recv((zsock_t*)inp)
//
/* ****** ****** */
//
#define \
atscntrb_zeromq_zstr_free(ref) zstr_free((char**)ref)
//
ATSinline()
atsvoid_t0ype
atscntrb_zeromq_zstr_free_val
  (atstype_ptr val) { atscntrb_zeromq_zstr_free(&val); return; }
//
/* ****** ****** */

#endif // ifndef ZEROMQ_CATS_ZMQ

/* ****** ****** */

/* end of [czmq.cats] */
