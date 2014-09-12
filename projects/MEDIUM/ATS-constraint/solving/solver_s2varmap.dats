(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2011-20?? Hongwei Xi, ATS Trustful Software, Inc.
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
*)

(* ****** ****** *)
//
// Author: Will Blair (wdblair AT cs DOT bu DOT edu)
// Start Time: August, 2014
//
(* ****** ****** *)

#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"

(* ****** ****** *)

staload "constraint.sats"
staload "solving/solver.sats"

(* ****** ****** *)

staload UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

local

  staload Map = "libats/SATS/linmap_randbst.sats"
  staload Set = "libats/SATS/linset_listord.sats"

  implement $Map.compare_key_key<s2var> (k1, k2) =
    $effmask_all compare_s2var_s2var (k1, k2)
      
  implement $Set.compare_elt_elt<s2var> (k1, k2) =
    $effmask_all compare_s2var_s2var (k1, k2)

  staload Stack = "stack.sats"
  
  vtypedef stack (a:vtype) = $Stack.stack (a)
  vtypedef set (a:t@ype) = $Set.set (a)
  vtypedef map (a:t@ype, b:vt@ype+) = $Map.map (a, b)
  vtypedef s2varset = set (s2var)
  
  fun cmp (
    x1: s2var, x2: s2var
  ) : int = compare_s2var_s2var (x1, x2)
     
  assume s2varmap_vt0ype (a:vt@ype) = @{
    scopes= stack (s2varset),
    variables= map (s2var, a)
  }

in
  
  implement{a}
  s2varmap_nil (map) = begin
      map.scopes := $Stack.stack_nil ();
      map.variables := $Map.linmap_make_nil ();
  end
  
  implement{a}
  s2varmap_delete (map) = {
    val scopes = $Stack.stack_listize (map.scopes)
    val vars = $Map.linmap_listize<s2var,a> (map.variables)
    //
    implement
    list_vt_freelin$clear<s2varset> (set) =
      $Set.linset_free (set)
    //
    val () = list_vt_freelin<s2varset>(scopes)
    // 
    implement 
    list_vt_freelin$clear<@(s2var,a)>(x) = $effmask_all ({
      val () = s2varmap_element_free (x.1)
      extern praxi __free (&(@(s2var,a?)) >> @(s2var,a)?): void
      prval () = __free (x)
    })
    val () = list_vt_freelin(vars)
  }
  
  implement{a}
  s2varmap_add (map, s2v, x) = let
    var res: a?
    val found = $Map.linmap_insert (
      map.variables, s2v, x, res
    )
    //
    implement $Stack.stack_fhead$foper<s2varset> (scope) =
      ignoret ($Set.linset_insert (scope, s2v))
    //
  in
    $Stack.stack_fhead<s2varset>(map.scopes);
    //
    if found then let
        prval () = opt_unsome (res)
      in
        Some_vt (res)
      end
    else let
      prval () = opt_unnone (res)
    in
      None_vt ()
    end
  end

  implement{a}
  s2varmap_find (map, s2v) = let
    val [l:addr] ptr =
      $Map.linmap_search_ref<s2var,a> (map.variables, s2v)
  in
    if iseqz (ptr) then
      None_vt ()
    else let
      val ptr1 = cptr2ptr (ptr)
      val (pf, free | p) = $UN.ptr1_vtake{a} (ptr1)
      val variable = s2varmap_element_copy<a> (!ptr1)
      prval () = free (pf)
    in
      Some_vt (variable)
    end
  end
  
  implement{a}
  s2varmap_push (map) = let
    val scope = $Set.linset_nil ()
  in
    $Stack.stack_push<s2varset> (map.scopes, scope)
  end

  implement{a}
  s2varmap_pop (map) = let
    val opt = $Stack.stack_pop<s2varset> (map.scopes)
  in
    case+ opt of 
      | ~None_vt () => ()
      | ~Some_vt (expired) => let
        val xs = $Set.linset_listize (expired)
        //
        implement
        list_vt_foreach$fwork<s2var><s2varmap(a)>(v, map) = let
          val opt = 
            $Map.linmap_takeout_opt<s2var,a>(map.variables, v)
        in
          case+ opt of
            | ~None_vt () => ()
            | ~Some_vt (value) =>
              s2varmap_element_free (value)
        end
      in
        list_vt_foreach_env<s2var><s2varmap(a)> (xs, map);
        list_vt_free (xs)
        //
      end
  end
  
  implement{a}
  s2varmap_size (map) = $Map.linmap_size<s2var,a> (map.variables)

end