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
// Start Time: May, 2013
//
(* ****** ****** *)

#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"
#include
"constraint.hats"

(* ****** ****** *)

staload UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

staload "constraint.sats"
staload "solving/error.sats"
staload "solving/solver.sats"

(* ****** ****** *)

staload SMT = "solving/smt.sats"

(* ****** ****** *)

staload _ = "solving/stack.dats"
staload _ = "libats/DATS/linmap_randbst.dats"
staload _ = "libats/DATS/linset_listord.dats"

staload _ = "solving/solver_s2varmap.dats"

staload Map = "libats/SATS/linmap_randbst.sats"
staload Set = "libats/SATS/linset_listord.sats"

(* ****** ****** *)

viewtypedef solver = $SMT.solver
viewtypedef formula = $SMT.formula
viewtypedef sort = $SMT.sort

(* ****** ****** *)

staload "solving/error.sats"

(* ****** ****** *)

val log_smt = false

(* ****** ****** *)

extern fun {a:vt0p}{b:vt0p} list_vt_reduce$init (): b
extern fun {a:vt0p}{b:vt0p} list_vt_reduce$foper (x: a, res: b): b
//
fun {a:vt0p}{b:vt0p} list_vt_reduce {n:int} (xs: list_vt (a, n)): b = let
  fun loop {m:int} (xs: list_vt(a, m), res: b): b = 
    case+ xs of
      | ~list_vt_cons (x, xss) =>
        loop (xss, list_vt_reduce$foper (x, res))
      | ~list_vt_nil () => res
    in
      loop (xs, list_vt_reduce$init<a>())
    end
//
(* ****** ****** *)

local

  implement 
  s2varmap_element_free<formula> (x) = 
    $SMT.formula_free (x)
  
  implement
  s2varmap_element_copy<formula> (x) =
    $SMT.formula_dup (x)
     
  viewtypedef smtenv_struct = @{
    smt= solver,
    variables= @{
      statics= s2varmap (formula)
    },
    err= int 
  }
  
  assume smtenv_viewtype = smtenv_struct

in

  implement 
  smtenv_nil (env) = begin
    env.smt := $SMT.make_solver ();
    s2varmap_nil (env.variables.statics);
    env.err := 0;
  end

  implement 
  smtenv_free (env) = begin
      s2varmap_delete (env.variables.statics);
      $SMT.delete_solver (env.smt);
  end

  implement 
  smtenv_push (env) = (pf | ()) where {
    val _ = if log_smt then println! ("(push 1)")
    val _ = $SMT.push (env.smt)
    val _ = s2varmap_push (env.variables.statics)
    prval pf = __push () where {
      extern praxi __push (): smtenv_push_v
    }
  }
  
  implement 
  smtenv_pop (pf | env) = {
    val _ = if log_smt then println! ("(pop 1)")
    val _ = $SMT.pop (env.smt)
    val _ = s2varmap_pop (env.variables.statics)
    prval _ = __pop (pf) where {
      extern praxi __pop (pf: smtenv_push_v): void
    }
  }
  
  implement 
  smtenv_add_svar (env, s2v) = let
    val type = s2var_get_srt (s2v)
    val () = if log_smt then
      fprintln! (stdout_ref, "Adding svar: ", s2v, " type: ", type)
    //
    val smt_type = sort_make (type)
    //
    val stamp = s2var_get_stamp (s2v)
    val id = stamp_get_int (stamp)
    val () = if log_smt then
      println! ("Variables: ",
        s2varmap_size (env.variables.statics)
    )
    //
    val fresh = $SMT.make_int_constant (id, smt_type)
    val () = $SMT.sort_free (smt_type)
    val opt =
      s2varmap_add (
        env.variables.statics, s2v, fresh
      )
  in
    case+ opt of
      | ~Some_vt (res) => $SMT.formula_free (res)
      | ~None_vt () => ()
  end

  implement 
  smtenv_get_var_exn (env, s2v) = let
    val opt = s2varmap_find (env.variables.statics, s2v)
  in
    case+ opt of
      | ~None_vt () => let
        val () = smtenv_add_svar (env, s2v)
      in
        smtenv_get_var_exn (env, s2v)
      end
      | ~Some_vt (f) => f
  end

  implement
  smtenv_load_scripts (env, scripts) =
    case+ scripts of
      | list_nil () => ()
      | list_cons (sc, _) => 
        (**
          Load just the first script for now.
        *)
        $SMT.load_user_scripts (env.smt, sc, false)
        
  implement 
  sort_make (type) =
    if s2rt_is_int (type) || s2rt_is_addr (type) then
      $SMT.make_int_sort ()
    else if s2rt_is_rat (type) then
      $SMT.make_real_sort ()
    else if s2rt_is_bitvec (type) then let
        val width = s2rt_bitvec_get_width (type)
        val () = assertloc (width > 0)
      in
        $SMT.make_bitvec_sort (width)
      end
    else if s2rt_is_array (type) then
      $SMT.make_array_sort ()
    else if s2rt_is_t0ype (type) then
      $SMT.make_abstract_sort ("t@ype")
    else if s2rt_is_bool (type) then
      $SMT.make_bool_sort ()
    else let
      val () = if log_smt then
        fprintln! (stderr_ref, "Could not handle sort: ", type)
    in
      $SMT.make_bool_sort ()
    end
    
  implement 
  formula_make (env, s2e) = let
    val err = stderr_ref
  in    
    case+ s2e.s2exp_node of
      | S2Eint i => let
        val type = $SMT.make_int_sort ()
        val I = $SMT.make_numeral (i, type)
      in
        $SMT.sort_free (type);
        I
      end
      //
      | S2Eintinf i => let
        val type= $SMT.make_int_sort ()
        val I = $SMT.make_numeral (i, type)
      in
        $SMT.sort_free (type);
        I
      end
      //
      | S2Evar s2v => smtenv_get_var_exn (env, s2v)
      | S2EVar s2V => let
        (**
          There may be a size expression stored in a unification
          variable. If we pull it out, it could be to our advantage.
        *)
        val szexp = s2Var_get_szexp (s2V)
      in
        case+ szexp of
          | S2ZEvar (s2v) => let
              val srt = s2var_get_srt (s2v)
              val s2ev = s2exp_make_node (srt, S2Evar(s2v))
            in
              formula_make (env, s2ev)
            end
          | _ => let
            (** 
              TODO: make this "i don't know" behavior into its own function
            *)
            val srt = s2e.s2exp_srt
            val smt_sort = sort_make (srt)
            val stub = $SMT.make_fresh_constant (smt_sort)
          in
            $SMT.sort_free(smt_sort);
            stub
          end
       end // end of [S2EVar]
      | S2Ecst s2c => (case+ s2c of
        | _ when
            equal_string_s2cst ("null_addr", s2c) => let
              val type = $SMT.make_int_sort ()
              val null = $SMT.make_numeral (0, type)
            in
              $SMT.sort_free (type);
              null
            end
        //
        | _ when
            equal_string_s2cst ("true_bool", s2c) =>
              $SMT.make_true ()
        | _ when
            equal_string_s2cst ("false_bool", s2c) =>
              $SMT.make_false ()
        | _ => let
          val ats_srt = s2cst_get_srt (s2c)
          val smt_srt = sort_make (ats_srt)
          val stamp = s2cst_get_stamp (s2c)
          val id    = stamp_get_int (stamp)
          val c = $SMT.make_int_constant (id, smt_srt)
        in
          $SMT.sort_free (smt_srt);
          c
        end
      )
      | S2Eeqeq (l, r) => let
        val lhs = formula_make (env, l)
        val rhs = formula_make (env, r)
      in
        $SMT.make_eq (lhs, rhs)
      end
      | S2Eapp
          (s2e1, s2es2) => (
            case+ s2e1.s2exp_node of
              | S2Ecst s2c1 => let
               in
                formula_make_s2cst_s2explst (env, s2c1, s2es2)
               end
              //
              | _ => abort () where {
                val _ = fprintln! (err, "formula_make: Invalid application ", s2e)
              }
          ) // end of [S2Eapp]
      | S2Emetdec (met, bound) => let
        val pairs = list_of_list_vt (
          list_zip(met, bound)
        )
        //
        implement list_map$fopr<@(s2exp,s2exp)><formula>(x) = let
          val (pf, fpf | Env) = $UN.ptr1_vtake{smtenv}(addr@ env)
          val met = formula_make (!Env, x.0)
          val bound = formula_make (!Env, x.1)
          prval () =  fpf(pf)
        in
          $SMT.make_lt (met, bound)
        end
        //
        val assertions =
          list_map<(s2exp,s2exp)><formula> (pairs)
        //
        implement list_vt_reduce$init<formula><formula> () = $SMT.make_false ()
        implement list_vt_reduce$foper<formula><formula> (x, res) =
          $SMT.make_or2 (x, res)
      in
        list_vt_reduce<formula><formula> (assertions)
      end // end of [S2Emetdec]
      | S2Esizeof (s2exp) => let
        #define :: list_vt_cons
        #define nil list_vt_nil
        val a = $SMT.make_abstract_sort ("t@ype")
        val sizeof = $SMT.make_func_decl ("sizeof", a :: nil, $SMT.make_int_sort())
        val args = formula_make (env, s2exp)
      in
        $SMT.make_app (sizeof, args :: nil)
      end // end of [S2Esizeof]
      | S2Etop (knd, s2e) => formula_make (env, s2e)
      // end of [S2Etop]
      | _ => let
        val srt = s2e.s2exp_srt
        val smt_sort = sort_make (srt)
        val stub = $SMT.make_fresh_constant (smt_sort)
        (* TODO: Make this error mean something to calling functions *)
        val _ = env.err := env.err + 1
        (**
          val _ = fprintln! (out, "warning(3): formula_make: s2e =:", s2e)
        *)
      in
        $SMT.sort_free (smt_sort);
        stub
      end // end of [_]
   end // end of [formula_make]
   
  (* ****** ****** *)
  
  implement make_true (env) = $SMT.make_true ()
  
  (* ****** ****** *)

  implement smtenv_assert_sbexp (env, prop) = let
    val assumption = formula_make (env, prop)
    val _ = if log_smt then println! (
      "(assert ", $SMT.string_of_formula (assumption) ,")"
    )
  in 
    $SMT.assert (env.smt, assumption)
  end
  
  implement smtenv_formula_is_valid (env, wff) = let
    val () = if log_smt then
      println! ("(is-valid", $SMT.string_of_formula (wff), ")")
  in
    $SMT.is_valid (env.smt, wff)
  end
  
end // end of [local]

(* ****** ******  *)

local

staload "solving/smt_ML.sats"

(**
  Define some convenient fixity rules.
*)
postfix 62 ^ // copy or duplicate
infixl ( && ) And
infixl ( || ) Or
infix 30 ==>

in

  #define :: list_cons
  
  implement f_identity (env, s2es) = let
    val- s2e1 ::  _  = s2es
  in
    formula_make (env, s2e1)
  end // end of [f_identity]

  implement  f_neg_bool (env, s2es) = let
    val- s2e :: _ = s2es
    val boole = formula_make (env, s2e)
  in
    Not (boole)
  end // end of [f_neg_bool]
  
  implement f_add_bool_bool (env, s2es) = let
    val- s2e1 :: s2e2 :: _ = s2es
    val b0 = formula_make (env, s2e1)
    val b1 = formula_make (env, s2e2)
  in
    (b0 Or b1)
  end // end of [f_add_bool_bool]
  
  implement f_mul_bool_bool (env, s2es) = let
    val- s2e1 :: s2e2 :: _  = s2es
    val fbe1 = formula_make (env, s2e1)
    val fbe2 = formula_make (env, s2e2)
  in
    (fbe1 And fbe2)
  end // end of [f_mul_bool_bool]

  implement f_eq_bool_bool (env, s2es) = let
    val- s2e1 :: s2e2 :: _ = s2es
    val fbe1 = formula_make (env, s2e1)
    val fbe2 = formula_make (env, s2e2)
  in
    fbe1 = fbe2
  end // end of [f_eq_bool_bool]

  implement f_neq_bool_bool (env, s2es) = let
    val- s2e1 :: s2e2 :: _ = s2es
    val fbe1 = formula_make (env, s2e1)
    val fbe2 = formula_make (env, s2e2)
  in
    Not (fbe1 = fbe2)
  end // end of [f_neq_bool_bool]
  
  implement f_neg_int (env, s2es) = let
    val- s2e1 :: _ = s2es
    val n = formula_make (env, s2e1)
  in 
    ~n
  end // end of [f_neg_int]
  
  implement f_add_int_int (env, s2es) = let
    val- s2e1 :: s2e2 :: _ = s2es
    val fbe1 = formula_make (env, s2e1)
    val fbe2 = formula_make (env, s2e2)
  in
    fbe1 + fbe2
  end // end of [f_add_int_int]

  implement f_sub_int_int (env, s2es) = let
    val- s2e1 :: s2e2 :: _ = s2es
    val fbe1 = formula_make (env, s2e1)
    val fbe2 = formula_make (env, s2e2)
  in
    fbe1 - fbe2
  end // end of [f_sub_int_int]

  implement f_mul_int_int (env, s2es) = let
    val- s2e1 :: s2e2 :: _ = s2es
    val p = formula_make (env, s2e1)
    val q = formula_make (env, s2e2)
  in
    p * q
  end // end of [f_mul_int_int]
  
  implement f_ndiv_int_int (env, s2es) = let
    val- s2e1 :: s2e2 :: _ = s2es
    val n = formula_make (env, s2e1)
    val d = formula_make (env, s2e2)
  in
    n / d
  end // end of [f_ndiv_int_int]

  implement f_idiv_int_int (env, s2es) = let
    val- s2e1 :: s2e2 :: _ = s2es
    val n = formula_make (env, s2e1)
    val d = formula_make (env, s2e2)
  in
    n / d
  end // end of [f_idiv_int_int]

  implement f_rat_int (env, s2es) = let
    val- s2e1 :: _ = s2es
    val n = formula_make (env, s2e1)
  in
    $SMT.make_real_from_int (n)
  end // end of [f_rat_int]
  
  implement f_rat_int_int (env, s2es) = let
    val- s2e1 :: s2e2 :: _ = s2es
    val p = formula_make (env, s2e1)
    val q = formula_make (env, s2e2)
  in
    p / q
  end // end of [f_rat_int_int]
  
  implement f_mul_rat_rat (env, s2es) = let
    val- s2e1 :: s2e2 :: _ = s2es
    val p = formula_make (env, s2e1)
    val q = formula_make (env, s2e2)
  in
    p * q
  end // end of [f_mul_rat_rat]
  
  implement f_div_rat_rat (env, s2es) = let
    val- s2e1 :: s2e2 :: _ = s2es
    val n = formula_make (env, s2e1)
    val d = formula_make (env, s2e2)
  in
    n / d
  end // end of [f_div_rat_rat]

  implement f_add_rat_rat (env, s2es) = let
    val- s2e1 :: s2e2 :: _ = s2es
    val a = formula_make (env, s2e1)
    val b = formula_make (env, s2e2)
  in
    a + b
  end // end of [f_add_rat_rat]

  implement f_sub_rat_rat (env, s2es) = let
    val- s2e1 :: s2e2 :: _ = s2es
    val a = formula_make (env, s2e1)
    val b = formula_make (env, s2e2)
  in
    a - b
  end // end of [f_sub_rat_rat]
  
  implement f_lt_int_int (env, s2es) = let
    val- s2e1 :: s2e2 :: _ = s2es
    val small = formula_make (env, s2e1)
    val great = formula_make (env, s2e2)
  in
    small < great
  end // end of [f_lt_int_int]

  implement f_lte_int_int (env, s2es) = let
    val- s2e1 :: s2e2 :: _ = s2es
    val small = formula_make (env, s2e1)
    val great = formula_make (env, s2e2)
  in
    small <= great
  end // end of [f_lte_int_int]

  implement f_gt_int_int (env, s2es) = let
    val- s2e1 :: s2e2 :: _ = s2es
    val great = formula_make (env, s2e1)
    val small = formula_make (env, s2e2)
  in
    great > small
  end // end of [f_gt_int_int]

  implement f_gte_int_int (env, s2es) = let
    val- s2e1 :: s2e2 :: _ = s2es
    val great = formula_make (env, s2e1)
    val small = formula_make (env, s2e2)
  in
    great >= small
  end // end of [f_gte_int_int]

  implement f_eq_int_int (env, s2es) = let
    val- s2e1 :: s2e2 :: _ = s2es
    val lhs = formula_make (env, s2e1)
    val rhs = formula_make (env, s2e2)
  in
    lhs = rhs
  end // end of [f_eq_int_int]

  implement f_neq_int_int (env, s2es) = let
    val- s2e1 :: s2e2 :: _ = s2es
    val lhs = formula_make (env, s2e1)
    val rhs = formula_make (env, s2e2)
  in
    Not (lhs = rhs)
  end // end of [f_neq_int_int]
  
  implement f_is_int_int (env, s2es) = let
    val- s2e1 :: _ = s2es
    val num = formula_make (env, s2e1)
  in  
    $SMT.is_int (num)
  end // end of [f_is_int_int]
  
  implement f_gte_rat_rat (env, s2es) = let
    val- s2e1 :: s2e2 :: _ = s2es
    val great = formula_make (env, s2e1)
    val small = formula_make (env, s2e2)
  in
    great >= small
  end // end of [f_gte_rat_rat]
  
  implement f_abs_int (env, s2es) = let
    val- s2e1 :: _ = s2es
    val i = formula_make (env, s2e1)
  in
    If (i^ < Int(0), ~(i^), i)
  end

  implement f_sgn_int (env, s2es) = let
    val- s2e1 :: _ = s2es
    val i = formula_make (env, s2e1)
  in
    If (i^ < Int (0), Int (~1),
      If ( i = Int (0), Int (0), Int (1)))
  end // end of [f_sgn_int]

  implement f_max_int_int (env, s2es) = let
    val- s2e1 :: s2e2 ::  _ = s2es
    val i = formula_make (env, s2e1)
    val j  = formula_make (env, s2e2)
  in
    If (i^ >= j^, i, j)
  end // end of [f_max_int_int]

  implement f_min_int_int (env, s2es) = let
    val- s2e1 :: s2e2 ::  _ = s2es
    //
    val i = formula_make (env, s2e1)
    val j = formula_make (env, s2e2)
  in
    If (i^ <= j^, i, j)
  end // end of [f_min_int_int]

  implement f_ifint_bool_int_int (env, s2es) = let
    val- s2e1 :: s2e2 :: s2e3 ::  _ = s2es
    //
    val cond = formula_make (env, s2e1)
    val T = formula_make (env, s2e2)
    val F = formula_make (env, s2e3)
    //
  in
    If (cond, T, F)
  end // end of [f_ifint_bool_int_int]
  
  implement
  f_bv8_of_int (env, s2es) = let
    val- s2e1 :: _ = s2es
    //
    val i = formula_make (env, s2e1)
  in
    $SMT.make_bv_from_int (8, i)
  end // end of [f_bv8_of_int]

  implement
  f_bv16_of_int (env, s2es) = let
    val- s2e1 :: _ = s2es
    //
    val i = formula_make (env, s2e1)
  in
    $SMT.make_bv_from_int (16, i)
  end // end of [f_bv16_of_int]

  implement
  f_is_power_of_two_bv16 (env, s2es) = let
    val- s2e1 :: _ = s2es
    val x = formula_make (env, s2e1)
    //
    fun loop {i:nat | i <= 16}
      (x: formula, i:int i, res: formula): formula =
      if i = 16 then let
        val () = $SMT.formula_free (x)
      in
        res
      end
      else let
        val clause = 
          x^ = BitVec (1u << i, 16)
      in
        loop (x, succ (i), clause Or res)
      end
    //
  in
    loop (x, 0, Bool(false))
  end // end of [f_is_power_of_two_bv16]
  
  implement
  f_has_null_byte_bv16 (env, s2es) = let
    val- s2e1 :: _ = s2es
    val x = formula_make (env, s2e1)
  in
    $SMT.formula_free (x);
    Bool(false)
  end // end of [f_has_null_byte_bv16]
  
  implement
  f_add_bv_bv (env, s2es) = let
    val- s2e1 :: s2e2 :: _ = s2es
    val l = formula_make (env, s2e1)
    val r = formula_make (env, s2e2)
  in
    $SMT.make_bv_add (l, r)
  end // end of [f_add_bv_bv]
  
  implement
  f_sub_bv_bv (env, s2es) = let
    val- s2e1 :: s2e2 :: _ = s2es
    val l = formula_make (env, s2e1)
    val r = formula_make (env, s2e2)
  in
    $SMT.make_bv_sub (l, r)
  end // end of [f_sub_bv_bv]
  
  implement
  f_mul_bv_bv (env, s2es) = let
    val- s2e1 :: s2e2 :: _ = s2es
    val l = formula_make (env, s2e1)
    val r = formula_make (env, s2e2)
  in
    $SMT.make_bv_mul (l, r)
  end // end of [f_mul_bv_bv]
  
  implement
  f_div_bv_bv (env, s2es) = let
    val- s2e1 :: s2e2 :: _ = s2es
    val l = formula_make (env, s2e1)
    val r = formula_make (env, s2e2)
  in
    $SMT.make_bv_div (l, r)
  end // end of [f_div_bv_bv]

  implement
  f_udiv_bv_bv (env, s2es) = let
    val- s2e1 :: s2e2 :: _ = s2es
    val l = formula_make (env, s2e1)
    val r = formula_make (env, s2e2)
  in
    $SMT.make_bv_udiv (l, r)
  end // end of [f_udiv_bv_bv]

  implement
  f_neg_bv (env, s2es) = let
    val- s2e1 :: _ = s2es
    val l = formula_make (env, s2e1)
  in
    $SMT.make_bv_neg (l)
  end // end of [f_neg_bv]
  
  implement
  f_land_bv_bv (env, s2es) = let
    val- s2e1 :: s2e2 :: _ = s2es
    val l = formula_make (env, s2e1)
    val r = formula_make (env, s2e2)
  in
    $SMT.make_bv_land (l, r)
  end // end of [f_land_bv_bv]
  
  implement
  f_lor_bv_bv (env, s2es) = let
    val- s2e1 :: s2e2 :: _ = s2es
    val l = formula_make (env, s2e1)
    val r = formula_make (env, s2e2)
  in
    $SMT.make_bv_lor (l, r)
  end // end of [f_lor_bv_bv]

  implement
  f_lxor_bv_bv (env, s2es) = let
    val- s2e1 :: s2e2 :: _ = s2es
    val l = formula_make (env, s2e1)
    val r = formula_make (env, s2e2)
  in
    $SMT.make_bv_lxor (l, r)
  end // end of [f_lxr_bv_bv]
  
  implement
  f_lnot_bv (env, s2es) = let
    val- s2e1 :: _ = s2es
    val l = formula_make (env, s2e1)
  in
    $SMT.make_bv_lnot (l)
  end // end of [f_neg_bv]

  implement
  f_lshl_bv_int (env, s2es) = let
    val- s2e1 :: s2e2 :: _ = s2es
    val bv = formula_make (env, s2e1)
    val i = formula_make (env, s2e2)
  in
    $SMT.make_bv_lshl (bv, i)
  end

  implement
  f_lshr_bv_int (env, s2es) = let
    val- s2e1 :: s2e2 :: _ = s2es
    val bv = formula_make (env, s2e1)
    val i = formula_make (env, s2e2)
  in
    $SMT.make_bv_lshr (bv, i)
  end

  implement
  f_ashr_bv_int (env, s2es) = let
    val- s2e1 :: s2e2 :: _ = s2es
    val bv = formula_make (env, s2e1)
    val i = formula_make (env, s2e2)
  in
    $SMT.make_bv_ashr (bv, i)
  end
  
  implement
  f_eq_bv_bv (env, s2es) = let
    val- s2e1 :: s2e2 :: _ = s2es
    val l = formula_make (env, s2e1)
    val r = formula_make (env, s2e2)
  in
    $SMT.make_eq (l, r)
  end // end of [f_eq_bv_bv]
  
  implement
  f_gt_bv_bv (env, s2es) = let
    val- s2e1 :: s2e2 :: _ = s2es
    val l = formula_make (env, s2e1)
    val r = formula_make (env, s2e2)
  in
    $SMT.make_bv_gt (l, r)
  end // end of [f_gt_bv_bv]

  implement
  f_gte_bv_bv (env, s2es) = let
    val- s2e1 :: s2e2 :: _ = s2es
    val l = formula_make (env, s2e1)
    val r = formula_make (env, s2e2)
  in
    $SMT.make_bv_ge (l, r)
  end // end of [f_gte_bv_bv]

  implement
  f_lte_bv_bv (env, s2es) = let
    val- s2e1 :: s2e2 :: _ = s2es
    val l = formula_make (env, s2e1)
    val r = formula_make (env, s2e2)
  in
    $SMT.make_bv_le (l, r)
  end // end of [f_lte_bv_bv]

  implement
  f_lt_bv_bv (env, s2es) = let
    val- s2e1 :: s2e2 :: _ = s2es
    val l = formula_make (env, s2e1)
    val r = formula_make (env, s2e2)
  in
    $SMT.make_bv_lt (l, r)
  end // end of [f_lt_bv_bv]

  implement
  f_ugt_bv_bv (env, s2es) = let
    val- s2e1 :: s2e2 :: _ = s2es
    val l = formula_make (env, s2e1)
    val r = formula_make (env, s2e2)
  in
    $SMT.make_bv_ugt (l, r)
  end // end of [f_ugt_bv_bv]

  implement
  f_ugte_bv_bv (env, s2es) = let
    val- s2e1 :: s2e2 :: _ = s2es
    val l = formula_make (env, s2e1)
    val r = formula_make (env, s2e2)
  in
    $SMT.make_bv_uge (l, r)
  end // end of [f_ugte_bv_bv]

  implement
  f_ulte_bv_bv (env, s2es) = let
    val- s2e1 :: s2e2 :: _ = s2es
    val l = formula_make (env, s2e1)
    val r = formula_make (env, s2e2)
  in
    $SMT.make_bv_ule (l, r)
  end // end of [f_ulte_bv_bv]

  implement
  f_ult_bv_bv (env, s2es) = let
    val- s2e1 :: s2e2 :: _ = s2es
    val l = formula_make (env, s2e1)
    val r = formula_make (env, s2e2)
  in
    $SMT.make_bv_ult (l, r)
  end // end of [f_ult_bv_bv]

  implement
  f_array_select (env, s2es) = let
    val- s2e1 :: s2e2 :: _ = s2es
    val a = formula_make (env, s2e1)
    val i = formula_make (env, s2e2)
  in
    Select (a, i)
  end // end of [f_array_select]
  
  implement
  f_array_store (env, s2es) = let
    val- s2e1 :: s2e2 :: s2e3 :: _ = s2es
    val a = formula_make (env, s2e1)
    val i = formula_make (env, s2e2)
    val v = formula_make (env, s2e3)
  in
    a[i] = v
  end // end of [f_array_store]
      
  implement
  f_partitioned_array (env, s2es) = let
    val- s2e1 :: s2e2 :: s2e3 :: s2e4 :: _ = s2es
    val a     = formula_make (env, s2e1)
    val start = formula_make (env, s2e2)
    val p     = formula_make (env, s2e3)
    val stop  = formula_make (env, s2e4)
    //
    val i = Int ("i"); val j = Int ("j")
  in
    ForAll (i^, j^,
      ((start <= i^) And (i^ <= p^) And (p^ <= j^)
        And (j^ <= stop)) ==>
          ((Select(a^,i) <= Select(a^,p^)) And (Select(a^, p) <= Select(a,j))))
  end // end of [f_partitioned_array]
  
  local
  
    fun
    Sorted (a: formula, start: formula, stop: formula): formula = let
      val i = Int ("i")
      val j = Int("j")
    in
      ForAll (i^, j^,
        ((start <= i^) And (i^ <= j^) And (j^ <= stop)) ==>
          (Select (a^, i) <= Select (a, j))
        )
    end // end of [Sorted]
    
  in
  
  implement
  f_sorted_array (env, s2es) = let
    val- s2e1 :: s2e2 :: _ = s2es
    val a     = formula_make (env, s2e1)
    val len  = formula_make (env, s2e2)
    //
  in
    Sorted (a, Int(0), len - Int(1))
  end // End of [f_sorted_array]
    
  end // end of [local]
  
  implement
  f_array_swap (env, s2es) = let
    val- s2e1 :: s2e2 :: s2e3 :: _ = s2es
    val a = formula_make (env, s2e1)
    val i = formula_make (env, s2e2)
    val j = formula_make (env, s2e3)
    //
    val b = Store(a^,j^, Select(a^, i^))
    
  in
    Store(b, i, Select(a, j))
  end
  
  implement 
  f_lte_stamp_stampseq (env, s2es) = let
    val- s2e1 :: s2e2 :: s2e3 :: _ = s2es
    val stmp = formula_make (env, s2e1)
    val seq  = formula_make (env, s2e2)
    val n    = formula_make (env, s2e3)
    //
    val i = Int("i")
  in
    ForAll (i^,
      ((Int(0) <= i^) And (i^ < n)) ==>
        (stmp <= seq[i]))
  end
  
  implement
  f_lte_stamp_stampseq_range (env, s2es) = let
    val- s2e1 :: s2e2 :: s2e3 :: s2e4 :: _ = s2es
    val stmp = formula_make (env, s2e1)
    val seq = formula_make (env, s2e2)
    val i = formula_make (env, s2e3)
    val n = formula_make (env, s2e4)
    //
    val j = Int("j")
  in
    ForAll(j^,
      ((i <= j^) And (j^ < n)) ==>
        (stmp <= seq[j]))
  end
    
  implement 
  f_lte_stampseq_stamp (env, s2es) = let
    val- s2e1 :: s2e2 :: s2e3 :: _ = s2es
    val seq  = formula_make (env, s2e1)
    val n    = formula_make (env, s2e2)
    val stmp = formula_make (env, s2e3)
    //
    val i = Int("i")
  in
    ForAll (i^,
      ((Int(0) <= i^) And (i^ < n)) ==>
        (seq[i] <= stmp))
  end

  implement
  f_lte_cls_cls (env, s2es) = let
    val- s2e1 :: s2e2 :: _ = s2es
  in
    case+ (s2e1.s2exp_node, s2e2.s2exp_node) of
      | (S2Ecst (s2c1), S2Ecst (s2c2)) =>
        Bool(s2cst_lte_cls_cls (s2c1, s2c2))
      | (_, _) => Bool(false)
  end
  
end // end of [local]