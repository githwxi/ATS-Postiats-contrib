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
atscntrb_zeromq_zsock_new(type) zsock_new(type)
//
#define \
atscntrb_zeromq_zsock_new_pair(e) zsock_new_pair((char*)e)
//
/* ****** ****** */

#define \
atscntrb_zeromq_zsock_get_socket(sock) zsock_resolve(sock)

/* ****** ****** */

#define \
atscntrb_zeromq_zsock_bind(sock, e) zsock_bind(sock, (char*)e)

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

#define \
atscntrb_zeromq_zsock_set_router_raw zsock_set_router_raw

/* ****** ****** */
//
// ZSTR
//
/* ****** ****** */
//
#define \
atscntrb_zeromq_zstr_recv(sock) zstr_recv(sock)
#define \
atscntrb_zeromq_zmqstr_recv(sock) zstr_recv(sock)
//
/* ****** ****** */

#define \
atscntrb_zeromq_zstr_send(sock, msg) zstr_send(sock, (char*)msg)

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
//
// ZFRAME
//
/* ****** ****** */
//
#define \
atscntrb_zeromq_zframe_new(msg, bsz) zframe_new(msg, bsz)
//
#define atscntrb_zeromq_zframe_new_empty() zframe_new_empty()
//
/* ****** ****** */
//
#define \
atscntrb_zeromq_zframe_recv(sock) zframe_recv(sock)
#define \
atscntrb_zeromq_zmqframe_recv(sock) zframe_recv(sock)
//
/* ****** ****** */
//
ATSinline()
atstype_int
atscntrb_zeromq_zframe_send1
  (atstype_ref frame, atstype_ptr sock, atstype_int flags)
{
  return zframe_send((zframe_t**)(frame), sock, flags | ( ZFRAME_REUSE ));
}
ATSinline()
atstype_int
atscntrb_zeromq_zframe_send1_val
  (atstype_ptr frame, atstype_ptr sock, atstype_int flags)
{
  return zframe_send((zframe_t**)(&frame), sock, flags | ( ZFRAME_REUSE ));
}
//
ATSinline()
atstype_int
atscntrb_zeromq_zframe_send0
  (atstype_ref frame, atstype_ptr sock, atstype_int flags)
{
  return zframe_send((zframe_t**)(frame), sock, flags & ( ~ZFRAME_REUSE ));
}
ATSinline()
atstype_int
atscntrb_zeromq_zframe_send0_val
  (atstype_ptr frame, atstype_ptr sock, atstype_int flags)
{
  return zframe_send((zframe_t**)(&frame), sock, flags & ( ~ZFRAME_REUSE ));
}
//
/* ****** ****** */
//
#define \
atscntrb_zeromq_zframe_destroy(ref) zframe_destroy((zframe_t**)ref)
//
ATSinline()
atsvoid_t0ype
atscntrb_zeromq_zframe_destroy_val
  (atstype_ptr val)
{
  atscntrb_zeromq_zframe_destroy(&val); return;
}
//
/* ****** ****** */

#define atscntrb_zeromq_zframe_more(x) zframe_more(x)

/* ****** ****** */

#define atscntrb_zeromq_zframe_size(x) zframe_size(x)
#define atscntrb_zeromq_zframe_data(x) zframe_data(x)

/* ****** ****** */
//
#define \
atscntrb_zeromq_zframe_eq(x1, x2) zframe_eq(x1, x2)
#define \
atscntrb_zeromq_zframe_streq(x1, x2) zframe_streq(x1, x2)
//
/* ****** ****** */

#define \
atscntrb_zeromq_zframe_print(x, prfx) zframe_print(x, (char*)prfx)

/* ****** ****** */

#endif // ifndef ZEROMQ_CATS_ZMQ

/* ****** ****** */

/* end of [czmq.cats] */
