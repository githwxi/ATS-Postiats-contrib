(*
  Some basic tests for the ATS Z3 bindings
*)

staload "contrib/SMT/Z3/SATS/z3.sats"

implement main () = 0 where {
  val conf = Z3_mk_config ()
  //
  val ctx = Z3_mk_context_rc (conf)
  val _ = Z3_del_config (conf)
  //
  val solve = Z3_mk_solver(ctx)
  //
  val integers = Z3_mk_int_sort (ctx)
  val one = Z3_mk_int (ctx, 1, integers)
  val two = Z3_mk_int (ctx, 2, integers)
  val x = Z3_mk_fresh_const (ctx, "x", integers)
  val y = Z3_mk_fresh_const (ctx, "y", integers)
  //
  val x2 = Z3_mk_mul2 (ctx, two, x)
  val y2 = Z3_mk_mul2 (ctx, two, y)
  //
  val () = begin
    Z3_dec_ref (ctx, x);
    Z3_dec_ref (ctx, y);
    Z3_dec_ref (ctx, two);
  end
  //
  val sum = Z3_mk_add2 (ctx, x2, y2)
  val () = begin
    Z3_dec_ref (ctx, x2);
    Z3_dec_ref (ctx, y2);
  end
  //
  val equation = Z3_mk_eq (ctx, sum, one)
  val () = begin
    Z3_dec_ref (ctx, sum);
  end
  val () = Z3_solver_assert (ctx, solve, equation)
  val () = Z3_dec_ref (ctx, equation)
  val ans = Z3_solver_check (ctx, solve)
  val () = println! ("2x + 2y = 1: ",ans)
  //
  (* Test Bit Vectors... *)
  //
  val bv8 = Z3_mk_bv_sort (ctx, 8u)
  val one8 = Z3_mk_int2bv (ctx, 8, one)
  val b = Z3_mk_fresh_const (ctx, "b", bv8)
  val conj = Z3_mk_bvand (ctx, b, one8)
  val eq = Z3_mk_eq (ctx, conj, one8)

  val () = Z3_solver_assert (ctx, solve, eq)
  val ans = Z3_solver_check (ctx, solve)
  val () = println! ("b & 0x1 = 0x1:", ans)
  
  val () = begin
    Z3_dec_ref (ctx, one8);
    Z3_dec_ref (ctx, eq);
    Z3_dec_ref (ctx, b);
    Z3_dec_ref (ctx, conj);
    Z3_dec_ref (ctx, one);
    Z3_sort_dec_ref (ctx, bv8);
  end
  //
  (* Test Arrays *)
  val integers1 = Z3_sort_inc_ref (ctx, integers)
  val arrays = Z3_mk_array_sort (ctx, integers, integers1)
  
  //
  val _ = Z3_sort_dec_ref (ctx, integers)
  val _ = Z3_sort_dec_ref (ctx, integers1)
  val _ = Z3_sort_dec_ref (ctx, arrays)
  val _ = Z3_solver_dec_ref (ctx, solve)
  val _ = Z3_del_context (ctx)
}