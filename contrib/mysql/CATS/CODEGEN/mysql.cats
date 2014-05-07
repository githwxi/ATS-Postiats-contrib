/***********************************************************************/
/*                                                                     */
/*                         Applied Type System                         */
/*                                                                     */
/***********************************************************************/

/* (*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2011-2012 Hongwei Xi, ATS Trustful Software, Inc.
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
** Source:
** $PATSHOME/prelude/CATS/CODEGEN/mysql.atxt
** Time of generation: Mon Dec 30 20:59:30 2013
*/

/* ****** ****** */

/*
(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: August, 2012 *)
*/

/* ****** ****** */

#ifndef MYSQL_MYSQL_CATS
#define MYSQL_MYSQL_CATS

/* ****** ****** */

#include <mysql.h>

/* ****** ****** */

typedef MYSQL MYSQL_struct ;
typedef MYSQL_RES MYSQLRES_struct ;
typedef MYSQL_ROW MYSQLROW_struct ;
typedef MYSQL_FIELD MYSQLFIELD_struct ;

/* ****** ****** */

#define atscntrb_mysql_init0() mysql_init(NULL)
#define atscntrb_mysql_init1(conn) mysql_init(conn)

/* ****** ****** */

/*
implement
mysql_init0_exn
  ((*null*)) = let
  val conn = mysql_init0 ()
  val p = MYSQLptr2ptr (conn)
in
//
if p > null then conn else let
//
  prval () = mysql_free_null (conn) // HX: no-op
  val () = prerrln! ("exit(ATS): [mysql_init0] failed.")
  val () = exit_void (1)
//
in
  $UN.castvwtp0{MYSQLptr1}(0)
end // end of [if]
//  
end // end of [mysql_init0_exn]
*/
ATSinline()
atstype_ptr
atscntrb_mysql_init0_exn()
{
  MYSQL *conn ;
  conn = atscntrb_mysql_init0() ;
  if (!conn) {
    fprintf (stderr, "exit(ATS): [mysql_init0] failed.\n") ;
  } // end of [if]
  return conn ;
} // end of [atscntrb_mysql_init0_exn]

/* ****** ****** */

#define atscntrb_mysql_close mysql_close
#define atscntrb_mysql_real_connect mysql_real_connect
#define atscntrb_mysql_change_user mysql_change_user

/* ****** ****** */

#define atscntrb_mysql_ping mysql_ping
#define atscntrb_mysql_commit mysql_commit

/* ****** ****** */

#define atscntrb_mysql_query mysql_query
#define atscntrb_mysql_list_dbs mysql_list_dbs
#define atscntrb_mysql_list_fields mysql_list_fields

/* ****** ****** */

#define atscntrb_mysql_field_count mysql_field_count

/* ****** ****** */

#define atscntrb_mysql_num_rows mysql_num_rows
#define atscntrb_mysql_num_fields mysql_num_fields

/* ****** ****** */

#define atscntrb_mysql_field_tell mysql_field_tell
#define atscntrb_mysql_field_seek mysql_field_seek

/* ****** ****** */

#define atscntrb_mysql_affected_rows mysql_affected_rows

/* ****** ****** */

#define atscntrb_mysql_use_result mysql_use_result
#define atscntrb_mysql_store_result mysql_store_result

/* ****** ****** */

#define atscntrb_mysql_free_result mysql_free_result

/* ****** ****** */

#define atscntrb_mysql_data_seek mysql_data_seek

/* ****** ****** */

#define atscntrb_mysql_fetch_row mysql_fetch_row
#define atscntrb_mysql_fetch_lengths mysql_fetch_lengths

/* ****** ****** */

#define atscntrb_mysql_fetch_field mysql_fetch_field
#define atscntrb_mysql_fetch_field_direct mysql_fetch_field_direct
#define atscntrb_mysql_fetch_fields mysql_fetch_fields

/* ****** ****** */

ATSinline()
atstype_ptr
atscntrb_mysqlrow_get_at
  (atstype_ptr row, atstype_int i) { return ((atstype_ptr*)row)[i] ; }
// end of [atscntrb_mysqlrow_get_at]

ATSinline()
atstype_ulint
atscntrb_mysqlrowlen_get_at
  (atstype_ptr rowlen, atstype_int i) { return ((atstype_ulint*)rowlen)[i] ; }
// end of [atscntrb_mysqlrowlen_get_at]

/* ****** ****** */

ATSinline()
atstype_ptr
atscntrb_mysqlfield_get_name
  (atstype_ptr fld) { return ((MYSQLFIELD_struct*)fld)->name ; }
// end of [atscntrb_mysqlfield_get_name]

/* ****** ****** */

#define atscntrb_mysql_info(conn) ((char*)(mysql_info(conn)))
#define atscntrb_mysql_stat(conn) ((char*)(mysql_stat(conn)))
#define atscntrb_mysql_sqlstate(conn) ((char*)(mysql_sqlstate(conn)))

/* ****** ****** */

#define atscntrb_mysql_get_host_info(conn) ((char*)(mysql_get_host_info(conn)))
#define atscntrb_mysql_get_proto_info mysql_get_proto_info
#define atscntrb_mysql_get_client_info() ((char*)(mysql_get_client_info()))
#define atscntrb_mysql_get_client_version mysql_get_client_version
#define atscntrb_mysql_get_server_info(conn) ((char*)(mysql_get_server_info(conn)))
#define atscntrb_mysql_get_server_version mysql_get_server_version

/* ****** ****** */

#define atscntrb_mysql_errno mysql_errno
#define atscntrb_mysql_error(x) ((char*)(mysql_error(x)))

/* ****** ****** */

#define atscntrb_mysql_hex_string mysql_hex_string
#define atscntrb_mysql_escape_string mysql_escape_string
#define atscntrb_mysql_real_escape_string mysql_real_escape_string

/* ****** ****** */

#define atscntrb_mysql_warning_count mysql_warning_count

/* ****** ****** */

#endif // ifndef MYSQL_MYSQL_CATS

/* ****** ****** */

/* end of [mysql.cats] */
