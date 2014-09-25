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
// Author: William Blair (wdblair AT cs DOT bu DOT edu)
// Start Time: April, 2013
//
(* ****** ****** *)

#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"
#include
"constraint.hats"

(* ****** ****** *)

staload "constraint.sats"
staload "solving/smt.sats"
staload "solving/error.sats"
staload "solving/smt_ML.sats"

(* ****** ****** *)

staload "{$LIBATSWDBLAIR}/python/SATS/Python.sats"
staload "{$LIBATSWDBLAIR}/SMT/Z3/SATS/z3.sats"

(* ****** ****** *)

staload UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

staload "libc/SATS/stdio.sats"

(* ****** ****** *)

assume solver = Z3_solver

assume formula = Z3_ast
assume func_decl = Z3_func_decl
assume sort = Z3_sort

local
  var ctx : Z3_context
  
  val conf = Z3_mk_config ()
  val () = ctx := Z3_mk_context_rc (conf)
  
  val () = Z3_del_config (conf)
in
  val the_context = ref_make_viewptr{Z3_context} (view@ ctx | addr@ ctx)
end

(* ****** ****** *)

staload FunSet = "libats/SATS/funset_avltree.sats"
vtypedef set (a:t@ype+) = $FunSet.set (a)
macdef set_is_member = $FunSet.funset_is_member

staload _ = "libats/DATS/funset_avltree.dats"

local

  (**
    The overall goal of this solver is to be a drop in replacement for
    the default solver. Therefore, we should try not to start Python
    if we don't need to.
    
    TODO: Figure out a way to move these into the smtenv type in order
    to avoid more global variables.
  *)
  var python_started : bool = false
  
  var python_funcs : set (string) = $FunSet.funset_nil ()
  var python_modules : List0 (PyObject) = list_nil ()
in

  val the_python_started = ref_make_viewptr {bool} (
    view@ python_started | addr@ python_started
  )
  
  val the_python_funcs = ref_make_viewptr {set(string)} (
    view@ python_funcs | addr@ python_funcs
  )
  
  val the_python_modules = ref_make_viewptr {List0 (PyObject)} (
    view@ python_modules | addr@ python_modules
  )
end // end of [local]

extern
fun fopen (string, string): FILEref = "mac#"

extern
fun fclose (FILEref): int = "mac#"

local

macdef castptr = $UN.cast{ptr}

fun
handle_python_exception (): void = let
  (**
    Fetch the exception and render it using the
    traceback module.
  *)
  var ptype: PyObject
  var pvalue: PyObject
  var ptraceback: PyObject
  //
  val () = PyErr_Fetch (ptype, pvalue, ptraceback)
  val () = PyErr_NormalizeException (ptype, pvalue, ptraceback)
  //
  val traceback_name = PyString_FromString ("traceback")
  val traceback = PyImport_Import (traceback_name)
in
  if iseqz (castptr (traceback)) then begin
    prerrln! "Could not load the traceback library.";
    exit (1);
  end
  else let
    val format =
      PyObject_GetAttrString (traceback, "format_exception")
    macdef ssize = g0int2int_int_ssize
    val args = PyTuple_New (ssize(3))
    //
    val () = assertloc (isneqz(castptr(ptype)))
    val () = assertloc (isneqz(castptr(pvalue)))
    //
    val _ = PyTuple_SetItem (args, ssize(0), ptype)
    val _ = PyTuple_SetItem (args, ssize(1), pvalue)
    //
    val _ = 
      if iseqz (castptr(ptraceback)) then let
        val () = Py_INCREF (Py_None)
      in  
        PyTuple_SetItem (args, ssize(2), Py_None)
      end
      else
        PyTuple_SetItem (args, ssize(2), ptraceback)
    //
    val errors = PyObject_CallObject (format, args)
    val n = PyList_Size (errors)
    //          
    fun display_errors (
      i: ssize_t
    ): void =
      if i = n then
        ()
      else let
        val x = PyList_GetItem (errors, i)
        val msg = PyString_AsString (x)
      in
        prerrln! msg;
        display_errors (succ(i))
      end
    //
  in
    display_errors (ssize(0))
  end
end // end of [handle_python_exception]

fun load_functions (
  module_dict: PyObject
): void = let
  val keys = PyDict_Items (module_dict)
  val n = PyList_Size (keys)
  //  
  fun loop (
    ls: PyObject, i: ssize_t
  ): void =
    (**
      Go through ls and add each function
      to the_python_funcs set.
    *)
    if i = n then 
      ()
    else let
      val pair = PyList_GetItem (ls, i)
      //
      val key = PyTuple_GetItem (pair, g0int2int_int_ssize(0))
      val func = PyTuple_GetItem (pair, g0int2int_int_ssize(1))
      //      
      val p = copy(PyString_AsString(key))
      val label = strptr2string (p)
      val () = println! ("Considering function: ", label)
      //
    in
      if isneqz (castptr(func))
          andalso PyFunction_Check (func) then let
        val () = println! ("Adding functiong:", label)
        val (vbox _ | p) = ref_get_viewptr (the_python_funcs)
        val _ = $effmask_ref (
          $FunSet.funset_insert (!p, label);
        )
      in $effmask_ref (
        loop (ls, succ(i))
      )
      end
      else 
        loop (ls, succ(i))
    end    
in
  loop (keys, g0int2int_int_ssize (0))
end // end of [load_functions]

fun
load_script (
  path: string
): PyObject = let
  (**
    Run the code contained in the file. Present
    any errors to the user.
  *)
  val file = fopen (path, "r")
in
  if iseqz ($UN.cast{ptr}(file)) then begin
    prerrln! ("Could not open file: ", path);
    exit (1);
  end
  else let
    //
    val main_module = PyImport_AddModule ("__main__")
    val main_dict = PyModule_GetDict (main_module)
    val file_dict = PyDict_Copy (main_dict)
    val local_dict = PyDict_New ()
    val ok = PyRun_File (file, path, Py_file_input,
                         file_dict, local_dict)
    val _ = fclose (file)
  in
     if iseqz (castptr(ok)) then begin
       handle_python_exception ();
       abort ()
     end
     //
     else let
       val () = load_functions (local_dict)
     in
       local_dict
     end
  end
end // end of [load_script]

in

(**
  Shorthand for lists.
*)
#define :: list_cons
#define nil list_nil

implement
init_scripting (slv) = {
  (**
    Prepare the Python environment with our current
    context and solver.
  *)
  val () = !the_python_started := true
  //
  val () = Py_SetProgramName ("patsolve.py")
  val () = Py_InitializeEx (0)
  val patsolve = Py_InitModule ("patsolve", the_null_ptr)
  val patsolve_global_dict = PyModule_GetDict (patsolve)
  //
  val _ = PyRun_SimpleString ("from z3 import *\nmain_ctx()")
  //
  val z3 = PyImport_AddModule ("z3")
  val z3_global_dict = PyModule_GetDict (z3)
  //
  val main_ctx = PyDict_GetItemString (z3_global_dict, "_main_ctx")
  val ctx = PyObject_GetAttrString (main_ctx, "ctx")
  //
  val pctx = PyLong_FromVoidPtr ($UN.cast{ptr} (!the_context))
  val _ = PyObject_SetAttrString (ctx, "value", pctx)
  //
  val Solver_Class = PyDict_GetItemString (z3_global_dict, "Solver")
  val Solv = PyObject_CallObject (
    Solver_Class, $UN.cast{PyObject} (the_null_ptr)
  )
  val solver = PyObject_GetAttrString (Solv, "solver")
  //
  val psolv = PyLong_FromVoidPtr ($UN.castvwtp1{ptr}(slv))
  val _ = PyObject_SetAttrString (solver, "value", psolv)
  //
  val _ = PyDict_SetItemString (patsolve_global_dict, "solver", Solv)
}

implement
load_user_script (slv, path) =
  (**
    Run a script given to us by the user.
    
    Store all module dictionaries so we can retrieve functions
    in order to resolve macros.
  *)
  if ~(!the_python_started) then
    ()
  else let
    val namespace = load_script (path)
  in
    !the_python_modules := namespace :: !the_python_modules
  end // end of [load_user_scripts]

implement
macro_exists (slv, str) =
  if ~(!the_python_started) then
    false
  else
    set_is_member (!the_python_funcs, str)

implement
evaluate_macro_exn (slv, str, fs) = let
   fun tuple_sing (x: PyObject): PyObject = let
    (**
      Make a tuple containing one element
    *)
     val tup = PyTuple_New (g0int2int_int_ssize (1))
     val _ = PyTuple_SetItem (tup, g0int2int_int_ssize (0), x)
   in
    tup
   end
  //
  val () = println! ("Evaluating a macro: ", str)
  //
  implement
  list_vt_freelin$clear<formula> (x) = $effmask_all (
    formula_free (x)
  )
  //
  val modules = !the_python_modules
  //
  fun loop (ds: List0(PyObject)): Option(PyObject) =
    (**
      Fetch the function from our modules.
    *)
    case+ ds of
      | nil () => None
      | dict :: dss => let
        val func = PyDict_GetItemString (dict, str)
      in
        if isneqz (castptr(func)) andalso PyFunction_Check (func) then
          Some (func)
        else
          loop (dss)
      end
  //
  val opt = loop (modules)
in
  case+ opt of
    | None () => let
        val () = list_vt_freelin (fs)
      in
        abort ()
      end
    | Some func => let    
      val z3 = PyImport_AddModule ("z3")
      val z3_global_dict = PyModule_GetDict (z3)
      val Ast = PyDict_GetItemString (z3_global_dict, "Ast")
      val () = assertloc (isneqz (castptr(Ast)))
      //
      implement
      list_vt_map$fopr<formula><PyObject> (x) = let
        val x' = formula_dup (x)
        val long = PyLong_FromVoidPtr($UN.castvwtp0{ptr}(x'))
        val term = PyObject_CallObject (Ast, tuple_sing(long))
        val () = assertloc (isneqz (castptr(term)))
        //
        val x' = formula_dup (x)
        val ptr = PyLong_FromVoidPtr ($UN.castvwtp0{ptr}(x'))
        val _ = PyObject_SetAttrString (term, "value", ptr)
        //
        val srt = Z3_get_sort (!the_context, x)
        val kind = Z3_get_sort_kind (!the_context, srt)
        //
        fun create_object (
          class: PyObject, ast: PyObject
        ): PyObject = let
          val args = tuple_sing (ast)
        in
          PyObject_CallObject (class, args)
        end
        //
      in
        Z3_sort_dec_ref (!the_context, srt);
        //
        case+ 0 of
          | _ when kind = Z3_BOOL_SORT => let
            val BoolRef = PyDict_GetItemString (z3_global_dict, "BoolRef")
          in
            create_object (BoolRef, term)
          end
          | _ when kind = Z3_INT_SORT orelse 
                   kind = Z3_REAL_SORT => let
            val ArithRef = PyDict_GetItemString (z3_global_dict, "ArithRef")
          in
            create_object (ArithRef, term)
          end
          | _ when kind = Z3_BV_SORT => let
            val BitVecRef = PyDict_GetItemString (z3_global_dict, "BitVecRef")
          in
            create_object (BitVecRef, term)
          end
          | _ when kind = Z3_ARRAY_SORT => let
            val ArrayRef = PyDict_GetItemString (z3_global_dict, "ArrayRef")
          in
            create_object (ArrayRef, term)
          end
          | _ => let
            (**
              Default to just Expr Ref
            *)
            val ExprRef = PyDict_GetItemString (z3_global_dict, "ExprRef")
          in
            create_object (ExprRef, term)
          end
      end // end of [list_vt_map$fopr]
      //
      val lst = list_vt_map<formula><PyObject> (fs)
      val m = g0int2int_int_ssize (length (lst))
      //
      val () = list_vt_freelin (fs)
      //
      fun loop (
        ps: List0_vt (PyObject), i: ssize_t, tuple: PyObject
      ): PyObject =
        (**
          Put a list of PyObjects into a tuple.
        *)
        case+ ps of 
          | ~list_vt_nil () => tuple
          | ~list_vt_cons (p, pss) => let
            val _ = PyTuple_SetItem (tuple, i, p)
          in
            loop (pss, succ(i), tuple)
          end
      //
      val args = loop (lst, g0int2int_int_ssize (0), PyTuple_New(m))
      //
      val opt = PyObject_CallObject (func, args)
    //
    in
      if iseqz(castptr(opt)) then let
        val () = handle_python_exception ();
      in
        abort ()
      end
      else let
        val result = opt
        val AstRef = PyDict_GetItemString (z3_global_dict, "AstRef")
        val is_expr = PyObject_IsInstance (result, AstRef)
      in
        case+ is_expr of
          | _ when is_expr = ~1 => let
            val () = handle_python_exception ()
          in
            abort ()
          end
          | 0 => let
            val () = prerrln! ("The function ", str, " did not return a Z3 expression.")
          in
            abort ()
          end
          | _ => let
            val ast = PyObject_GetAttrString (result, "ast")
            val astlong = PyObject_GetAttrString (ast, "value")
            //
            val xp = PyLong_AsVoidPtr (astlong)
            //
            val x = $UN.castvwtp0{formula} (xp)
            val x' = formula_dup (x)
            val _ = $UN.castvwtp0{ptr} (x)
          in
            x'
          end
      end
    end
end // end of [evaluate_macro_exn]

end // end of [local]

(* ****** ****** *)

implement 
make_solver () = let
  val solve = Z3_mk_solver (!the_context)
in
  solve
end // end of [make_solver]

implement
solver_dup (slv) = let
  val slv1 = Z3_solver_inc_ref (!the_context, slv)
in
  slv1
end // end of [solver_dup]

implement 
delete_solver (solve) = {
  val _ = Z3_solver_dec_ref (!the_context, solve)
} // end of [delete_solver]

implement 
make_int_sort () =
  Z3_mk_int_sort (!the_context)

implement 
make_bool_sort () =
  Z3_mk_bool_sort (!the_context)

implement
make_real_sort () = 
  Z3_mk_real_sort (!the_context)

implement 
make_bitvec_sort (width) =
  Z3_mk_bv_sort (!the_context, g0int2uint(width))

implement
make_array_sort () = let
  val int  = Z3_mk_int_sort (!the_context)
  val int' = Z3_sort_inc_ref (!the_context, int)
  val array = Z3_mk_array_sort (!the_context, int, int')
in
  Z3_sort_dec_ref (!the_context, int);
  Z3_sort_dec_ref (!the_context, int');
  array
end

implement
make_abstract_sort (name) = let
  val sym = Z3_mk_string_symbol (!the_context, name)
in
  Z3_mk_uninterpreted_sort (!the_context, sym)
end

implement 
make_int_constant (id, sort) = let
  val sym = Z3_mk_int_symbol (!the_context, id)
in
  Z3_mk_const (!the_context, sym, sort)
end

implement 
make_fresh_constant (sort) =
    Z3_mk_fresh_const (!the_context, "postiats", sort)

implement
make_func_decl (name, domain, range) = let
  val sym = Z3_mk_string_symbol (!the_context, name)
  //
  val n = g1int2uint (length (domain))
  val (pf, gc | p) = array_ptr_alloc<sort> (u2sz (n))
  val () = array_copy_from_list_vt<sort> (!p, domain)
  //  
  val decl = Z3_mk_func_decl (!the_context, sym, n, !p, range)
  //
  implement array_uninitize$clear<sort> (i, srt) = {
    val () = Z3_sort_dec_ref (!the_context, srt)
  }
in
  array_uninitize<sort> (!p, u2sz(n));
  array_ptr_free{sort} (pf, gc | p);
  Z3_sort_dec_ref (!the_context, range);
  decl
end

implement
make_app (f, args) = let
  val n = g1int2uint (length (args))
  val (pf, gc | p) = array_ptr_alloc<formula> (u2sz (n))
  val () = array_copy_from_list_vt<formula> (!p, args)
  val app = Z3_mk_app (!the_context, f, n, !p)
  //
  implement
  array_uninitize$clear<formula> (i, f) = {
    val () = Z3_dec_ref (!the_context, f)
  }
in
  array_uninitize<formula> (!p, u2sz (n));
  array_ptr_free{formula} (pf, gc | p);
  app
end

implement 
make_true () = Z3_mk_true (!the_context)

implement 
make_false () = Z3_mk_false (!the_context)

implement 
make_not (phi) = let
  val psi = Z3_mk_not (!the_context, phi)
  val _ = Z3_dec_ref (!the_context, phi)
in
  psi
end

implement 
make_ite (cond, t, f) = let
  val ite = Z3_mk_ite (!the_context, cond, t, f)
  val () = begin
    Z3_dec_ref (!the_context, cond);
    Z3_dec_ref (!the_context, t);
    Z3_dec_ref (!the_context, f);
  end
in
  ite
end

implement 
make_or2 (l, r) = let
  val phi = Z3_mk_or2 (!the_context, l, r)
  val () = begin
    Z3_dec_ref (!the_context, l);
    Z3_dec_ref (!the_context, r);
  end
in
  phi
end

implement 
make_and2 (l, r) = let
  val phi = Z3_mk_and2 (!the_context, l, r)
  val () = begin
    Z3_dec_ref (!the_context, l);
    Z3_dec_ref (!the_context, r);
  end
in
  phi
end

implement
make_implies (l, r) = let
  val phi = Z3_mk_implies (!the_context, l, r)
  val () = begin
    Z3_dec_ref (!the_context, l);
    Z3_dec_ref (!the_context, r);
  end
in
  phi
end

implement 
make_eq (l, r) = let
  val phi = Z3_mk_eq (!the_context, l, r)
  val () = begin
    Z3_dec_ref (!the_context, l);
    Z3_dec_ref (!the_context, r);
  end
in
  phi
end

implement
make_numeral_int (num, srt) =
  Z3_mk_int (!the_context, num, srt)
  
implement 
make_numeral_string (num, srt) =
  Z3_mk_numeral (!the_context, num, srt)

implement 
make_numeral_uninterpreted (srt) = let
in
  Z3_mk_fresh_const (!the_context, "uninterp", srt)
end

implement 
make_negate (num) = let
  val neg = Z3_mk_unary_minus (!the_context, num)
  val () = begin
    Z3_dec_ref (!the_context, num)
  end
in
  neg
end

implement 
make_lt (l, r) = let
  val phi = Z3_mk_lt (!the_context, l, r)
  val () = begin
    Z3_dec_ref (!the_context, l);
    Z3_dec_ref (!the_context, r);
  end
in
  phi
end

implement 
make_le (l, r) = let
  val phi = Z3_mk_le (!the_context, l, r)
  val () = begin
    Z3_dec_ref(!the_context, l);
    Z3_dec_ref(!the_context, r);
  end
in
  phi
end

implement 
make_gt (l, r) = let
  val phi = Z3_mk_gt (!the_context, l, r)
  val () = begin
    Z3_dec_ref(!the_context, l);
    Z3_dec_ref(!the_context, r);
  end
in
  phi
end

implement 
make_ge (l , r) = let
  val phi = Z3_mk_ge (!the_context, l, r)
  val () = begin
    Z3_dec_ref(!the_context, l);
    Z3_dec_ref(!the_context, r);
  end
in
  phi
end

implement
make_mul2 (l, r) = let
  val phi = Z3_mk_mul2 (!the_context, l, r)
  val () = begin
    Z3_dec_ref(!the_context, l);
    Z3_dec_ref(!the_context, r);
  end
in
  phi
end

implement 
make_add2 (l, r) = let
  val phi = Z3_mk_add2 (!the_context, l, r)
  val () = begin
    Z3_dec_ref(!the_context, l);
    Z3_dec_ref(!the_context, r);
  end
in
  phi
end

implement 
make_sub2 (l, r) = let
  val phi = Z3_mk_sub2 (!the_context, l, r)
  val () = begin
    Z3_dec_ref(!the_context, l);
    Z3_dec_ref(!the_context, r);
  end
in
  phi
end

implement 
make_div (num, den) = let
  val phi = Z3_mk_div (!the_context, num, den)
  val () = begin
    Z3_dec_ref(!the_context, num);
    Z3_dec_ref(!the_context, den);
  end
in
  phi
end

implement
is_int (num) = let
  val phi = Z3_mk_is_int (!the_context, num)
  val () = begin
    Z3_dec_ref(!the_context, num);
  end
in
  phi
end

(* ****** ****** *)

implement
make_bv_sub (l, r) = let
  val dif = Z3_mk_bvsub (!the_context, l, r)
  val () = begin
    Z3_dec_ref (!the_context, l);
    Z3_dec_ref (!the_context, r);
  end
in
  dif
end

implement
make_bv_add (l, r) = let
  val sum = Z3_mk_bvadd (!the_context, l, r)
  val () = begin
    Z3_dec_ref (!the_context, l);
    Z3_dec_ref (!the_context, r);
  end
in
  sum
end

implement
make_bv_mul (l, r) = let
  val product = Z3_mk_bvmul (!the_context, l, r)
  val () = begin
    Z3_dec_ref (!the_context, l);
    Z3_dec_ref (!the_context, r);
  end
in
  product
end

implement
make_bv_div (l, r) = let
  val ratio = Z3_mk_bvsdiv (!the_context, l, r)
  val () = begin
    Z3_dec_ref (!the_context, l);
    Z3_dec_ref (!the_context, r);
  end
in
  ratio
end

implement
make_bv_udiv (l, r) = let
  val ratio = Z3_mk_bvudiv (!the_context, l, r)
  val () = begin
    Z3_dec_ref (!the_context, l);
    Z3_dec_ref (!the_context, r);
  end
in
  ratio
end

implement
make_bv_neg (l) = let
  val negation = Z3_mk_bvneg (!the_context, l)
  val () = begin
    Z3_dec_ref (!the_context, l);
  end
in
  negation
end

implement
make_bv_land (l, r) = let
  val masked = Z3_mk_bvand (!the_context, l, r)
  val () = begin
    Z3_dec_ref (!the_context, l);
    Z3_dec_ref (!the_context, r);
  end
in
  masked
end

implement
make_bv_lor (l, r) = let
  val set = Z3_mk_bvor (!the_context, l, r)
  val () = begin
    Z3_dec_ref (!the_context, l);
    Z3_dec_ref (!the_context, r);
  end
in
  set
end

implement
make_bv_lxor (l, r) = let
  val xored = Z3_mk_bvxor (!the_context, l, r)
  val () = begin
    Z3_dec_ref (!the_context, l);
    Z3_dec_ref (!the_context, r);    
  end
in
  xored
end

implement
make_bv_lnot (phi) = let
  val not = Z3_mk_bvnot (!the_context, phi)
  val () = begin
    Z3_dec_ref (!the_context, phi);
  end
in
  not
end

implement
make_bv_lshl (bv, i) = let
  val shifted = Z3_mk_bvshl (!the_context, bv, i)
  val () = begin
    Z3_dec_ref (!the_context, bv);
    Z3_dec_ref (!the_context, i);
  end
in
  shifted
end

implement
make_bv_ashr (bv, i) = let
  val shifted = Z3_mk_bvashr (!the_context, bv, i)
  val () = begin
    Z3_dec_ref (!the_context, bv);
    Z3_dec_ref (!the_context, i);
  end
in
  shifted
end

implement
make_bv_lshr (bv, i) = let
  val shifted = Z3_mk_bvashr (!the_context, bv, i)
  val () = begin
    Z3_dec_ref (!the_context, bv);
    Z3_dec_ref (!the_context, i);
  end
in
  shifted
end

implement
make_bv_lt (l, r) = let
  val lt = Z3_mk_bvslt (!the_context, l, r)
  val () = begin
    Z3_dec_ref (!the_context, l);
    Z3_dec_ref (!the_context, r);
  end
in
  lt
end

implement
make_bv_le (l, r) = let
  val lte = Z3_mk_bvsle (!the_context, l, r)
  val () = begin
    Z3_dec_ref (!the_context, l);
    Z3_dec_ref (!the_context, r);
  end
in
  lte
end

implement
make_bv_gt (l, r) = let
  val gt = Z3_mk_bvsgt (!the_context, l, r)
  val () = begin
    Z3_dec_ref (!the_context, l);
    Z3_dec_ref (!the_context, r);
  end
in
  gt
end

implement
make_bv_ge (l, r) = let
  val ge = Z3_mk_bvsge (!the_context, l, r)
  val () = begin
    Z3_dec_ref (!the_context, l);
    Z3_dec_ref (!the_context, r);
  end
in
  ge
end

implement
make_bv_ult (l, r) = let
  val lt = Z3_mk_bvult (!the_context, l, r)
  val () = begin
    Z3_dec_ref (!the_context, l);
    Z3_dec_ref (!the_context, r);
  end
in
  lt
end

implement
make_bv_ule (l, r) = let
  val lte = Z3_mk_bvule (!the_context, l, r)
  val () = begin
    Z3_dec_ref (!the_context, l);
    Z3_dec_ref (!the_context, r);
  end
in
  lte
end

implement
make_bv_ugt (l, r) = let
  val gt = Z3_mk_bvugt (!the_context, l, r)
  val () = begin
    Z3_dec_ref (!the_context, l);
    Z3_dec_ref (!the_context, r);
  end
in
  gt
end

implement
make_bv_uge (l, r) = let
  val ge = Z3_mk_bvuge (!the_context, l, r)
  val () = begin
    Z3_dec_ref (!the_context, l);
    Z3_dec_ref (!the_context, r);
  end
in
  ge
end

implement
make_bv_from_int (n, i) = let
  val bv = Z3_mk_int2bv (!the_context, n, i)
  val () = begin
    Z3_dec_ref (!the_context, i)
  end
in
  bv
end

(* ****** ****** *)

implement
make_real_from_int (i) = let
  val q = Z3_mk_int2real (!the_context, i)
  val () = begin
    Z3_dec_ref (!the_context, i)
  end
in
  q
end

(* ****** ****** *)

implement 
assert (solve, formula) = {
  val _ = Z3_solver_assert (!the_context, solve, formula)
  val _ = Z3_dec_ref (!the_context, formula)
}

implement
push (solve) = Z3_solver_push (!the_context, solve)

implement 
pop (solve) = let
  val depth = Z3_solver_get_num_scopes (!the_context, solve)
in
   if depth > 0u then
    Z3_solver_pop (!the_context, solve, 1u)
end

macdef Z3_FALSE = $extval (Z3_lbool, "Z3_L_FALSE")
macdef Z3_TRUE  = $extval (Z3_lbool, "Z3_L_TRUE")

implement 
is_valid (solve, formula) = let
  val () = push (solve)
  //
  val neg = make_not (formula)
  val () = assert (solve, neg)
  val sat = Z3_solver_check (!the_context, solve)
  //
  val () = pop (solve)
in
  if sat = Z3_FALSE then
    true
  else
    false
end

(* ****** ****** *)

implement 
formula_dup (wff) = Z3_inc_ref (!the_context, wff)

implement 
formula_free (wff) = Z3_dec_ref (!the_context, wff)

implement 
sort_free (srt) = Z3_sort_dec_ref (!the_context, srt)

implement
func_decl_dup (dec) = Z3_func_decl_inc_ref (!the_context, dec)

implement
func_decl_free (dec) = Z3_func_decl_dec_ref (!the_context, dec)

(* ****** ****** *)

implement 
string_of_formula (wff) =
  Z3_ast_to_string (!the_context, wff)
  
(* ****** ****** *)

implement
int_constant_name (label) = let
  val sym = Z3_mk_string_symbol (!the_context, label)
  val ty = Z3_mk_int_sort (!the_context)
  val const = Z3_mk_const (!the_context, sym, ty)
in
  Z3_sort_dec_ref (!the_context, ty);
  const
end

implement
int_numeral (i) = let
  val ty = Z3_mk_int_sort (!the_context)
  val i = Z3_mk_int (!the_context, i, ty)
in
  Z3_sort_dec_ref (!the_context, ty);
  i
end

implement
bitvec_numeral_int (n, width) = let
  val ty = Z3_mk_bv_sort (!the_context, g0int2uint(width))
  val n = Z3_mk_int (!the_context, n, ty)
in
  Z3_sort_dec_ref (!the_context, ty);
  n
end

implement
bitvec_numeral_uint (n, width) = let
  val ty = Z3_mk_bv_sort (!the_context, g0int2uint(width))
  val n = Z3_mk_unsigned_int (!the_context, n, ty)
in
  Z3_sort_dec_ref (!the_context, ty);
  n
end

implement
bool_constant_name (b) = let
  val sym = Z3_mk_string_symbol (!the_context, b)
  val ty = Z3_mk_bool_sort (!the_context)
  val const = Z3_mk_const (!the_context, sym, ty)
in
  Z3_sort_dec_ref (!the_context, ty);
  const
end

implement
bool_bool (b) =
  if b then 
    Z3_mk_true (!the_context)
  else 
    Z3_mk_false (!the_context)
    
local
  val null = the_null_ptr
  
  implement array_uninitize$clear<Z3_app> (i, x) = {
    val ast = Z3_ast_from_app (x)
    val () = Z3_dec_ref (!the_context, ast)
  }
in   
 
implement
forall1 (v, body) = let
  var bound = @[Z3_app](Z3_app_from_ast (v))
  val forall =
    Z3_mk_forall_const (!the_context, 0u, 1u, bound,  0u, null, body)
in
  array_uninitize<Z3_app> (bound, u2sz(1u));
  Z3_dec_ref (!the_context, body);
  forall
end

implement
forall2 (x, y, body) = let
  var bound = @[Z3_app](Z3_app_from_ast (x), Z3_app_from_ast (y))
  val forall =
    Z3_mk_forall_const (!the_context, 0u, 2u, bound,  0u, null, body)
in
  array_uninitize<Z3_app> (bound, u2sz(2u));
  Z3_dec_ref (!the_context, body);
  forall
end

end // end of [local]

(* ****** ****** *)

implement And (f0, f1) = make_and2 (f0, f1)
implement Or (f0, f1) = make_or2 (f0, f1)
implement Not (f0) = make_not (f0)
implement Implies (f0, f1) = make_implies (f0, f1)
implement If (f0, f1, f2) = make_ite (f0, f1, f2)

implement add_formula_formula (f0, f1) = make_add2 (f0, f1)
implement sub_formula_formula (f0, f1) = make_sub2 (f0, f1)
implement mul_formula_formula (f0, f1) = make_mul2 (f0, f1)
implement div_formula_formula (f0, f1) = make_div (f0, f1)
implement neg_formula (f0) = make_negate (f0)

implement gt_formula_formula (f0, f1) = make_gt (f0, f1)
implement gte_formula_formula (f0, f1) = make_ge (f0, f1)
implement eq_formula_formula (f0, f1) = make_eq (f0, f1)
implement lte_formula_formula (f0, f1) = make_le (f0, f1)
implement lt_formula_formula (f0, f1) = make_lt (f0, f1)

(* ****** ****** *)

implement
Select (a, i) = let
  val sel = Z3_mk_select (!the_context, a, i)
in
  Z3_dec_ref (!the_context, a);
  Z3_dec_ref (!the_context, i);
  sel
end

implement
Store (a, i, v) = let
  val store = Z3_mk_store (!the_context, a, i, v)
in
  Z3_dec_ref (!the_context, a);
  Z3_dec_ref (!the_context, i);
  Z3_dec_ref (!the_context, v);
  store
end

(* ****** ****** *)