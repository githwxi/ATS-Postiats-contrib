(*
  Implementing the map that translates applying static functions
  into formulas understood by the underlying SMT solver.
*)

#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"

(* ****** ****** *)

staload "constraint.sats"
staload "parsing/parsing.sats"
staload "solving/smt.sats"
staload "solving/solver.sats"

staload Error = "solving/error.sats"

staload UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

staload "libats/SATS/funmap_list.sats"
staload _ = "libats/DATS/funmap_list.dats"

(* ****** ****** *)

staload LinMap = "libats/SATS/linmap_avltree.sats"
staload _ = "libats/DATS/linmap_avltree.dats"

(* ****** ****** *)

typedef s2cst_ftype = (&smtenv, s2explst) -<fun1> formula

assume s2cfunmap = map (symbol, s2cst_ftype)

vtypedef s2cdeclmap = $LinMap.map (s2cst, func_decl)

implement 
equal_key_key<symbol> (s0, s1) =
  compare_symbol_symbol (s0, s1) = 0
  
implement
$LinMap.equal_key_key<symbol> (s0, s1) =
  compare_symbol_symbol (s0, s1) = 0

implement
$LinMap.compare_key_key<symbol> (s0, s1) =
  compare_symbol_symbol (s0, s1)

(*
  This map keeps track of static constants that map to function macros.
  For example, if someone gives a static instance of ~1, this is represented
  as
  
  (app ~ 1)
  
  Which I can just simplify into
  
  -1 
  
  Using the API provided by the SMT Solver.
*)
local
  var the_s2cfunmap: s2cfunmap = funmap_make_nil{symbol,s2cst_ftype} ()
in
  val the_s2cfunmap =
    ref_make_viewptr (view@ (the_s2cfunmap) | addr@ (the_s2cfunmap))
end


(*
  This map keeps track of static uninterpreted functions declared in ATS.
  
  Users can provide their own interpretations in a separate SMT Lib file.
*)
local
  var the_s2cdeclmap: s2cdeclmap =
    $LinMap.linmap_make_nil{symbol, func_decl} ()
in
  val the_s2cdeclmap =
    ref_make_viewptr (view@ the_s2cdeclmap | addr@ (the_s2cdeclmap))
end

extern
fun constraint3_initialize_map (map: &s2cfunmap): void

implement 
constraint3_initialize () = {
  val (pf, free | p) = $UN.ref_vtake {s2cfunmap} (the_s2cfunmap)
  val () = constraint3_initialize_map (!p)
  (*
    Fetch all the constants parsed for constraint solving and declare
    those which do not have any interpretation.
  *)
  val constants = the_s2cstmap_listize ()
  //
  implement list_foreach$fwork<s2cst><void> (s2c, v) = {
    val (macpf, macfpf | macp)  =
      $UN.ref_vtake (the_s2cfunmap)
    //
    var res: s2cst_ftype
    val name = s2cst_get_name (s2c)
    val defined = funmap_search (!macp, name, res)
    prval () = opt_clear (res)
    //
    val () = (
      if defined then
        ()
      else let
        val srt = s2cst_get_srt (s2c)
      in
        (* Declare the new function *)
        if s2rt_is_fun (srt) then {
          val (decpf, decfpf | declp) = $UN.ref_vtake (the_s2cdeclmap)
          val _args = s2rt_fun_get_args (srt)
          //
          implement list_map$fopr<s2rt><sort> (srt) = sort_make (srt)
          //
          val domain = list_map<s2rt><sort> (_args)
          //
          val _ret = s2rt_fun_get_ret (srt)
          val range  = sort_make (_ret)
          //
          val decl =
            make_func_decl (symbol_get_string (name), domain, range)
          //
          var res: func_decl
          val replaced =
            $LinMap.linmap_insert (!declp, name, decl, res)
          val () = assertloc (~replaced)
          prval () = opt_unnone (res)
          prval () = decfpf (decpf)
        }
      end
    ): void
    //
    prval () = macfpf (macpf)
  }
  //
  val () = list_foreach (constants)
  //
  prval () = free (pf)
}

local

fun
formula_make_uninterp_opt
  (env: &smtenv, s2c: s2cst, s2es: s2explst): Option_vt (formula) = let
  val (pf, fpf | p) = $UN.ref_vtake (the_s2cdeclmap)
  val func = s2cst_get_name (s2c)
  val [l:addr] ptr =
    $LinMap.linmap_search_ref (!p, func)
in
  if iseqz (ptr) then
    None_vt () where {
      prval () = fpf (pf)
    }
  else let
    val ptr1 = cptr2ptr (ptr)
    val (funcpf, funcfpf | func) = $UN.ptr1_vtake {func_decl} (ptr1)
    val func_decl = func_decl_dup (!func)
    prval () = funcfpf (funcpf)
    //
    fun loop {n:int} (
      env: &smtenv, xs: list(s2exp, n)
    ): list_vt(formula, n) =
      case+ xs of
        | list_nil () => list_vt_nil{formula} ()
        | list_cons (x, xs) => let
          val f = formula_make (env, x)
        in 
          list_vt_cons (f, loop(env, xs))
        end
    //
    val args = loop (env, s2es)
    val app = make_app (func_decl, args)
    prval () = fpf (pf)
  in
    Some_vt (app)
  end
end // end of [formula_make_uninterp_opt]

in

implement
formula_make_s2cst_s2explst
  (env, s2c, s2es) = let
  val (vbox pf | p) = ref_get_viewptr (the_s2cfunmap)
  val sym = s2c.name
  val opt = $effmask_ref funmap_search_opt (!p, sym)
  //
  in
    case+ opt of
      | ~Some_vt f => $effmask_ref f (env, s2es)
      | ~None_vt _ => let
        val opt = $effmask_ref (formula_make_uninterp_opt (env, s2c, s2es))
      in
        case+ opt of 
          | ~Some_vt app => app
          (** 
            Instead of failing, we should just make an uninterpreted
            function in the underlying SMT solver.
          *)
          | ~None_vt _ => $raise $Error.FatalErrorException () where {
            val _ = $effmask_ref
              fprintln! (stderr_ref, "Function definition not found!")
          }
      end
  end // end of [formula_make_s2cst_s2explst]

end // end of [local]

implement
the_s2cdeclmap_listize () = let
  vtypedef keyval = @(string, func_decl)
  val (pf, fpf | p) = $UN.ref_vtake (the_s2cdeclmap)
  var xss : List0_vt (keyval) = list_vt_nil ()
  //
  implement 
  $LinMap.linmap_foreach$fwork<symbol,func_decl><void> (k, v, vv) = {
    val (lpf, lfpf | l) = $UN.ptr1_vtake{List0_vt(keyval)} (addr@ xss)
    //
    val dec = func_decl_dup (v)
    val key = symbol_get_string (k)
    val tup = @(key, dec)
    val () = !l := list_vt_cons (tup, !l)
    //
    prval () = lfpf (lpf)
  }
  val () = $LinMap.linmap_foreach (!p)
  prval () = fpf (pf)
in
  xss
end

(* ****** ****** *)

implement 
constraint3_initialize_map (map) = {
  typedef tfun = s2cst_ftype
  fun ins (
    map: &s2cfunmap, key: string, f: tfun
  ): void = let
    val sym = symbol_make (key)
  in
    funmap_insert_any (map, sym, f)
  end
  val () = begin
    ins (map, "neg_bool", f_neg_bool);
    ins (map, "add_bool_bool", f_add_bool_bool);
    ins (map, "mul_bool_bool", f_mul_bool_bool);
    ins (map, "eq_bool_bool", f_eq_bool_bool);
    ins (map, "neq_bool_bool", f_neq_bool_bool);
    //
    ins (map, "neg_int", f_neg_int);
    ins (map, "add_int_int", f_add_int_int);
    ins (map, "sub_int_int", f_sub_int_int);
    ins (map, "mul_int_int", f_mul_int_int);
    ins (map, "div_int_int", f_idiv_int_int);
    ins (map, "ndiv_int_int", f_ndiv_int_int);
    ins (map, "idiv_int_int", f_idiv_int_int);
    //
    ins (map, "lt_int_int", f_lt_int_int);
    ins (map, "lte_int_int", f_lte_int_int);
    ins (map, "gt_int_int", f_gt_int_int);
    ins (map, "gte_int_int", f_gte_int_int);
    ins (map, "eq_int_int", f_eq_int_int);
    ins (map, "neq_int_int", f_neq_int_int);
    //
    ins (map, "abs_int", f_abs_int);
    ins (map, "sgn_int", f_sgn_int);
    ins (map, "max_int_int", f_max_int_int);
    ins (map, "min_int_int", f_min_int_int);
    //
    ins (map, "ifint_bool_int_int", f_ifint_bool_int_int);
    //
    ins (map, "int_of_addr", f_identity);
    ins (map, "addr_of_int", f_identity);
    //
    ins (map, "add_addr_int", f_add_int_int);
    ins (map, "sub_addr_int", f_sub_int_int);
    ins (map, "sub_addr_addr", f_sub_int_int);
    //
    ins (map, "lt_addr_addr", f_lt_int_int);
    ins (map, "lte_addr_addr", f_lte_int_int);
    ins (map, "gt_addr_addr", f_gt_int_int);
    ins (map, "gte_addr_addr", f_gte_int_int);
    ins (map, "eq_addr_addr", f_eq_int_int);
    ins (map, "neq_addr_addr", f_neq_int_int);
    //
    (** Rational Constructors *)
    ins (map, "Rational", f_rat_int);
    ins (map, "RationalDiv", f_rat_int_int);
    //
    ins (map, "mul_rat_rat", f_mul_rat_rat);
    ins (map, "div_rat_rat", f_div_rat_rat);
    ins (map, "add_rat_rat", f_add_rat_rat);
    ins (map, "sub_rat_rat", f_sub_rat_rat);
    ins (map, "gte_rat_rat", f_gte_rat_rat);
    ins (map, "is_int_int", f_is_int_int);
    //
    ins (map, "lte_cls_cls", f_lte_cls_cls);
    //
    ins (map, "bit8_of_int", f_bv8_of_int);
    ins (map, "sub_bit8_bit8", f_sub_bv_bv);
    ins (map, "and_bit8_bit8", f_land_bv_bv);
    ins (map, "eq_bit8_bit8", f_eq_bv_bv);
    //
    ins (map, "partitioned_array", f_partitioned_array);
    ins (map, "sorted_array", f_sorted_array);
    ins (map, "sorted_split_array", f_sorted_split_array);
    ins (map, "merged_array", f_merged_array);
    //
    ins (map, "array_select", f_array_select);
    ins (map, "array_store", f_array_store);
    ins (map, "array_swap", f_array_swap);
    ins (map, "stampseq_swap_at", f_array_swap);
    //
    ins (map, "stampseq_get_at", f_array_select);
    ins (map, "stampseq_set_at", f_array_store);
    //
    ins (map, "stampseq_sorted", f_sorted_array);
    ins (map, "stampseq_partitioned_left", f_partitioned_left_array);
    ins (map, "stampseq_partitioned_right", f_partitioned_right_array);
    ins (map, "stampseq_partitioned", f_partitioned_array);
    //
    ins (map, "lte_stamp_stampseq", f_lte_stamp_stampseq);
    ins (map, "lte_stampseq_stamp", f_lte_stampseq_stamp);
  end
}

(* ****** ****** *)