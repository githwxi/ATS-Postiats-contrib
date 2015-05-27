(*
  Implementing the map that translates static functions
  into formulas understood by the underlying SMT solver.
*)

#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"

(* ****** ****** *)

staload "constraint/constraint.sats"
staload "parsing/parsing.sats"
staload "solving/solver.sats"
staload "solving/smt.sats"

staload Error = "solving/error.sats"

staload UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

staload HT =
"libats/SATS/hashtbl_linprb.sats"
staload _(*HT*) =
"libats/DATS/hashtbl_linprb.dats"

typedef s2cst_ftype = (&smtenv, s2explst) -<fun1> formula

vtypedef funcdict = $HT.hashtbl (symbol, s2cst_ftype)

%{
    /** 
         The compiler crashes when I try to write this in ATS 
    */
    unsigned long
    hash_symbol(void *p)
    {
        char *str = (char*)p;
        
        unsigned long hash = 5381;
        int c;

        while (c = *str++)
            hash = ((hash << 5) + hash) + c; /* hash * 33 + c */

        return hash;
    }
%}

implement
$HT.equal_key_key<symbol> (s0, s1) = 
    compare_symbol_symbol (s0, s1) = 0

extern
fun hash_symbol (string):<> ulint = "ext#"

implement
$HT.hash_key<symbol> (sym) = let
    val str = $effmask_all (sym.string())
    val h = hash_symbol (str)
in
    h
end

implement(a)
$HT.hashtbl_linprb_keyitm_is_null<symbol, a> (kx) = let
    val k = kx.0
    val str = symbol_get_string (k)
    val p = $UN.cast{ptr} (str)
in
    iseqz (p)
end

local
    var myfuncdict: funcdict = $HT.hashtbl_make_nil (i2sz (1000))
in
    val the_funcdict =
         ref_make_viewptr{funcdict} (view@myfuncdict | addr@myfuncdict)
end

(* ****** ****** *)

(*
  This dictionary keeps track of static constants that map to function
  macros. For example, if someone gives a static instance of ~1, this
  is represented as

  (app ~ 1)
  
  Which I can just simplify into
  
  -1
  
  Using the API provided by the SMT Solver.
*)
extern
fun constraint3_initialize_map (map: &funcdict): void

implement 
constraint3_initialize () = {
  val (pf, free | p) = $UN.ref_vtake {funcdict} (the_funcdict)
  val () = constraint3_initialize_map (!p)
  prval () = free (pf)
}

local

fun
formula_make_uninterp
  (env: &smtenv, s2c: s2cst, s2es: s2explst): formula = let
  val srt =  s2c.srt()
  val func = s2c.name()
  val _args = s2rt_fun_get_args (srt)
  
  implement 
  list_map$fopr<s2rt><sort> (srt) = sort_make (srt)

  val domain = list_map<s2rt><sort> (_args)

  val _ret = s2rt_fun_get_ret (srt)
  val range  = sort_make (_ret)

  val sym = symbol_get_string (func)
  val decl =
  make_func_decl (sym, domain, range)

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
        
  val args = loop (env, s2es)
  val app = make_app (decl, args)
in
  app
end // end of [formula_make_uninterp]

in

implement
formula_make_s2cst_s2explst
  (env, s2c, s2es) = let
  val (pf, fpf | p) = $UN.ref_vtake (the_funcdict)
  val sym = s2c.name()
  val r = $HT.hashtbl_search_ref (!p, sym)
in
    if cptr_isnot_null (r) then let
        val f =  $UN.cptr_get<s2cst_ftype> (r)
        prval () = fpf (pf)
    in
        f (env, s2es)
    end
    
    else let
        val slv = smtenv_get_solver (env)
        val ssym = sym.string()
    in
        if macro_exists (slv, ssym) then let

          implement 
          list_map$fopr<s2exp><formula> (x) = let
            val (pf, fpf | p) = $UN.ptr_vtake{smtenv}(addr@ env)
            val f = formula_make (env, x)
            prval () = fpf (pf)
          in
            f
          end

          val fs = list_map<s2exp><formula> (s2es)
          val ret = evaluate_macro_exn (slv, ssym, fs)

          prval () = fpf (pf)
         in
          delete_solver (slv);
          ret
         end

         else let
            val () = delete_solver (slv)
            val app = formula_make_uninterp(env, s2c, s2es)
            prval () = fpf (pf)
         in
             app
        end // end of [else]
    end // end of [else]
end // end of [formula_make_s2cst_s2explst]

end // end of [local]

(* ****** ****** *)

implement
constraint3_initialize_map (map) = {
  typedef tfun = s2cst_ftype
  fun ins (
    dict: &funcdict, key: string, f: tfun
  ): void = {
    val sym = symbol_make (key)
    
    var res: tfun
    
    val replaced = 
        $HT.hashtbl_insert (dict, sym, f, res)
    val () = assertloc (~replaced)
    prval () = opt_unnone (res)
  }
  val () = begin
    ins (map, "neg_bool", f_neg_bool);
    ins (map, "add_bool_bool", f_add_bool_bool);
    ins (map, "mul_bool_bool", f_mul_bool_bool);
    ins (map, "eq_bool_bool", f_eq_bool_bool);
    ins (map, "neq_bool_bool", f_neq_bool_bool);

    ins (map, "neg_int", f_neg_int);
    ins (map, "add_int_int", f_add_int_int);
    ins (map, "sub_int_int", f_sub_int_int);
    ins (map, "mul_int_int", f_mul_int_int);
    ins (map, "div_int_int", f_idiv_int_int);
    ins (map, "ndiv_int_int", f_ndiv_int_int);
    ins (map, "idiv_int_int", f_idiv_int_int);
    ins (map, "mod_int_int", f_mod_int_int);

    ins (map, "lt_int_int", f_lt_int_int);
    ins (map, "lte_int_int", f_lte_int_int);
    ins (map, "gt_int_int", f_gt_int_int);
    ins (map, "gte_int_int", f_gte_int_int);
    ins (map, "eq_int_int", f_eq_int_int);
    ins (map, "neq_int_int", f_neq_int_int);

    ins (map, "abs_int", f_abs_int);
    ins (map, "sgn_int", f_sgn_int);
    ins (map, "max_int_int", f_max_int_int);
    ins (map, "min_int_int", f_min_int_int);

    ins (map, "ifint_bool_int_int", f_ifint_bool_int_int);

    ins (map, "int_of_addr", f_identity);
    ins (map, "addr_of_int", f_identity);

    ins (map, "add_addr_int", f_add_int_int);
    ins (map, "sub_addr_int", f_sub_int_int);

    ins (map, "sub_addr_addr", f_sub_int_int);

    ins (map, "lt_addr_addr", f_lt_int_int);
    ins (map, "lte_addr_addr", f_lte_int_int);
    ins (map, "gt_addr_addr", f_gt_int_int);
    ins (map, "gte_addr_addr", f_gte_int_int);
    ins (map, "eq_addr_addr", f_eq_int_int);
    ins (map, "neq_addr_addr", f_neq_int_int);

    (** Rational Constructors *)
    ins (map, "Rational", f_rat_int);
    ins (map, "RationalDiv", f_rat_int_int);

    ins (map, "mul_rat_rat", f_mul_rat_rat);
    ins (map, "div_rat_rat", f_div_rat_rat);
    ins (map, "add_rat_rat", f_add_rat_rat);
    ins (map, "sub_rat_rat", f_sub_rat_rat);
    ins (map, "gte_rat_rat", f_gte_rat_rat);
    ins (map, "is_int_int", f_is_int_int);

    ins (map, "lte_cls_cls", f_lte_cls_cls);

    ins (map, "bv8_of_int", f_bv8_of_int);
    ins (map, "add_bv8_bv8", f_add_bv_bv);
    ins (map, "sub_bv8_bv8", f_sub_bv_bv);
    ins (map, "mul_bv8_bv8", f_mul_bv_bv);
    ins (map, "div_bv8_bv8", f_div_bv_bv);
    ins (map, "udiv_bv8_bv8", f_udiv_bv_bv);
    ins (map, "neg_bv8", f_neg_bv);

    ins (map, "and_bv8_bv8", f_land_bv_bv);
    ins (map, "or_bv8_bv8", f_lor_bv_bv);
    ins (map, "xor_bv8_bv8", f_lxor_bv_bv);
    ins (map, "not_bv8", f_lnot_bv);
    ins (map, "lshl_bv8_int", f_lshl_bv_int);
    ins (map, "lshr_bv8_int", f_lshr_bv_int);
    ins (map, "ashr_bv8_int", f_ashr_bv_int);

    ins (map, "eq_bv8_bv8", f_eq_bv_bv);
    ins (map, "lt_bv8_bv8", f_lt_bv_bv);
    ins (map, "lte_bv8_bv8", f_lte_bv_bv);
    ins (map, "gte_bv8_bv8", f_gte_bv_bv);
    ins (map, "gt_bv8_bv8", f_gt_bv_bv);
    ins (map, "ult_bv8_bv8", f_ult_bv_bv);
    ins (map, "ulte_bv8_bv8", f_ulte_bv_bv);
    ins (map, "ugte_bv8_bv8", f_ugte_bv_bv);
    ins (map, "ugt_bv8_bv8", f_ugt_bv_bv);

    ins (map, "bv16_of_int", f_bv16_of_int);
    ins (map, "add_bv16_bv16", f_add_bv_bv);
    ins (map, "sub_bv16_bv16", f_sub_bv_bv);
    ins (map, "mul_bv16_bv16", f_mul_bv_bv);
    ins (map, "div_bv16_bv16", f_div_bv_bv);
    ins (map, "udiv_bv16_bv16", f_udiv_bv_bv);
    ins (map, "neg_bv16", f_neg_bv);

    ins (map, "and_bv16_bv16", f_land_bv_bv);
    ins (map, "or_bv16_bv16", f_lor_bv_bv);
    ins (map, "xor_bv16_bv16", f_lxor_bv_bv);
    ins (map, "not_bv16", f_lnot_bv);
    ins (map, "lshl_bv16_int", f_lshl_bv_int);
    ins (map, "lshr_bv16_int", f_lshr_bv_int);
    ins (map, "ashr_bv16_int", f_ashr_bv_int);

    ins (map, "eq_bv16_bv16", f_eq_bv_bv);
    ins (map, "lt_bv16_bv16", f_lt_bv_bv);
    ins (map, "lte_bv16_bv16", f_lte_bv_bv);
    ins (map, "gte_bv16_bv16", f_gte_bv_bv);
    ins (map, "gt_bv16_bv16", f_gt_bv_bv);
    ins (map, "ult_bv16_bv16", f_ult_bv_bv);
    ins (map, "ulte_bv16_bv16", f_ulte_bv_bv);
    ins (map, "ugte_bv16_bv16", f_ugte_bv_bv);
    ins (map, "ugt_bv16_bv16", f_ugt_bv_bv);

    ins (map, "bv32_of_int", f_bv32_of_int);
    ins (map, "int_of_bv32", f_int_of_bv32);
    ins (map, "signed_int_of_bv32", f_signed_int_of_bv32);
    ins (map, "add_bv32_bv32", f_add_bv_bv);
    ins (map, "sub_bv32_bv32", f_sub_bv_bv);
    ins (map, "mul_bv32_bv32", f_mul_bv_bv);
    ins (map, "div_bv32_bv32", f_div_bv_bv);
    ins (map, "udiv_bv32_bv32", f_udiv_bv_bv);
    ins (map, "neg_bv32", f_neg_bv);

    ins (map, "and_bv32_bv32", f_land_bv_bv);
    ins (map, "or_bv32_bv32", f_lor_bv_bv);
    ins (map, "xor_bv32_bv32", f_lxor_bv_bv);
    ins (map, "not_bv32", f_lnot_bv);
    ins (map, "lshl_bv32_bv32", f_lshl_bv_int);
    ins (map, "lshr_bv32_bv32", f_lshr_bv_int);
    ins (map, "ashr_bv32_bv32", f_ashr_bv_int);

    ins (map, "eq_bv32_bv32", f_eq_bv_bv);
    ins (map, "lt_bv32_bv32", f_lt_bv_bv);
    ins (map, "lte_bv32_bv32", f_lte_bv_bv);
    ins (map, "gte_bv32_bv32", f_gte_bv_bv);
    ins (map, "gt_bv32_bv32", f_gt_bv_bv);
    ins (map, "ult_bv32_bv32", f_ult_bv_bv);
    ins (map, "ulte_bv32_bv32", f_ulte_bv_bv);
    ins (map, "ugte_bv32_bv32", f_ugte_bv_bv);
    ins (map, "ugt_bv32_bv32", f_ugt_bv_bv);

    ins (map, "and_bv64_bv64", f_land_bv_bv);
    ins (map, "or_bv64_bv64", f_lor_bv_bv);
    ins (map, "xor_bv64_bv64", f_lxor_bv_bv);
    ins (map, "not_bv64", f_lnot_bv);
    ins (map, "lshl_bv64_int", f_lshl_bv_int);
    ins (map, "lshr_bv64_int", f_lshr_bv_int);
    ins (map, "ashr_bv64_int", f_ashr_bv_int);

    ins (map, "eq_bv64_bv64", f_eq_bv_bv);
    ins (map, "lt_bv64_bv64", f_lt_bv_bv);
    ins (map, "lte_bv64_bv64", f_lte_bv_bv);
    ins (map, "gte_bv64_bv64", f_gte_bv_bv);
    ins (map, "gt_bv64_bv64", f_gt_bv_bv);
    ins (map, "ult_bv64_bv64", f_ult_bv_bv);
    ins (map, "ulte_bv64_bv64", f_ulte_bv_bv);
    ins (map, "ugte_bv64_bv64", f_ugte_bv_bv);
    ins (map, "ugt_bv64_bv64", f_ugt_bv_bv);

    ins (map, "stampseq_swap_at", f_array_swap);

    ins (map, "stampseq_get_at", f_array_select);
    ins (map, "stampseq_set_at", f_array_store);

    ins (map, "lte_stamp_stampseq", f_lte_stamp_stampseq);
    ins (map, "lte_stampseq_stamp", f_lte_stampseq_stamp);
    ins (map, "lte_stamp_stampseq_range", f_lte_stamp_stampseq_range);
  end
}

(* ****** ****** *)
