-en
-en /*\n
-en Time of Generation:\n
Sun Dec 25 17:42:07 EST 2016
-en */\n\n
/*
******
*
* HX-2014-08:
* for JavaScript code
* translated from ATS
*
******
*/

/*
******
* beg of [basics_cats.js]
******
*/

/* ****** ****** */

var the_atsptr_null = 0;

/* ****** ****** */

function
ATSCKiseqz(x) { return (x === 0); }
function
ATSCKisneqz(x) { return (x !== 0); }

/* ****** ****** */

function
ATSCKptrisnull(xs) { return (xs === null); }
function
ATSCKptriscons(xs) { return (xs !== null); }

/* ****** ****** */

function
ATSCKpat_int(tmp, given) { return (tmp === given); }
function
ATSCKpat_bool(tmp, given) { return (tmp === given); }
function
ATSCKpat_char(tmp, given) { return (tmp === given); }
function
ATSCKpat_float(tmp, given) { return (tmp === given); }
function
ATSCKpat_string(tmp, given) { return (tmp === given); }

/* ****** ****** */

function
ATSCKpat_con0 (con, tag) { return (con === tag); }
function
ATSCKpat_con1 (con, tag) { return (con[0] === tag); }

/* ****** ****** */
//
function
ATSINScaseof_fail(errmsg)
{
  throw new Error("ATSINScaseof_fail:"+errmsg);
  return;
}
//
function
ATSINSdeadcode_fail()
  { throw new Error("ATSINSdeadcode_fail"); return; }
//
/* ****** ****** */

function
ATSPMVempty() { return; }

/* ****** ****** */
//
function
ATSPMVlazyval(thunk)
  { return [0, thunk]; }
//
/* ****** ****** */

function
ATSPMVlazyval_eval(lazyval)
{
//
  var
  flag, mythunk;
//
  flag = lazyval[0];
//
  if(flag===0)
  {
    lazyval[0] = 1;
    mythunk = lazyval[1];
    lazyval[1] = mythunk[0](mythunk);
  } else {
    lazyval[0] = flag + 1;
  } // end of [if]
//
  return (lazyval[1]);
//
} // end of [ATSPMVlazyval_eval]

/* ****** ****** */
//
function
ATSPMVllazyval(thunk){ return thunk; }
//
/* ****** ****** */
//
function
ATSPMVllazyval_eval(llazyval)
  { return llazyval[0](llazyval, true); }
function
atspre_lazy_vt_free(llazyval)
  { return llazyval[0](llazyval, false); }
//
/* ****** ****** */

function
ats2jspre_alert(msg) { alert(msg); return; }

/* ****** ****** */

function
ats2jspre_confirm(msg) { return confirm(msg); }

/* ****** ****** */
//
function
ats2jspre_prompt_none
  (msg) { return prompt(msg); }
//
function
ats2jspre_prompt_some
  (msg, dflt) { return prompt(msg, dflt); }
//
/* ****** ****** */

function
ats2jspre_typeof(obj) { return typeof(obj); }

/* ****** ****** */
//
function
ats2jspre_tostring(obj) { return String(obj); }
function
ats2jspre_toString(obj) { return String(obj); }
//
/* ****** ****** */

function
ats2jspre_console_log(obj) { return console.log(obj); }

/* ****** ****** */

function
ats2jspre_lazy2cloref(lazyval) { return lazyval[1]; }

/* ****** ****** */
//
function
ats2jspre_ListSubscriptExn_throw
  (/*void*/) { throw new Error("ListSubscriptionExn"); }
function
ats2jspre_ArraySubscriptExn_throw
  (/*void*/) { throw new Error("ArraySubscriptionExn"); }
function
ats2jspre_StreamSubscriptExn_throw
  (/*void*/) { throw new Error("StreamSubscriptionExn"); }
//
/* ****** ****** */
//
function
ats2jspre_assert_bool0(tfv)
  { if (!tfv) throw new Error("Assert"); return; }
function
ats2jspre_assert_bool1(tfv)
  { if (!tfv) throw new Error("Assert"); return; }
//
/* ****** ****** */
//
function
ats2jspre_assert_errmsg_bool0
  (tfv, errmsg) { if (!tfv) throw new Error(errmsg); return; }
function
ats2jspre_assert_errmsg_bool1
  (tfv, errmsg) { if (!tfv) throw new Error(errmsg); return; }
//
/* ****** ****** */
//
/*
//
// HX-2015-10-25:
// Commenting out
// implementation in basics.dats
//
*/
function
ats2jspre_cloref0_app(cf) { return cf[0](cf); }
function
ats2jspre_cloref1_app(cf, x) { return cf[0](cf, x); }
function
ats2jspre_cloref2_app(cf, x1, x2) { return cf[0](cf, x1, x2); }
function
ats2jspre_cloref3_app(cf, x1, x2, x3) { return cf[0](cf, x1, x2, x3); }
//
/* ****** ****** */
//
function
ats2jspre_cloref2fun0(cf)
{
  return function(){return ats2jspre_cloref0_app(cf);};
}
function
ats2jspre_cloref2fun1(cf)
{
  return function(x){return ats2jspre_cloref1_app(cf,x);};
}
function
ats2jspre_cloref2fun2(cf)
{
  return function(x1,x2){return ats2jspre_cloref2_app(cf,x1,x2);};
}
function
ats2jspre_cloref2fun3(cf)
{
  return function(x1,x2,x3){return ats2jspre_cloref2_app(cf,x1,x2,x3);};
}
//
/* ****** ****** */

/* end of [basics_cats.js] */
/*
******
*
* HX-2014-08:
* for JavaScript code
* translated from ATS
*
******
*/

/*
******
* beg of [integer_cats.js]
******
*/

/* ****** ****** */
//
// HX: for signed integers
//
/* ****** ****** */

function
ats2jspre_neg_int0(x) { return ( -x ); }
function
ats2jspre_neg_int1(x) { return ( -x ); }

/* ****** ****** */

function
ats2jspre_abs_int0(x) { return Math.abs(x); }

/* ****** ****** */

function
ats2jspre_succ_int0(x) { return (x + 1); }
function
ats2jspre_pred_int0(x) { return (x - 1); }

/* ****** ****** */

function
ats2jspre_half_int0(x)
{
  return (x >= 0) ? Math.floor(x/2) : Math.ceil(x/2);
}

/* ****** ****** */

function
ats2jspre_succ_int1(x) { return (x + 1); }
function
ats2jspre_pred_int1(x) { return (x - 1); }

/* ****** ****** */

function
ats2jspre_half_int1(x) { return ats2jspre_half_int0(x); }

/* ****** ****** */

function
ats2jspre_add_int0_int0(x, y) { return (x + y); }
function
ats2jspre_sub_int0_int0(x, y) { return (x - y); }
function
ats2jspre_mul_int0_int0(x, y) { return (x * y); }
function
ats2jspre_div_int0_int0(x, y)
{ 
  var q = x / y; return (q >= 0 ? Math.floor(q) : Math.ceil(q));
}
function
ats2jspre_mod_int0_int0(x, y) { return (x % y); }
//
/* ****** ****** */

function
ats2jspre_add_int1_int1(x, y) { return (x + y); }
function
ats2jspre_sub_int1_int1(x, y) { return (x - y); }
function
ats2jspre_mul_int1_int1(x, y) { return (x * y); }
function
ats2jspre_div_int1_int1(x, y) { return ats2jspre_div_int0_int0(x, y); }
//
function
ats2jspre_mod_int1_int1(x, y) { return (x % y); }
function
ats2jspre_nmod_int1_int1(x, y) { return (x % y); }
//
/* ****** ****** */

function
ats2jspre_pow_int0_int1(x, y)
{
  var res = 1;
  while(y >= 2)
  {
    if (y%2 > 0) res *= x;
    x = x * x; y = Math.floor(y/2);
  }
  return (y > 0) ? (x * res) : res;
}

/* ****** ****** */

function
ats2jspre_asl_int0_int1(x, y) { return (x << y); }
function
ats2jspre_asr_int0_int1(x, y) { return (x >> y); }

/* ****** ****** */

function
ats2jspre_lnot_int0(x) { return (~x); }
function
ats2jspre_lor_int0_int0(x, y) { return (x | y); }
function
ats2jspre_lxor_int0_int0(x, y) { return (x ^ y); }
function
ats2jspre_land_int0_int0(x, y) { return (x & y); }

/* ****** ****** */

function
ats2jspre_lt_int0_int0(x, y) { return (x < y); }
function
ats2jspre_lte_int0_int0(x, y) { return (x <= y); }
function
ats2jspre_gt_int0_int0(x, y) { return (x > y); }
function
ats2jspre_gte_int0_int0(x, y) { return (x >= y); }
function
ats2jspre_eq_int0_int0(x, y) { return (x === y); }
function
ats2jspre_neq_int0_int0(x, y) { return (x !== y); }

/* ****** ****** */

function
ats2jspre_compare_int0_int0(x, y)
{
  if (x < y) return -1; else if (x > y) return 1; else return 0;
}

/* ****** ****** */

function
ats2jspre_lt_int1_int1(x, y) { return (x < y); }
function
ats2jspre_lte_int1_int1(x, y) { return (x <= y); }
function
ats2jspre_gt_int1_int1(x, y) { return (x > y); }
function
ats2jspre_gte_int1_int1(x, y) { return (x >= y); }
function
ats2jspre_eq_int1_int1(x, y) { return (x === y); }
function
ats2jspre_neq_int1_int1(x, y) { return (x !== y); }

/* ****** ****** */
//
function
ats2jspre_max_int0_int0(x, y) { return (x >= y) ? x : y ; }
function
ats2jspre_min_int0_int0(x, y) { return (x <= y) ? x : y ; }
//
function
ats2jspre_max_int1_int1(x, y) { return (x >= y) ? x : y ; }
function
ats2jspre_min_int1_int1(x, y) { return (x <= y) ? x : y ; }
//
/* ****** ****** */
//
// HX: for unsigned integers
//
/* ****** ****** */

function
ats2jspre_succ_uint0(x) { return (x + 1); }
function
ats2jspre_pred_uint0(x) { return (x - 1); }

/* ****** ****** */

function
ats2jspre_add_uint0_uint0(x, y) { return (x + y); }
function
ats2jspre_sub_uint0_uint0(x, y) { return (x - y); }
function
ats2jspre_mul_uint0_uint0(x, y) { return (x * y); }
function
ats2jspre_div_uint0_uint0(x, y) { return Math.floor(x/y); }
function
ats2jspre_mod_uint0_uint0(x, y) { return (x % y); }

/* ****** ****** */

function
ats2jspre_lsl_uint0_int1(x, y) { return (x << y); }
function
ats2jspre_lsr_uint0_int1(x, y) { return (x >>> y); }

/* ****** ****** */

function
ats2jspre_lnot_uint0(x) { return (~x); }
function
ats2jspre_lor_uint0_uint0(x, y) { return (x | y); }
function
ats2jspre_lxor_uint0_uint0(x, y) { return (x ^ y); }
function
ats2jspre_land_uint0_uint0(x, y) { return (x & y); }

/* ****** ****** */

function
ats2jspre_lt_uint0_uint0(x, y) { return (x < y); }
function
ats2jspre_lte_uint0_uint0(x, y) { return (x <= y); }
function
ats2jspre_gt_uint0_uint0(x, y) { return (x > y); }
function
ats2jspre_gte_uint0_uint0(x, y) { return (x >= y); }
function
ats2jspre_eq_uint0_uint0(x, y) { return (x === y); }
function
ats2jspre_neq_uint0_uint0(x, y) { return (x !== y); }

/* ****** ****** */

function
ats2jspre_compare_uint0_uint0(x, y)
{
  if (x < y) return -1; else if (x > y) return 1; else return 0;
}

/* ****** ****** */

/* end of [integer_cats.js] */
/*
******
*
* HX-2014-08:
* for JavaScript code
* translated from ATS
*
******
*/

/*
******
* beg of [bool_cats.js]
******
*/

/* ****** ****** */
//
function
ats2jspre_bool2int0(x)
  { return ( x ? 1 : 0 ); }
function
ats2jspre_bool2int1(x)
  { return ( x ? 1 : 0 ); }
//
/* ****** ****** */
//
function
ats2jspre_int2bool0(x)
  { return ( x !== 0 ? true : false ) ; }
function
ats2jspre_int2bool1(x)
  { return ( x !== 0 ? true : false ) ; }
//
/* ****** ****** */
//
function
ats2jspre_neg_bool0(x)
  { return ( x ? false : true ); }
function
ats2jspre_neg_bool1(x)
  { return ( x ? false : true ); }
//
/* ****** ****** */

function
ats2jspre_add_bool0_bool0(x, y) { return (x || y); }
function
ats2jspre_add_bool0_bool1(x, y) { return (x || y); }
function
ats2jspre_add_bool1_bool0(x, y) { return (x || y); }
function
ats2jspre_add_bool1_bool1(x, y) { return (x || y); }

/* ****** ****** */

function
ats2jspre_mul_bool0_bool0(x, y) { return (x && y); }
function
ats2jspre_mul_bool0_bool1(x, y) { return (x && y); }
function
ats2jspre_mul_bool1_bool0(x, y) { return (x && y); }
function
ats2jspre_mul_bool1_bool1(x, y) { return (x && y); }

/* ****** ****** */
//
function
ats2jspre_eq_bool0_bool0(x, y) { return (x === y); }
function
ats2jspre_neq_bool0_bool0(x, y) { return (x !== y); }
//
function
ats2jspre_eq_bool1_bool1(x, y) { return (x === y); }
function
ats2jspre_neq_bool1_bool1(x, y) { return (x !== y); }
//
/* ****** ****** */
//
function
ats2jspre_int2bool0(x)
  { return (x !== 0 ? true : false) ; }
function
ats2jspre_int2bool1(x)
  { return (x !== 0 ? true : false) ; }
//
/* ****** ****** */
//
function
ats2jspre_bool2int0(x) { return (x ? 1 : 0); }
function
ats2jspre_bool2int1(x) { return (x ? 1 : 0); }
//
/* ****** ****** */

/* end of [bool_cats.js] */
/*
******
*
* HX-2014-08:
* for JavaScript code
* translated from ATS
*
******
*/

/*
******
* beg of [float_cats.js]
******
*/

/* ****** ****** */
//
function
ats2jspre_int2double(x) { return x; }
function
ats2jspre_double_of_int(x) { return x; }
//
function
ats2jspre_double2int(x)
{
  return (x >= 0 ? Math.floor(x) : Math.ceil(x));
}
function
ats2jspre_int_of_double(x)
{
  return (x >= 0 ? Math.floor(x) : Math.ceil(x));
}
//
/* ****** ****** */

function
ats2jspre_neg_double(x) { return ( -x ); }

/* ****** ****** */

function
ats2jspre_abs_double(x) { return Math.abs(x); }

/* ****** ****** */
//
function
ats2jspre_add_int_double(x, y) { return (x + y); }
function
ats2jspre_add_double_int(x, y) { return (x + y); }
//
function
ats2jspre_sub_int_double(x, y) { return (x - y); }
function
ats2jspre_sub_double_int(x, y) { return (x - y); }
//
function
ats2jspre_mul_int_double(x, y) { return (x * y); }
function
ats2jspre_mul_double_int(x, y) { return (x * y); }
//
function
ats2jspre_div_int_double(x, y) { return (x / y); }
function
ats2jspre_div_double_int(x, y) { return (x / y); }
//
/* ****** ****** */

function
ats2jspre_pow_double_int1(x, y)
{
  var res = 1;
  while(y >= 2)
  {
    if (y%2 > 0) res *= x;
    x = x * x; y = Math.floor(y/2);
  }
  return (y > 0) ? (x * res) : res;
}

/* ****** ****** */

function
ats2jspre_add_double_double(x, y) { return (x + y); }
function
ats2jspre_sub_double_double(x, y) { return (x - y); }
function
ats2jspre_mul_double_double(x, y) { return (x * y); }
function
ats2jspre_div_double_double(x, y) { return (x / y); }

/* ****** ****** */
//
function
ats2jspre_lt_int_double(x, y) { return (x < y); }
function
ats2jspre_lt_double_int(x, y) { return (x < y); }
//
function
ats2jspre_lte_int_double(x, y) { return (x <= y); }
function
ats2jspre_lte_double_int(x, y) { return (x <= y); }
//
function
ats2jspre_gt_int_double(x, y) { return (x > y); }
function
ats2jspre_gt_double_int(x, y) { return (x > y); }
//
function
ats2jspre_gte_int_double(x, y) { return (x >= y); }
function
ats2jspre_gte_double_int(x, y) { return (x >= y); }
//
/* ****** ****** */

function
ats2jspre_lt_double_double(x, y) { return (x < y); }
function
ats2jspre_lte_double_double(x, y) { return (x <= y); }
function
ats2jspre_gt_double_double(x, y) { return (x > y); }
function
ats2jspre_gte_double_double(x, y) { return (x >= y); }
function
ats2jspre_eq_double_double(x, y) { return (x === y); }
function
ats2jspre_neq_double_double(x, y) { return (x !== y); }

/* ****** ****** */

function
ats2jspre_compare_double_double(x, y)
{
  if (x < y) return -1; else if (x > y) return 1; else return 0;
}

/* ****** ****** */

/* end of [float_cats.js] */
/*
******
*
* HX-2014-08:
* for JavaScript code
* translated from ATS
*
******
*/

/*
******
* beg of [string_cats.js]
******
*/

/* ****** ****** */
//
function
ats2jspre_string_length
  (str) { return str.length ; }
//
/* ****** ****** */
//
function
ats2jspre_string_get_at
  (str, i) { return str.charAt(i) ; }
//
/* ****** ****** */
//
function
ats2jspre_string_substring_beg_end
  (str, i, j) { return str.substring(i, j) ; }
function
ats2jspre_string_substring_beg_len
  (str, i, len) { return str.substring(i, i+len) ; }
//
/* ****** ****** */
//
function
ats2jspre_lt_string_string(x, y) { return (x < y); }
function
ats2jspre_lte_string_string(x, y) { return (x <= y); }
function
ats2jspre_gt_string_string(x, y) { return (x > y); }
function
ats2jspre_gte_string_string(x, y) { return (x >= y); }
//
function
ats2jspre_eq_string_string(x, y) { return (x === y); }
function
ats2jspre_neq_string_string(x, y) { return (x !== y); }
//
/* ****** ****** */
//
function
ats2jspre_compare_string_string(x, y)
{
  if (x < y) return -1; else if (x > y) return 1; else return 0;
}
//
/* ****** ****** */

function
ats2jspre_string_charAt(str, i) { return str.charAt(i) ; }
function
ats2jspre_string_charCodeAt(str, i) { return str.charCodeAt(i) ; }

/* ****** ****** */
//
function
ats2jspre_string_fromCharCode_1
  (c1) { return String.fromCharCode(c1) ; }
function
ats2jspre_string_fromCharCode_2
  (c1,c2) { return String.fromCharCode(c1,c2) ; }
function
ats2jspre_string_fromCharCode_3
  (c1,c2,c3) { return String.fromCharCode(c1,c2,c3) ; }
function
ats2jspre_string_fromCharCode_4
  (c1,c2,c3,c4) { return String.fromCharCode(c1,c2,c3,c4) ; }
function
ats2jspre_string_fromCharCode_5
  (c1,c2,c3,c4,c5) { return String.fromCharCode(c1,c2,c3,c4,c5) ; }
function
ats2jspre_string_fromCharCode_6
  (c1,c2,c3,c4,c5,c6) { return String.fromCharCode(c1,c2,c3,c4,c5,c6) ; }
//
/* ****** ****** */
//
function
ats2jspre_strstr(str, key) { return str.indexOf(key) ; }
function
ats2jspre_string_indexOf_2(str, key) { return str.indexOf(key) ; }
function
ats2jspre_string_indexOf_3(str, key, start) { return str.indexOf(key, start) ; }
//
/* ****** ****** */

function
ats2jspre_string_lastIndexOf_2(str, key) { return str.lastIndexOf(key) ; }
function
ats2jspre_string_lastIndexOf_3(str, key, start) { return str.lastIndexOf(key, start) ; }

/* ****** ****** */

function
ats2jspre_string_append(str1, str2) { return str1.concat(str2) ; }

/* ****** ****** */
//
function
ats2jspre_string_concat_2(str1, str2) { return str1.concat(str2) ; }
function
ats2jspre_string_concat_3(str1, str2, str3) { return str1.concat(str2, str3) ; }
//
/* ****** ****** */

/* end of [string_cats.js] */
/*
******
*
* HX-2015-12:
* for JavaScript code
* translated from ATS
*
******
*/

/*
******
* beg of [gvalue_cats.js]
******
*/

/* ****** ****** */
//
function
ats2jspre_gvhashtbl_make_nil() { return {}; }
//
/* ****** ****** */
//
function
ats2jspre_gvhashtbl_get_atkey(tbl, k0)
{
  var res = tbl[k0];
  return (res !== undefined ? res : ats2jspre_gvalue_nil());
}
//
/* ****** ****** */
//
function
ats2jspre_gvhashtbl_set_atkey(tbl, k0, x0) { tbl[k0] = x0; return; }
//
/* ****** ****** */
//
function
ats2jspre_gvhashtbl_exch_atkey(tbl, k0, x0)
{
  var res = tbl[k0]; tbl[k0] = x0;
  return (res !== undefined ? res : ats2jspre_gvalue_nil());
}
//
/* ****** ****** */

/* end of [gvalue_cats.js] */
/*
******
*
* HX-2014-08:
* for JavaScript code
* translated from ATS
*
******
*/

/*
******
* beg of [JSmath_cats.js]
******
*/

/* ****** ****** */
//
var
ats2jspre_JSmath_E = Math.E
var
ats2jspre_JSmath_PI = Math.PI
var
ats2jspre_JSmath_SQRT2 = Math.SQRT2
var
ats2jspre_JSmath_SQRT1_2 = Math.SQRT1_2
var
ats2jspre_JSmath_LN2 = Math.LN2
var
ats2jspre_JSmath_LN10 = Math.LN10
var
ats2jspre_JSmath_LOG2E = Math.LOG2E
var
ats2jspre_JSmath_LOG10E = Math.LOG10E
//
/* ****** ****** */
//
function
ats2jspre_JSmath_abs(x) { return Math.abs(x); }
//
function
ats2jspre_JSmath_max(x, y) { return Math.max(x, y); }
//
function
ats2jspre_JSmath_min(x, y) { return Math.min(x, y); }
//
/* ****** ****** */
//
function
ats2jspre_JSmath_sqrt(x) { return Math.sqrt(x); }
//
/* ****** ****** */
//
function
ats2jspre_JSmath_exp(x) { return Math.exp(x); }
//
function
ats2jspre_JSmath_pow(x, y) { return Math.pow(x, y); }
//
function
ats2jspre_JSmath_log(x) { return Math.log(x); }
//
/* ****** ****** */
//
function
ats2jspre_JSmath_ceil(x) { return Math.ceil(x); }
function
ats2jspre_JSmath_floor(x) { return Math.floor(x); }
function
ats2jspre_JSmath_round(x) { return Math.round(x); }
//
/* ****** ****** */
//
function
ats2jspre_JSmath_sin(x) { return Math.sin(x); }
function
ats2jspre_JSmath_cos(x) { return Math.cos(x); }
function
ats2jspre_JSmath_tan(x) { return Math.tan(x); }
//
/* ****** ****** */
//
function
ats2jspre_JSmath_asin(x) { return Math.asin(x); }
function
ats2jspre_JSmath_acos(x) { return Math.acos(x); }
function
ats2jspre_JSmath_atan(x) { return Math.atan(x); }
function
ats2jspre_JSmath_atan2(y, x) { return Math.atan2(y, x); }
//
/* ****** ****** */
//
function
ats2jspre_JSmath_random() { return Math.random(); }
//
/* ****** ****** */

/* end of [JSmath_cats.js] */
/*
******
*
* HX-2014-08:
* for JavaScript code
* translated from ATS
*
******
*/

/*
******
* beg of [JSdate_cats.js]
******
*/

/* ****** ****** */
//
function
ats2jspre_Date_new_0
  () { return new Date(); }
function
ats2jspre_Date_new_1_int
  (msec) { return new Date(msec); }
function
ats2jspre_Date_new_1_string
  (date) { return new Date(date); }
function
ats2jspre_Date_new_7
  (year, mon, day, hour, min, sec, ms)
{
  return new Date(year, mon, day, hour, min, sec, ms);
}
//
/* ****** ****** */
//
function
ats2jspre_getTime
  (date) { return date.getTime(); }
function
ats2jspre_getTimezoneOffset
  (date) { return date.getTimezoneOffset(); }
//
/* ****** ****** */
//
function
ats2jspre_getDay(date) { return date.getDay(); }
function
ats2jspre_getDate(date) { return date.getDate(); }
function
ats2jspre_getMonth(date) { return date.getMonth(); }
function
ats2jspre_getFullYear(date) { return date.getFullYear(); }
//
function
ats2jspre_getHours(date) { return date.getHours(); }
function
ats2jspre_getMinutes(date) { return date.getMinutes(); }
function
ats2jspre_getSeconds(date) { return date.getSeconds(); }
function
ats2jspre_getMilliseconds(date) { return date.getMilliseconds(); }
//
/* ****** ****** */
//
function
ats2jspre_getUTCDay(date) { return date.getUTCDay(); }
function
ats2jspre_getUTCDate(date) { return date.getUTCDate(); }
function
ats2jspre_getUTCMonth(date) { return date.getUTCMonth(); }
function
ats2jspre_getUTCFullYear(date) { return date.getUTCFullYear(); }
//
function
ats2jspre_getUTCHours(date) { return date.getUTCHours(); }
function
ats2jspre_getUTCMinutes(date) { return date.getUTCMinutes(); }
function
ats2jspre_getUTCSeconds(date) { return date.getUTCSeconds(); }
function
ats2jspre_getUTCMilliseconds(date) { return date.getUTCMilliseconds(); }
//
/* ****** ****** */

/* end of [JSdate_cats.js] */
/*
******
*
* HX-2014-08:
* for JavaScript code
* translated from ATS
*
******
*/

/*
******
* beg of [JSarray_cats.js]
******
*/

/* ****** ****** */

function
ats2jspre_JSarray_nil() { return []; }
function
ats2jspre_JSarray_sing(x) { return [x]; }
function
ats2jspre_JSarray_pair(x1, x2) { return [x1, x2]; }

/* ****** ****** */

function
ats2jspre_JSarray_copy_arrayref(A, n)
{
//
  var A2 = new Array(n);
  for (var i = 0; i < n; i += 1) A2[i] = A[i]; return A2;
//
} // end of [ats2jspre_JSarray_copy_arrayref]

/* ****** ****** */
//
function
ats2jspre_JSarray_get_at
  (A, i) { return A[i]; }
function
ats2jspre_JSarray_set_at
  (A, i, x0) { A[i] = x0; return; }
//
function
ats2jspre_JSarray_exch_at
  (A, i, x0) { var x1 = A[i]; A[i] = x0; return x1; }
//
/* ****** ****** */
//
function
ats2jspre_JSarray_length(A) { return A.length; }
//
/* ****** ****** */

function
ats2jspre_JSarray_pop(A) { return A.pop(); }
function
ats2jspre_JSarray_push(A, x) { return A.push(x); }

/* ****** ****** */

function
ats2jspre_JSarray_shift(A) { return A.shift(); }
function
ats2jspre_JSarray_unshift(A, x) { return A.unshift(x); }

/* ****** ****** */

function
ats2jspre_JSarray_reverse(A) { return A.reverse(); }

/* ****** ****** */

function
ats2jspre_JSarray_copy(A) { return A.slice(0); }

/* ****** ****** */

function
ats2jspre_JSarray_concat(A1, A2) { return A1.concat(A2); }

/* ****** ****** */
//
function
ats2jspre_JSarray_insert_at
  (A, i, x) { A.splice(i, 0, x); return; }
//
function
ats2jspre_JSarray_takeout_at
  (A, i) { var res = A.splice(i, 1); return res[0]; }
//
function
ats2jspre_JSarray_remove_at(A, i) { A.splice(i, 1); return; }
//
/* ****** ****** */
//
function
ats2jspre_JSarray_join(A) { return A.join(""); }
function
ats2jspre_JSarray_join_sep(A, sep) { return A.join(sep); }
//
/* ****** ****** */
//
function
ats2jspre_JSarray_sort_2(A, cmp)
  { A.sort(ats2jspre_cloref2fun2(cmp)); return; }
//
/* ****** ****** */

/* end of [JSarray_cats.js] */
/*
******
*
* HX-2014-08:
* for JavaScript code
* translated from ATS
*
******
*/

/*
******
* beg of [JSglobal_cats.js]
******
*/

/* ****** ****** */

function
ats2jspre_eval(code) { return eval(code); }

/* ****** ****** */

function
ats2jspre_Number(obj) { return Number(obj); }
function
ats2jspre_String(obj) { return String(obj); }

/* ****** ****** */

function
ats2jspre_isFinite_int(x) { return isFinite(x); }
function
ats2jspre_isFinite_double(x) { return isFinite(x); }

/* ****** ****** */

function
ats2jspre_isNaN_int(x) { return isNaN(x); }
function
ats2jspre_isNaN_double(x) { return isNaN(x); }

/* ****** ****** */

function
ats2jspre_parseInt_1(rep) { return parseInt(rep); }
function
ats2jspre_parseInt_2(rep, base) { return parseInt(rep, base); }

/* ****** ****** */

function
ats2jspre_parseFloat(rep) { return parseFloat(rep); }

/* ****** ****** */

function
ats2jspre_encodeURI(uri) { return encodeURI(uri); }
function
ats2jspre_decodeURI(uri) { return decodeURI(uri); }

/* ****** ****** */

function
ats2jspre_encodeURIComponent(uri) { return encodeURIComponent(uri); }
function
ats2jspre_decodeURIComponent(uri) { return decodeURIComponent(uri); }

/* ****** ****** */

/* end of [JSglobal_cats.js] */
/*
******
*
* HX-2014-08:
* for JavaScript code
* translated from ATS
*
******
*/

/*
******
* beg of [Ajax_cats.js]
******
*/

/* ****** ****** */

function
ats2js_Ajax_XMLHttpRequest_new
(
  // argumentless
)
{ 
  var res = new XMLHttpRequest(); return res;
}

/* ****** ****** */
//
function
ats2js_Ajax_XMLHttpRequest_open
  (xmlhttp, method, URL, async)
  { xmlhttp.open(method, URL, async); return; }
//
/* ****** ****** */
//
function
ats2js_Ajax_XMLHttpRequest_send_0
  (xmlhttp) { xmlhttp.send(); return; }
function
ats2js_Ajax_XMLHttpRequest_send_1
  (xmlhttp, msg) { xmlhttp.send(msg); return; }
//
/* ****** ****** */
//
function
ats2js_Ajax_XMLHttpRequest_setRequestHeader
  (xmlhttp, header, value)
  { xmlhttp.setRequestHeader(header, value); return; }
//
/* ****** ****** */
//
function
ats2js_Ajax_XMLHttpRequest_get_responseXML
  (xmlhttp) { return xmlhttp.responseXML; }
function
ats2js_Ajax_XMLHttpRequest_get_responseText
  (xmlhttp) { return xmlhttp.responseText; }
//
/* ****** ****** */
//
function
ats2js_Ajax_XMLHttpRequest_get_status
  (xmlhttp) { return xmlhttp.status; }
//
function
ats2js_Ajax_XMLHttpRequest_get_readyState
  (xmlhttp) { return xmlhttp.readyState; }
//
function
ats2js_Ajax_XMLHttpRequest_set_onreadystatechange
  (xmlhttp, f_action)
{
  xmlhttp.onreadystatechange = function() { f_action[0](f_action); };
}
//
/* ****** ****** */
//
// HX-2014-09: Convenience functions
//
/* ****** ****** */
//
function
ats2js_Ajax_XMLHttpRequest_is_ready_okay
  (xmlhttp) { return xmlhttp.readyState===4 && xmlhttp.status===200; }
//
/* ****** ****** */

/* end of [Ajax_cats.js] */
/*
******
*
* HX-2014-08:
* for JavaScript code
* translated from ATS
*
******
*/

/*
******
* beg of [canvas2d_cats.js]
******
*/

/* ****** ****** */

function
ats2js_HTML5_canvas_getById
  (id)
{
  var
  canvas =
  document.getElementById(id);
  if(!canvas)
  {
    throw "ats2js_HTML5_canvas_getById: canvas is not found";
  }
  return canvas;
}

/* ****** ****** */

function
ats2js_HTML5_canvas2d_getById
  (id)
{
  var
  canvas =
  document.getElementById(id);
  if(!canvas)
  {
    throw "ats2js_HTML5_canvas_getById: canvas is not found";
  }
  if(!canvas.getContext)
  {
    throw "ats2js_HTML5_canvas2d_getById: canvas-2d is not supported";
  }
  return canvas.getContext("2d");
}

/* ****** ****** */

function
ats2js_HTML5_canvas2d_beginPath
  (ctx) { ctx.beginPath(); return; }
function
ats2js_HTML5_canvas2d_closePath
  (ctx) { ctx.closePath(); return; }

/* ****** ****** */

function
ats2js_HTML5_canvas2d_moveTo
  (ctx, x, y) { ctx.moveTo(x, y); return; }
function
ats2js_HTML5_canvas2d_lineTo
  (ctx, x, y) { ctx.lineTo(x, y); return; }

/* ****** ****** */
//
function
ats2js_HTML5_canvas2d_translate
  (ctx, x, y) { ctx.translate(x, y); return; }
//
function
ats2js_HTML5_canvas2d_scale
  (ctx, sx, sy) { ctx.scale(sx, sy); return; }
//
function
ats2js_HTML5_canvas2d_rotate
  (ctx, rangle) { ctx.rotate(rangle); return; }
//
/* ****** ****** */

function
ats2js_HTML5_canvas2d_rect
  (ctx, xul, yul, width, height)
{
  ctx.rect(xul, yul, width, height); return;
} /* end of [ats2js_HTML5_canvas2d_rect] */

function
ats2js_HTML5_canvas2d_arc
  (ctx, xc, yc, rad, angle_beg, angle_end, CCW)
{
  ctx.arc(xc, yc, rad, angle_beg, angle_end, CCW); return;
} /* end of [ats2js_HTML5_canvas2d_arc] */

/* ****** ****** */

function
ats2js_HTML5_canvas2d_clearRect
  (ctx, xul, yul, width, height)
{
  ctx.clearRect(xul, yul, width, height); return;
} /* end of [ats2js_HTML5_canvas2d_clearRect] */

/* ****** ****** */
//
function
ats2js_HTML5_canvas2d_fill(ctx) { ctx.fill(); return; }
function
ats2js_HTML5_canvas2d_stroke(ctx) { ctx.stroke(); return; }
//
/* ****** ****** */
//
function
ats2js_HTML5_canvas2d_fillRect
  (ctx, xul, yul, width, height)
{
  ctx.fillRect(xul, yul, width, height); return;
} /* end of [ats2js_HTML5_canvas2d_fillRect] */
//
function
ats2js_HTML5_canvas2d_strokeRect
  (ctx, xul, yul, width, height)
{
  ctx.strokeRect(xul, yul, width, height); return;
} /* end of [ats2js_HTML5_canvas2d_strokeRect] */
//
/* ****** ****** */
//
function
ats2js_HTML5_canvas2d_fillText
  (ctx, text, xstart, ystart)
{
  ctx.fillText(text, xstart, ystart); return;
}
function
ats2js_HTML5_canvas2d_fillText2
  (ctx, text, xstart, ystart, maxWidth)
{ 
  ctx.fillText2(text, xstart, ystart, maxWidth); return;
}
//
/* ****** ****** */

function
ats2js_HTML5_canvas2d_save(ctx) { ctx.save(); return; }
function
ats2js_HTML5_canvas2d_restore(ctx) { ctx.restore(); return; }

/* ****** ****** */
//
function
ats2js_HTML5_canvas2d_get_lineWidth
  (ctx) { return ctx.lineWidth; }
function
ats2js_HTML5_canvas2d_set_lineWidth_int
  (ctx, lineWidth) { ctx.lineWidth = lineWidth; return; }
function
ats2js_HTML5_canvas2d_set_lineWidth_double
  (ctx, lineWidth) { ctx.lineWidth = lineWidth; return; }
//
/* ****** ****** */

function
ats2js_HTML5_canvas2d_set_font_string
  (ctx, font) { ctx.font = font; return; }
function
ats2js_HTML5_canvas2d_set_textAlign_string
  (ctx, textAlign) { ctx.textAlign = textAlign; return; }
function
ats2js_HTML5_canvas2d_set_textBaseline_string
  (ctx, textBaseline) { ctx.textBaseline = textBaseline; return; }

/* ****** ****** */

function
ats2js_HTML5_canvas2d_set_fillStyle_string
  (ctx, fillStyle) { ctx.fillStyle = fillStyle; return; }
function
ats2js_HTML5_canvas2d_set_strokeStyle_string
  (ctx, strokeStyle) { ctx.strokeStyle = strokeStyle; return; }

/* ****** ****** */

function
ats2js_HTML5_canvas2d_set_shadowColor_string
  (ctx, shadowColor) { ctx.shadowColor = shadowColor; return; }

/* ****** ****** */

function
ats2js_HTML5_canvas2d_set_shadowBlur_int
  (ctx, shadowBlur) { ctx.shadowBlur = shadowBlur; return; }
function
ats2js_HTML5_canvas2d_set_shadowBlur_string
  (ctx, shadowBlur) { ctx.shadowBlur = shadowBlur; return; }

/* ****** ****** */
//
function
ats2js_HTML5_canvas2d_set_shadowOffsetX_int
  (ctx, X) { ctx.shadowOffsetX = X; return; }
function
ats2js_HTML5_canvas2d_set_shadowOffsetX_double
  (ctx, X) { ctx.shadowOffsetX = X; return; }
//
function
ats2js_HTML5_canvas2d_set_shadowOffsetY_int
  (ctx, Y) { ctx.shadowOffsetY = Y; return; }
function
ats2js_HTML5_canvas2d_set_shadowOffsetY_double
  (ctx, Y) { ctx.shadowOffsetY = Y; return; }
//
/* ****** ****** */

function
ats2js_HTML5_canvas2d_createLinearGradient
  (ctx, x0, y0, x1, y1)
{
  return ctx.createLinearGradient(x0, y0, x1, y1);
}

/* ****** ****** */
//
function
ats2js_HTML5_canvas2d_gradient_addColorStop
  (grad, stop, color) { grad.addColorStop(stop, color); return; }
//
/* ****** ****** */
//
function
ats2js_HTML5_canvas2d_set_fillStyle_gradient
  (ctx, gradient) { ctx.fillStyle = gradient; return; }
function
ats2js_HTML5_canvas2d_set_strokeStyle_gradient
  (ctx, gradient) { ctx.strokeStyle = gradient; return; }
//
/* ****** ****** */

/* end of [canvas2d_cats.js] */
/*
**
** The JavaScript code is generated by atscc2js
** The starting compilation time is: 2016-12-25: 17h:42m
**
*/

/* ****** ****** */

/* end-of-compilation-unit */
/*
**
** The JavaScript code is generated by atscc2js
** The starting compilation time is: 2016-12-25: 17h:42m
**
*/

function
ats2jspre_char_isalpha(arg0)
{
//
// knd = 0
  var tmpret0
  var tmp1
  var tmp2
  var tmp3
  var tmp4
  var tmplab, tmplab_js
//
  // __patsflab_char_isalpha
  tmp2 = ats2jspre_lte_int0_int0(65, arg0);
  if(tmp2) {
    tmp1 = ats2jspre_lte_int0_int0(arg0, 90);
  } else {
    tmp1 = false;
  } // endif
  if(tmp1) {
    tmpret0 = true;
  } else {
    tmp4 = ats2jspre_lte_int0_int0(97, arg0);
    if(tmp4) {
      tmp3 = ats2jspre_lte_int0_int0(arg0, 122);
    } else {
      tmp3 = false;
    } // endif
    if(tmp3) {
      tmpret0 = true;
    } else {
      tmpret0 = false;
    } // endif
  } // endif
  return tmpret0;
} // end-of-function


function
ats2jspre_char_isalnum(arg0)
{
//
// knd = 0
  var tmpret5
  var tmp6
  var tmp7
  var tmp8
  var tmp9
  var tmp10
  var tmp11
  var tmplab, tmplab_js
//
  // __patsflab_char_isalnum
  tmp7 = ats2jspre_lte_int0_int0(48, arg0);
  if(tmp7) {
    tmp6 = ats2jspre_lte_int0_int0(arg0, 57);
  } else {
    tmp6 = false;
  } // endif
  if(tmp6) {
    tmpret5 = true;
  } else {
    tmp9 = ats2jspre_lte_int0_int0(65, arg0);
    if(tmp9) {
      tmp8 = ats2jspre_lte_int0_int0(arg0, 90);
    } else {
      tmp8 = false;
    } // endif
    if(tmp8) {
      tmpret5 = true;
    } else {
      tmp11 = ats2jspre_lte_int0_int0(97, arg0);
      if(tmp11) {
        tmp10 = ats2jspre_lte_int0_int0(arg0, 122);
      } else {
        tmp10 = false;
      } // endif
      if(tmp10) {
        tmpret5 = true;
      } else {
        tmpret5 = false;
      } // endif
    } // endif
  } // endif
  return tmpret5;
} // end-of-function


function
ats2jspre_char_isdigit(arg0)
{
//
// knd = 0
  var tmpret12
  var tmp13
  var tmp14
  var tmplab, tmplab_js
//
  // __patsflab_char_isdigit
  tmp14 = ats2jspre_lte_int0_int0(48, arg0);
  if(tmp14) {
    tmp13 = ats2jspre_lte_int0_int0(arg0, 57);
  } else {
    tmp13 = false;
  } // endif
  if(tmp13) {
    tmpret12 = true;
  } else {
    tmpret12 = false;
  } // endif
  return tmpret12;
} // end-of-function


function
ats2jspre_char_isspace(arg0)
{
//
// knd = 0
  var tmpret15
  var tmp16
  var tmp17
  var tmp18
  var tmp19
  var tmp20
  var tmp21
  var tmplab, tmplab_js
//
  // __patsflab_char_isspace
  tmp16 = ats2jspre_eq_int0_int0(arg0, 9);
  if(tmp16) {
    tmpret15 = true;
  } else {
    tmp17 = ats2jspre_eq_int0_int0(arg0, 10);
    if(tmp17) {
      tmpret15 = true;
    } else {
      tmp18 = ats2jspre_eq_int0_int0(arg0, 11);
      if(tmp18) {
        tmpret15 = true;
      } else {
        tmp19 = ats2jspre_eq_int0_int0(arg0, 12);
        if(tmp19) {
          tmpret15 = true;
        } else {
          tmp20 = ats2jspre_eq_int0_int0(arg0, 13);
          if(tmp20) {
            tmpret15 = true;
          } else {
            tmp21 = ats2jspre_eq_int0_int0(arg0, 32);
            if(tmp21) {
              tmpret15 = true;
            } else {
              tmpret15 = false;
            } // endif
          } // endif
        } // endif
      } // endif
    } // endif
  } // endif
  return tmpret15;
} // end-of-function


/* ****** ****** */

/* end-of-compilation-unit */
/*
**
** The JavaScript code is generated by atscc2js
** The starting compilation time is: 2016-12-25: 17h:42m
**
*/

function
_ats2jspre_string_patsfun_4__closurerize(env0, env1, env2)
{
  return [function(cenv, arg0) { return _ats2jspre_string_patsfun_4(cenv[1], cenv[2], cenv[3], arg0); }, env0, env1, env2];
}


function
_ats2jspre_string_patsfun_8__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_string_patsfun_8(cenv[1], arg0); }, env0];
}


function
_ats2jspre_string_patsfun_12__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_string_patsfun_12(cenv[1], arg0); }, env0];
}


function
_ats2jspre_string_patsfun_16__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_string_patsfun_16(cenv[1], arg0); }, env0];
}


function
ats2jspre_strchr_code(arg0)
{
//
// knd = 0
  var tmpret0
  var tmplab, tmplab_js
//
  // __patsflab_strchr_code
  tmpret0 = ats2jspre_string_charCodeAt(arg0, 0);
  return tmpret0;
} // end-of-function


function
ats2jspre_string_fset_at(arg0, arg1, arg2)
{
//
// knd = 0
  var tmpret1
  var tmp2
  var tmp3
  var tmp4
  var tmp5
  var tmp6
  var tmplab, tmplab_js
//
  // __patsflab_string_fset_at
  tmp2 = ats2jspre_string_length(arg0);
  tmp3 = ats2jspre_string_substring_beg_end(arg0, 0, arg1);
  tmp5 = ats2jspre_add_int1_int1(arg1, 1);
  tmp4 = ats2jspre_string_substring_beg_end(arg0, tmp5, tmp2);
  tmp6 = ats2jspre_string_concat_3(tmp3, arg2, tmp4);
  tmpret1 = tmp6;
  return tmpret1;
} // end-of-function


function
ats2jspre_streamize_string_code(arg0)
{
//
// knd = 0
  var tmpret7
  var tmp8
  var tmplab, tmplab_js
//
  // __patsflab_streamize_string_code
  tmp8 = ats2jspre_string_length(arg0);
  tmpret7 = _ats2jspre_string_auxmain_3(arg0, tmp8, 0);
  return tmpret7;
} // end-of-function


function
_ats2jspre_string_auxmain_3(env0, env1, arg0)
{
//
// knd = 0
  var tmpret9
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_string_auxmain_3
  tmpret9 = ATSPMVllazyval(_ats2jspre_string_patsfun_4__closurerize(env0, env1, arg0));
  return tmpret9;
} // end-of-function


function
_ats2jspre_string_patsfun_4(env0, env1, env2, arg0)
{
//
// knd = 0
  var tmpret10
  var tmp11
  var tmp12
  var tmp13
  var tmp14
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_string_patsfun_4
  if(arg0) {
    tmp11 = ats2jspre_lt_int1_int1(env2, env1);
    if(tmp11) {
      tmp12 = ats2jspre_string_charCodeAt(env0, env2);
      tmp14 = ats2jspre_add_int1_int1(env2, 1);
      tmp13 = _ats2jspre_string_auxmain_3(env0, env1, tmp14);
      tmpret10 = [tmp12, tmp13];
    } else {
      tmpret10 = null;
    } // endif
  } else {
  } // endif
  return tmpret10;
} // end-of-function


function
string_exists_cloref(arg0, arg1)
{
//
// knd = 0
  var tmpret15
  var tmp16
  var tmplab, tmplab_js
//
  // __patsflab_string_exists_cloref
  tmp16 = ats2jspre_string_length(arg0);
  tmpret15 = _ats2jspre_string_loop_6(arg1, arg0, tmp16, 0);
  return tmpret15;
} // end-of-function


function
_ats2jspre_string_loop_6(env0, env1, env2, arg0)
{
//
// knd = 1
  var apy0
  var tmpret17
  var tmp18
  var tmp19
  var tmp20
  var tmp21
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_string_loop_6
    tmp18 = ats2jspre_lt_int1_int1(arg0, env2);
    if(tmp18) {
      tmp20 = ats2jspre_string_get_at(env1, arg0);
      tmp19 = env0[0](env0, tmp20);
      if(tmp19) {
        tmpret17 = true;
      } else {
        tmp21 = ats2jspre_add_int1_int1(arg0, 1);
        // ATStailcalseq_beg
        apy0 = tmp21;
        arg0 = apy0;
        funlab_js = 1; // __patsflab__ats2jspre_string_loop_6
        // ATStailcalseq_end
      } // endif
    } else {
      tmpret17 = false;
    } // endif
    if (funlab_js > 0) continue; else return tmpret17;
  } // endwhile-fun
} // end-of-function


function
string_exists_method(arg0)
{
//
// knd = 0
  var tmpret22
  var tmplab, tmplab_js
//
  // __patsflab_string_exists_method
  tmpret22 = _ats2jspre_string_patsfun_8__closurerize(arg0);
  return tmpret22;
} // end-of-function


function
_ats2jspre_string_patsfun_8(env0, arg0)
{
//
// knd = 0
  var tmpret23
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_string_patsfun_8
  tmpret23 = string_exists_cloref(env0, arg0);
  return tmpret23;
} // end-of-function


function
string_forall_cloref(arg0, arg1)
{
//
// knd = 0
  var tmpret24
  var tmp25
  var tmplab, tmplab_js
//
  // __patsflab_string_forall_cloref
  tmp25 = ats2jspre_string_length(arg0);
  tmpret24 = _ats2jspre_string_loop_10(arg1, arg0, tmp25, 0);
  return tmpret24;
} // end-of-function


function
_ats2jspre_string_loop_10(env0, env1, env2, arg0)
{
//
// knd = 1
  var apy0
  var tmpret26
  var tmp27
  var tmp28
  var tmp29
  var tmp30
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_string_loop_10
    tmp27 = ats2jspre_lt_int1_int1(arg0, env2);
    if(tmp27) {
      tmp29 = ats2jspre_string_get_at(env1, arg0);
      tmp28 = env0[0](env0, tmp29);
      if(tmp28) {
        tmp30 = ats2jspre_add_int1_int1(arg0, 1);
        // ATStailcalseq_beg
        apy0 = tmp30;
        arg0 = apy0;
        funlab_js = 1; // __patsflab__ats2jspre_string_loop_10
        // ATStailcalseq_end
      } else {
        tmpret26 = false;
      } // endif
    } else {
      tmpret26 = true;
    } // endif
    if (funlab_js > 0) continue; else return tmpret26;
  } // endwhile-fun
} // end-of-function


function
string_forall_method(arg0)
{
//
// knd = 0
  var tmpret31
  var tmplab, tmplab_js
//
  // __patsflab_string_forall_method
  tmpret31 = _ats2jspre_string_patsfun_12__closurerize(arg0);
  return tmpret31;
} // end-of-function


function
_ats2jspre_string_patsfun_12(env0, arg0)
{
//
// knd = 0
  var tmpret32
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_string_patsfun_12
  tmpret32 = string_forall_cloref(env0, arg0);
  return tmpret32;
} // end-of-function


function
string_foreach_cloref(arg0, arg1)
{
//
// knd = 0
  var tmp34
  var tmplab, tmplab_js
//
  // __patsflab_string_foreach_cloref
  tmp34 = ats2jspre_string_length(arg0);
  _ats2jspre_string_loop_14(arg1, arg0, tmp34, 0);
  return/*_void*/;
} // end-of-function


function
_ats2jspre_string_loop_14(env0, env1, env2, arg0)
{
//
// knd = 1
  var apy0
  var tmp36
  var tmp38
  var tmp39
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_string_loop_14
    tmp36 = ats2jspre_lt_int1_int1(arg0, env2);
    if(tmp36) {
      tmp38 = ats2jspre_string_get_at(env1, arg0);
      env0[0](env0, tmp38);
      tmp39 = ats2jspre_add_int1_int1(arg0, 1);
      // ATStailcalseq_beg
      apy0 = tmp39;
      arg0 = apy0;
      funlab_js = 1; // __patsflab__ats2jspre_string_loop_14
      // ATStailcalseq_end
    } else {
      // ATSINSmove_void
    } // endif
    if (funlab_js > 0) continue; else return/*_void*/;
  } // endwhile-fun
} // end-of-function


function
string_foreach_method(arg0)
{
//
// knd = 0
  var tmpret40
  var tmplab, tmplab_js
//
  // __patsflab_string_foreach_method
  tmpret40 = _ats2jspre_string_patsfun_16__closurerize(arg0);
  return tmpret40;
} // end-of-function


function
_ats2jspre_string_patsfun_16(env0, arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_string_patsfun_16
  string_foreach_cloref(env0, arg0);
  return/*_void*/;
} // end-of-function


function
string_tabulate_cloref(arg0, arg1)
{
//
// knd = 0
  var tmpret42
  var tmp43
  var tmp44
  var tmplab, tmplab_js
//
  // __patsflab_string_tabulate_cloref
  tmp44 = _057_Users_057_RyanKing_057_ATS2_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_JSarray_056_sats__JSarray_tabulate_cloref(arg0, arg1);
  tmp43 = ats2jspre_JSarray_join_sep(tmp44, "");
  tmpret42 = tmp43;
  return tmpret42;
} // end-of-function


/* ****** ****** */

/* end-of-compilation-unit */
/*
**
** The JavaScript code is generated by atscc2js
** The starting compilation time is: 2016-12-25: 17h:42m
**
*/

function
_ats2jspre_list_patsfun_31__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_list_patsfun_31(cenv[1], arg0); }, env0];
}


function
_ats2jspre_list_patsfun_35__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_list_patsfun_35(cenv[1], arg0); }, env0];
}


function
_ats2jspre_list_patsfun_38__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_list_patsfun_38(cenv[1], arg0); }, env0];
}


function
_ats2jspre_list_patsfun_42__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_list_patsfun_42(cenv[1], arg0); }, env0];
}


function
_ats2jspre_list_patsfun_46__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_list_patsfun_46(cenv[1], arg0); }, env0];
}


function
_ats2jspre_list_patsfun_50__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_list_patsfun_50(cenv[1], arg0); }, env0];
}


function
_ats2jspre_list_patsfun_53__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_list_patsfun_53(cenv[1], arg0); }, env0];
}


function
_ats2jspre_list_patsfun_57__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_list_patsfun_57(cenv[1], arg0); }, env0];
}


function
_ats2jspre_list_patsfun_61__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_list_patsfun_61(cenv[1], arg0); }, env0];
}


function
_ats2jspre_list_patsfun_65__closurerize(env0, env1)
{
  return [function(cenv, arg0) { return _ats2jspre_list_patsfun_65(cenv[1], cenv[2], arg0); }, env0, env1];
}


function
_ats2jspre_list_patsfun_69__closurerize(env0, env1)
{
  return [function(cenv, arg0) { return _ats2jspre_list_patsfun_69(cenv[1], cenv[2], arg0); }, env0, env1];
}


function
_ats2jspre_list_patsfun_73__closurerize(env0, env1)
{
  return [function(cenv, arg0) { return _ats2jspre_list_patsfun_73(cenv[1], cenv[2], arg0); }, env0, env1];
}


function
_ats2jspre_list_patsfun_77__closurerize(env0, env1)
{
  return [function(cenv, arg0) { return _ats2jspre_list_patsfun_77(cenv[1], cenv[2], arg0); }, env0, env1];
}


function
_ats2jspre_list_patsfun_82__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_list_patsfun_82(cenv[1], arg0); }, env0];
}


function
_ats2jspre_list_patsfun_85__closurerize(env0, env1)
{
  return [function(cenv, arg0) { return _ats2jspre_list_patsfun_85(cenv[1], cenv[2], arg0); }, env0, env1];
}


function
_ats2jspre_list_patsfun_88__closurerize(env0, env1)
{
  return [function(cenv, arg0) { return _ats2jspre_list_patsfun_88(cenv[1], cenv[2], arg0); }, env0, env1];
}


function
_ats2jspre_list_patsfun_90__closurerize(env0, env1)
{
  return [function(cenv, arg0) { return _ats2jspre_list_patsfun_90(cenv[1], cenv[2], arg0); }, env0, env1];
}


function
ats2jspre_list_make_intrange_2(arg0, arg1)
{
//
// knd = 0
  var tmpret2
  var tmplab, tmplab_js
//
  // __patsflab_list_make_intrange_2
  tmpret2 = ats2jspre_list_make_intrange_3(arg0, arg1, 1);
  return tmpret2;
} // end-of-function


function
ats2jspre_list_make_intrange_3(arg0, arg1, arg2)
{
//
// knd = 0
  var tmpret3
  var tmp14
  var tmp15
  var tmp16
  var tmp17
  var tmp18
  var tmp19
  var tmp20
  var tmp21
  var tmp22
  var tmp23
  var tmp24
  var tmp25
  var tmp26
  var tmp27
  var tmp28
  var tmp29
  var tmp30
  var tmp31
  var tmp32
  var tmp33
  var tmp34
  var tmplab, tmplab_js
//
  // __patsflab_list_make_intrange_3
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab6
      tmp14 = ats2jspre_gt_int0_int0(arg2, 0);
      if(!ATSCKpat_bool(tmp14, true)) { tmplab_js = 2; break; }
      tmp15 = ats2jspre_lt_int0_int0(arg0, arg1);
      if(tmp15) {
        tmp19 = ats2jspre_sub_int0_int0(arg1, arg0);
        tmp18 = ats2jspre_add_int0_int0(tmp19, arg2);
        tmp17 = ats2jspre_sub_int0_int0(tmp18, 1);
        tmp16 = ats2jspre_div_int0_int0(tmp17, arg2);
        tmp22 = ats2jspre_sub_int0_int0(tmp16, 1);
        tmp21 = ats2jspre_mul_int0_int0(tmp22, arg2);
        tmp20 = ats2jspre_add_int0_int0(arg0, tmp21);
        tmp23 = null;
        tmpret3 = _ats2jspre_list_loop1_4(tmp16, tmp20, arg2, tmp23);
      } else {
        tmpret3 = null;
      } // endif
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 2: // __atstmplab7
      tmp24 = ats2jspre_lt_int0_int0(arg2, 0);
      if(!ATSCKpat_bool(tmp24, true)) { tmplab_js = 3; break; }
      tmp25 = ats2jspre_gt_int0_int0(arg0, arg1);
      if(tmp25) {
        tmp26 = ats2jspre_neg_int0(arg2);
        tmp30 = ats2jspre_sub_int0_int0(arg0, arg1);
        tmp29 = ats2jspre_add_int0_int0(tmp30, tmp26);
        tmp28 = ats2jspre_sub_int0_int0(tmp29, 1);
        tmp27 = ats2jspre_div_int0_int0(tmp28, tmp26);
        tmp33 = ats2jspre_sub_int0_int0(tmp27, 1);
        tmp32 = ats2jspre_mul_int0_int0(tmp33, tmp26);
        tmp31 = ats2jspre_sub_int0_int0(arg0, tmp32);
        tmp34 = null;
        tmpret3 = _ats2jspre_list_loop2_5(tmp27, tmp31, tmp26, tmp34);
      } else {
        tmpret3 = null;
      } // endif
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab8
      tmpret3 = null;
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret3;
} // end-of-function


function
_ats2jspre_list_loop1_4(arg0, arg1, arg2, arg3)
{
//
// knd = 1
  var apy0
  var apy1
  var apy2
  var apy3
  var tmpret4
  var tmp5
  var tmp6
  var tmp7
  var tmp8
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_list_loop1_4
    tmp5 = ats2jspre_gt_int0_int0(arg0, 0);
    if(tmp5) {
      tmp6 = ats2jspre_sub_int0_int0(arg0, 1);
      tmp7 = ats2jspre_sub_int0_int0(arg1, arg2);
      tmp8 = [arg1, arg3];
      // ATStailcalseq_beg
      apy0 = tmp6;
      apy1 = tmp7;
      apy2 = arg2;
      apy3 = tmp8;
      arg0 = apy0;
      arg1 = apy1;
      arg2 = apy2;
      arg3 = apy3;
      funlab_js = 1; // __patsflab__ats2jspre_list_loop1_4
      // ATStailcalseq_end
    } else {
      tmpret4 = arg3;
    } // endif
    if (funlab_js > 0) continue; else return tmpret4;
  } // endwhile-fun
} // end-of-function


function
_ats2jspre_list_loop2_5(arg0, arg1, arg2, arg3)
{
//
// knd = 1
  var apy0
  var apy1
  var apy2
  var apy3
  var tmpret9
  var tmp10
  var tmp11
  var tmp12
  var tmp13
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_list_loop2_5
    tmp10 = ats2jspre_gt_int0_int0(arg0, 0);
    if(tmp10) {
      tmp11 = ats2jspre_sub_int0_int0(arg0, 1);
      tmp12 = ats2jspre_add_int0_int0(arg1, arg2);
      tmp13 = [arg1, arg3];
      // ATStailcalseq_beg
      apy0 = tmp11;
      apy1 = tmp12;
      apy2 = arg2;
      apy3 = tmp13;
      arg0 = apy0;
      arg1 = apy1;
      arg2 = apy2;
      arg3 = apy3;
      funlab_js = 1; // __patsflab__ats2jspre_list_loop2_5
      // ATStailcalseq_end
    } else {
      tmpret9 = arg3;
    } // endif
    if (funlab_js > 0) continue; else return tmpret9;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_list_length(arg0)
{
//
// knd = 0
  var tmpret46
  var tmplab, tmplab_js
//
  // __patsflab_list_length
  tmpret46 = _ats2jspre_list_loop_12(arg0, 0);
  return tmpret46;
} // end-of-function


function
_ats2jspre_list_loop_12(arg0, arg1)
{
//
// knd = 1
  var apy0
  var apy1
  var tmpret47
  var tmp49
  var tmp50
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_list_loop_12
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab13
        if(ATSCKptriscons(arg0)) { tmplab_js = 4; break; }
        case 2: // __atstmplab14
        tmpret47 = arg1;
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab15
        case 4: // __atstmplab16
        tmp49 = arg0[1];
        tmp50 = ats2jspre_add_int1_int1(arg1, 1);
        // ATStailcalseq_beg
        apy0 = tmp49;
        apy1 = tmp50;
        arg0 = apy0;
        arg1 = apy1;
        funlab_js = 1; // __patsflab__ats2jspre_list_loop_12
        // ATStailcalseq_end
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
    if (funlab_js > 0) continue; else return tmpret47;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_list_last(arg0)
{
//
// knd = 1
  var apy0
  var tmpret51
  var tmp52
  var tmp53
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab_list_last
    tmp52 = arg0[0];
    tmp53 = arg0[1];
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab17
        if(ATSCKptriscons(tmp53)) { tmplab_js = 4; break; }
        case 2: // __atstmplab18
        tmpret51 = tmp52;
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab19
        case 4: // __atstmplab20
        // ATStailcalseq_beg
        apy0 = tmp53;
        arg0 = apy0;
        funlab_js = 1; // __patsflab_list_last
        // ATStailcalseq_end
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
    if (funlab_js > 0) continue; else return tmpret51;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_list_get_at(arg0, arg1)
{
//
// knd = 1
  var apy0
  var apy1
  var tmpret54
  var tmp55
  var tmp56
  var tmp57
  var tmp58
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab_list_get_at
    tmp55 = ats2jspre_eq_int1_int1(arg1, 0);
    if(tmp55) {
      tmp56 = arg0[0];
      tmpret54 = tmp56;
    } else {
      tmp57 = arg0[1];
      tmp58 = ats2jspre_sub_int1_int1(arg1, 1);
      // ATStailcalseq_beg
      apy0 = tmp57;
      apy1 = tmp58;
      arg0 = apy0;
      arg1 = apy1;
      funlab_js = 1; // __patsflab_list_get_at
      // ATStailcalseq_end
    } // endif
    if (funlab_js > 0) continue; else return tmpret54;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_list_snoc(arg0, arg1)
{
//
// knd = 0
  var tmpret59
  var tmp60
  var tmp61
  var tmplab, tmplab_js
//
  // __patsflab_list_snoc
  tmp61 = null;
  tmp60 = [arg1, tmp61];
  tmpret59 = ats2jspre_list_append(arg0, tmp60);
  return tmpret59;
} // end-of-function


function
ats2jspre_list_extend(arg0, arg1)
{
//
// knd = 0
  var tmpret62
  var tmp63
  var tmp64
  var tmplab, tmplab_js
//
  // __patsflab_list_extend
  tmp64 = null;
  tmp63 = [arg1, tmp64];
  tmpret62 = ats2jspre_list_append(arg0, tmp63);
  return tmpret62;
} // end-of-function


function
ats2jspre_list_append(arg0, arg1)
{
//
// knd = 0
  var tmpret65
  var tmp66
  var tmp67
  var tmp68
  var tmplab, tmplab_js
//
  // __patsflab_list_append
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab21
      if(ATSCKptriscons(arg0)) { tmplab_js = 4; break; }
      case 2: // __atstmplab22
      tmpret65 = arg1;
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab23
      case 4: // __atstmplab24
      tmp66 = arg0[0];
      tmp67 = arg0[1];
      tmp68 = ats2jspre_list_append(tmp67, arg1);
      tmpret65 = [tmp66, tmp68];
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret65;
} // end-of-function


function
ats2jspre_list_reverse(arg0)
{
//
// knd = 0
  var tmpret69
  var tmp70
  var tmplab, tmplab_js
//
  // __patsflab_list_reverse
  tmp70 = null;
  tmpret69 = ats2jspre_list_reverse_append(arg0, tmp70);
  return tmpret69;
} // end-of-function


function
ats2jspre_list_reverse_append(arg0, arg1)
{
//
// knd = 0
  var tmpret71
  var tmplab, tmplab_js
//
  // __patsflab_list_reverse_append
  tmpret71 = _ats2jspre_list_loop_20(arg0, arg1);
  return tmpret71;
} // end-of-function


function
_ats2jspre_list_loop_20(arg0, arg1)
{
//
// knd = 1
  var apy0
  var apy1
  var tmpret72
  var tmp73
  var tmp74
  var tmp75
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_list_loop_20
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab25
        if(ATSCKptriscons(arg0)) { tmplab_js = 4; break; }
        case 2: // __atstmplab26
        tmpret72 = arg1;
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab27
        case 4: // __atstmplab28
        tmp73 = arg0[0];
        tmp74 = arg0[1];
        tmp75 = [tmp73, arg1];
        // ATStailcalseq_beg
        apy0 = tmp74;
        apy1 = tmp75;
        arg0 = apy0;
        arg1 = apy1;
        funlab_js = 1; // __patsflab__ats2jspre_list_loop_20
        // ATStailcalseq_end
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
    if (funlab_js > 0) continue; else return tmpret72;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_list_concat(arg0)
{
//
// knd = 0
  var tmpret76
  var tmplab, tmplab_js
//
  // __patsflab_list_concat
  tmpret76 = _ats2jspre_list_auxlst_22(arg0);
  return tmpret76;
} // end-of-function


function
_ats2jspre_list_auxlst_22(arg0)
{
//
// knd = 0
  var tmpret77
  var tmp78
  var tmp79
  var tmp80
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_list_auxlst_22
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab29
      if(ATSCKptriscons(arg0)) { tmplab_js = 4; break; }
      case 2: // __atstmplab30
      tmpret77 = null;
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab31
      case 4: // __atstmplab32
      tmp78 = arg0[0];
      tmp79 = arg0[1];
      tmp80 = _ats2jspre_list_auxlst_22(tmp79);
      tmpret77 = ats2jspre_list_append(tmp78, tmp80);
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret77;
} // end-of-function


function
ats2jspre_list_take(arg0, arg1)
{
//
// knd = 0
  var tmpret81
  var tmp82
  var tmp83
  var tmp84
  var tmp85
  var tmp86
  var tmplab, tmplab_js
//
  // __patsflab_list_take
  tmp82 = ats2jspre_gt_int1_int1(arg1, 0);
  if(tmp82) {
    tmp83 = arg0[0];
    tmp84 = arg0[1];
    tmp86 = ats2jspre_sub_int1_int1(arg1, 1);
    tmp85 = ats2jspre_list_take(tmp84, tmp86);
    tmpret81 = [tmp83, tmp85];
  } else {
    tmpret81 = null;
  } // endif
  return tmpret81;
} // end-of-function


function
ats2jspre_list_drop(arg0, arg1)
{
//
// knd = 1
  var apy0
  var apy1
  var tmpret87
  var tmp88
  var tmp89
  var tmp90
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab_list_drop
    tmp88 = ats2jspre_gt_int1_int1(arg1, 0);
    if(tmp88) {
      tmp89 = arg0[1];
      tmp90 = ats2jspre_sub_int1_int1(arg1, 1);
      // ATStailcalseq_beg
      apy0 = tmp89;
      apy1 = tmp90;
      arg0 = apy0;
      arg1 = apy1;
      funlab_js = 1; // __patsflab_list_drop
      // ATStailcalseq_end
    } else {
      tmpret87 = arg0;
    } // endif
    if (funlab_js > 0) continue; else return tmpret87;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_list_split_at(arg0, arg1)
{
//
// knd = 0
  var tmpret91
  var tmp92
  var tmp93
  var tmplab, tmplab_js
//
  // __patsflab_list_split_at
  tmp92 = ats2jspre_list_take(arg0, arg1);
  tmp93 = ats2jspre_list_drop(arg0, arg1);
  tmpret91 = [tmp92, tmp93];
  return tmpret91;
} // end-of-function


function
ats2jspre_list_insert_at(arg0, arg1, arg2)
{
//
// knd = 0
  var tmpret94
  var tmp95
  var tmp96
  var tmp97
  var tmp98
  var tmp99
  var tmplab, tmplab_js
//
  // __patsflab_list_insert_at
  tmp95 = ats2jspre_gt_int1_int1(arg1, 0);
  if(tmp95) {
    tmp96 = arg0[0];
    tmp97 = arg0[1];
    tmp99 = ats2jspre_sub_int1_int1(arg1, 1);
    tmp98 = ats2jspre_list_insert_at(tmp97, tmp99, arg2);
    tmpret94 = [tmp96, tmp98];
  } else {
    tmpret94 = [arg2, arg0];
  } // endif
  return tmpret94;
} // end-of-function


function
ats2jspre_list_remove_at(arg0, arg1)
{
//
// knd = 0
  var tmpret100
  var tmp101
  var tmp102
  var tmp103
  var tmp104
  var tmp105
  var tmplab, tmplab_js
//
  // __patsflab_list_remove_at
  tmp101 = arg0[0];
  tmp102 = arg0[1];
  tmp103 = ats2jspre_gt_int1_int1(arg1, 0);
  if(tmp103) {
    tmp105 = ats2jspre_sub_int1_int1(arg1, 1);
    tmp104 = ats2jspre_list_remove_at(tmp102, tmp105);
    tmpret100 = [tmp101, tmp104];
  } else {
    tmpret100 = tmp102;
  } // endif
  return tmpret100;
} // end-of-function


function
ats2jspre_list_takeout_at(arg0, arg1)
{
//
// knd = 0
  var tmpret106
  var tmp107
  var tmp108
  var tmp109
  var tmp110
  var tmp111
  var tmp112
  var tmp113
  var tmp114
  var tmplab, tmplab_js
//
  // __patsflab_list_takeout_at
  tmp107 = arg0[0];
  tmp108 = arg0[1];
  tmp109 = ats2jspre_gt_int1_int1(arg1, 0);
  if(tmp109) {
    tmp111 = ats2jspre_sub_int1_int1(arg1, 1);
    tmp110 = ats2jspre_list_takeout_at(tmp108, tmp111);
    tmp112 = tmp110[0];
    tmp113 = tmp110[1];
    tmp114 = [tmp107, tmp113];
    tmpret106 = [tmp112, tmp114];
  } else {
    tmpret106 = [tmp107, tmp108];
  } // endif
  return tmpret106;
} // end-of-function


function
ats2jspre_list_exists(arg0, arg1)
{
//
// knd = 1
  var apy0
  var apy1
  var tmpret115
  var tmp116
  var tmp117
  var tmp118
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab_list_exists
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab33
        if(ATSCKptriscons(arg0)) { tmplab_js = 4; break; }
        case 2: // __atstmplab34
        tmpret115 = false;
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab35
        case 4: // __atstmplab36
        tmp116 = arg0[0];
        tmp117 = arg0[1];
        tmp118 = arg1[0](arg1, tmp116);
        if(tmp118) {
          tmpret115 = true;
        } else {
          // ATStailcalseq_beg
          apy0 = tmp117;
          apy1 = arg1;
          arg0 = apy0;
          arg1 = apy1;
          funlab_js = 1; // __patsflab_list_exists
          // ATStailcalseq_end
        } // endif
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
    if (funlab_js > 0) continue; else return tmpret115;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_list_exists_method(arg0)
{
//
// knd = 0
  var tmpret119
  var tmplab, tmplab_js
//
  // __patsflab_list_exists_method
  tmpret119 = _ats2jspre_list_patsfun_31__closurerize(arg0);
  return tmpret119;
} // end-of-function


function
_ats2jspre_list_patsfun_31(env0, arg0)
{
//
// knd = 0
  var tmpret120
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_list_patsfun_31
  tmpret120 = ats2jspre_list_exists(env0, arg0);
  return tmpret120;
} // end-of-function


function
ats2jspre_list_iexists(arg0, arg1)
{
//
// knd = 0
  var tmpret121
  var tmplab, tmplab_js
//
  // __patsflab_list_iexists
  tmpret121 = _ats2jspre_list_loop_33(arg1, 0, arg0);
  return tmpret121;
} // end-of-function


function
_ats2jspre_list_loop_33(env0, arg0, arg1)
{
//
// knd = 1
  var apy0
  var apy1
  var tmpret122
  var tmp123
  var tmp124
  var tmp125
  var tmp126
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_list_loop_33
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab37
        if(ATSCKptriscons(arg1)) { tmplab_js = 4; break; }
        case 2: // __atstmplab38
        tmpret122 = false;
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab39
        case 4: // __atstmplab40
        tmp123 = arg1[0];
        tmp124 = arg1[1];
        tmp125 = env0[0](env0, arg0, tmp123);
        if(tmp125) {
          tmpret122 = true;
        } else {
          tmp126 = ats2jspre_add_int1_int1(arg0, 1);
          // ATStailcalseq_beg
          apy0 = tmp126;
          apy1 = tmp124;
          arg0 = apy0;
          arg1 = apy1;
          funlab_js = 1; // __patsflab__ats2jspre_list_loop_33
          // ATStailcalseq_end
        } // endif
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
    if (funlab_js > 0) continue; else return tmpret122;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_list_iexists_method(arg0)
{
//
// knd = 0
  var tmpret127
  var tmplab, tmplab_js
//
  // __patsflab_list_iexists_method
  tmpret127 = _ats2jspre_list_patsfun_35__closurerize(arg0);
  return tmpret127;
} // end-of-function


function
_ats2jspre_list_patsfun_35(env0, arg0)
{
//
// knd = 0
  var tmpret128
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_list_patsfun_35
  tmpret128 = ats2jspre_list_iexists(env0, arg0);
  return tmpret128;
} // end-of-function


function
ats2jspre_list_forall(arg0, arg1)
{
//
// knd = 1
  var apy0
  var apy1
  var tmpret129
  var tmp130
  var tmp131
  var tmp132
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab_list_forall
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab41
        if(ATSCKptriscons(arg0)) { tmplab_js = 4; break; }
        case 2: // __atstmplab42
        tmpret129 = true;
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab43
        case 4: // __atstmplab44
        tmp130 = arg0[0];
        tmp131 = arg0[1];
        tmp132 = arg1[0](arg1, tmp130);
        if(tmp132) {
          // ATStailcalseq_beg
          apy0 = tmp131;
          apy1 = arg1;
          arg0 = apy0;
          arg1 = apy1;
          funlab_js = 1; // __patsflab_list_forall
          // ATStailcalseq_end
        } else {
          tmpret129 = false;
        } // endif
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
    if (funlab_js > 0) continue; else return tmpret129;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_list_forall_method(arg0)
{
//
// knd = 0
  var tmpret133
  var tmplab, tmplab_js
//
  // __patsflab_list_forall_method
  tmpret133 = _ats2jspre_list_patsfun_38__closurerize(arg0);
  return tmpret133;
} // end-of-function


function
_ats2jspre_list_patsfun_38(env0, arg0)
{
//
// knd = 0
  var tmpret134
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_list_patsfun_38
  tmpret134 = ats2jspre_list_forall(env0, arg0);
  return tmpret134;
} // end-of-function


function
ats2jspre_list_iforall(arg0, arg1)
{
//
// knd = 0
  var tmpret135
  var tmplab, tmplab_js
//
  // __patsflab_list_iforall
  tmpret135 = _ats2jspre_list_loop_40(arg1, 0, arg0);
  return tmpret135;
} // end-of-function


function
_ats2jspre_list_loop_40(env0, arg0, arg1)
{
//
// knd = 1
  var apy0
  var apy1
  var tmpret136
  var tmp137
  var tmp138
  var tmp139
  var tmp140
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_list_loop_40
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab45
        if(ATSCKptriscons(arg1)) { tmplab_js = 4; break; }
        case 2: // __atstmplab46
        tmpret136 = true;
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab47
        case 4: // __atstmplab48
        tmp137 = arg1[0];
        tmp138 = arg1[1];
        tmp139 = env0[0](env0, arg0, tmp137);
        if(tmp139) {
          tmp140 = ats2jspre_add_int1_int1(arg0, 1);
          // ATStailcalseq_beg
          apy0 = tmp140;
          apy1 = tmp138;
          arg0 = apy0;
          arg1 = apy1;
          funlab_js = 1; // __patsflab__ats2jspre_list_loop_40
          // ATStailcalseq_end
        } else {
          tmpret136 = false;
        } // endif
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
    if (funlab_js > 0) continue; else return tmpret136;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_list_iforall_method(arg0)
{
//
// knd = 0
  var tmpret141
  var tmplab, tmplab_js
//
  // __patsflab_list_iforall_method
  tmpret141 = _ats2jspre_list_patsfun_42__closurerize(arg0);
  return tmpret141;
} // end-of-function


function
_ats2jspre_list_patsfun_42(env0, arg0)
{
//
// knd = 0
  var tmpret142
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_list_patsfun_42
  tmpret142 = ats2jspre_list_iforall(env0, arg0);
  return tmpret142;
} // end-of-function


function
ats2jspre_list_app(arg0, arg1)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_list_app
  ats2jspre_list_foreach(arg0, arg1);
  return/*_void*/;
} // end-of-function


function
ats2jspre_list_foreach(arg0, arg1)
{
//
// knd = 1
  var apy0
  var apy1
  var tmp145
  var tmp146
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab_list_foreach
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab49
        if(ATSCKptriscons(arg0)) { tmplab_js = 4; break; }
        case 2: // __atstmplab50
        // ATSINSmove_void
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab51
        case 4: // __atstmplab52
        tmp145 = arg0[0];
        tmp146 = arg0[1];
        arg1[0](arg1, tmp145);
        // ATStailcalseq_beg
        apy0 = tmp146;
        apy1 = arg1;
        arg0 = apy0;
        arg1 = apy1;
        funlab_js = 1; // __patsflab_list_foreach
        // ATStailcalseq_end
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
    if (funlab_js > 0) continue; else return/*_void*/;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_list_foreach_method(arg0)
{
//
// knd = 0
  var tmpret148
  var tmplab, tmplab_js
//
  // __patsflab_list_foreach_method
  tmpret148 = _ats2jspre_list_patsfun_46__closurerize(arg0);
  return tmpret148;
} // end-of-function


function
_ats2jspre_list_patsfun_46(env0, arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_list_patsfun_46
  ats2jspre_list_foreach(env0, arg0);
  return/*_void*/;
} // end-of-function


function
ats2jspre_list_iforeach(arg0, arg1)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_list_iforeach
  _ats2jspre_list_aux_48(arg1, 0, arg0);
  return/*_void*/;
} // end-of-function


function
_ats2jspre_list_aux_48(env0, arg0, arg1)
{
//
// knd = 1
  var apy0
  var apy1
  var tmp152
  var tmp153
  var tmp155
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_list_aux_48
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab53
        if(ATSCKptriscons(arg1)) { tmplab_js = 4; break; }
        case 2: // __atstmplab54
        // ATSINSmove_void
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab55
        case 4: // __atstmplab56
        tmp152 = arg1[0];
        tmp153 = arg1[1];
        env0[0](env0, arg0, tmp152);
        tmp155 = ats2jspre_add_int1_int1(arg0, 1);
        // ATStailcalseq_beg
        apy0 = tmp155;
        apy1 = tmp153;
        arg0 = apy0;
        arg1 = apy1;
        funlab_js = 1; // __patsflab__ats2jspre_list_aux_48
        // ATStailcalseq_end
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
    if (funlab_js > 0) continue; else return/*_void*/;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_list_iforeach_method(arg0)
{
//
// knd = 0
  var tmpret156
  var tmplab, tmplab_js
//
  // __patsflab_list_iforeach_method
  tmpret156 = _ats2jspre_list_patsfun_50__closurerize(arg0);
  return tmpret156;
} // end-of-function


function
_ats2jspre_list_patsfun_50(env0, arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_list_patsfun_50
  ats2jspre_list_iforeach(env0, arg0);
  return/*_void*/;
} // end-of-function


function
ats2jspre_list_rforeach(arg0, arg1)
{
//
// knd = 0
  var tmp159
  var tmp160
  var tmplab, tmplab_js
//
  // __patsflab_list_rforeach
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab57
      if(ATSCKptriscons(arg0)) { tmplab_js = 4; break; }
      case 2: // __atstmplab58
      // ATSINSmove_void
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab59
      case 4: // __atstmplab60
      tmp159 = arg0[0];
      tmp160 = arg0[1];
      ats2jspre_list_rforeach(tmp160, arg1);
      arg1[0](arg1, tmp159);
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return/*_void*/;
} // end-of-function


function
ats2jspre_list_rforeach_method(arg0)
{
//
// knd = 0
  var tmpret162
  var tmplab, tmplab_js
//
  // __patsflab_list_rforeach_method
  tmpret162 = _ats2jspre_list_patsfun_53__closurerize(arg0);
  return tmpret162;
} // end-of-function


function
_ats2jspre_list_patsfun_53(env0, arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_list_patsfun_53
  ats2jspre_list_rforeach(env0, arg0);
  return/*_void*/;
} // end-of-function


function
ats2jspre_list_filter(arg0, arg1)
{
//
// knd = 0
  var tmpret164
  var tmplab, tmplab_js
//
  // __patsflab_list_filter
  tmpret164 = _ats2jspre_list_aux_55(arg1, arg0);
  return tmpret164;
} // end-of-function


function
_ats2jspre_list_aux_55(env0, arg0)
{
//
// knd = 1
  var apy0
  var tmpret165
  var tmp166
  var tmp167
  var tmp168
  var tmp169
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_list_aux_55
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab61
        if(ATSCKptriscons(arg0)) { tmplab_js = 4; break; }
        case 2: // __atstmplab62
        tmpret165 = null;
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab63
        case 4: // __atstmplab64
        tmp166 = arg0[0];
        tmp167 = arg0[1];
        tmp168 = env0[0](env0, tmp166);
        if(tmp168) {
          tmp169 = _ats2jspre_list_aux_55(env0, tmp167);
          tmpret165 = [tmp166, tmp169];
        } else {
          // ATStailcalseq_beg
          apy0 = tmp167;
          arg0 = apy0;
          funlab_js = 1; // __patsflab__ats2jspre_list_aux_55
          // ATStailcalseq_end
        } // endif
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
    if (funlab_js > 0) continue; else return tmpret165;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_list_filter_method(arg0)
{
//
// knd = 0
  var tmpret170
  var tmplab, tmplab_js
//
  // __patsflab_list_filter_method
  tmpret170 = _ats2jspre_list_patsfun_57__closurerize(arg0);
  return tmpret170;
} // end-of-function


function
_ats2jspre_list_patsfun_57(env0, arg0)
{
//
// knd = 0
  var tmpret171
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_list_patsfun_57
  tmpret171 = ats2jspre_list_filter(env0, arg0);
  return tmpret171;
} // end-of-function


function
ats2jspre_list_map(arg0, arg1)
{
//
// knd = 0
  var tmpret172
  var tmplab, tmplab_js
//
  // __patsflab_list_map
  tmpret172 = _ats2jspre_list_aux_59(arg1, arg0);
  return tmpret172;
} // end-of-function


function
_ats2jspre_list_aux_59(env0, arg0)
{
//
// knd = 0
  var tmpret173
  var tmp174
  var tmp175
  var tmp176
  var tmp177
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_list_aux_59
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab65
      if(ATSCKptriscons(arg0)) { tmplab_js = 4; break; }
      case 2: // __atstmplab66
      tmpret173 = null;
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab67
      case 4: // __atstmplab68
      tmp174 = arg0[0];
      tmp175 = arg0[1];
      tmp176 = env0[0](env0, tmp174);
      tmp177 = _ats2jspre_list_aux_59(env0, tmp175);
      tmpret173 = [tmp176, tmp177];
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret173;
} // end-of-function


function
ats2jspre_list_map_method(arg0, arg1)
{
//
// knd = 0
  var tmpret178
  var tmplab, tmplab_js
//
  // __patsflab_list_map_method
  tmpret178 = _ats2jspre_list_patsfun_61__closurerize(arg0);
  return tmpret178;
} // end-of-function


function
_ats2jspre_list_patsfun_61(env0, arg0)
{
//
// knd = 0
  var tmpret179
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_list_patsfun_61
  tmpret179 = ats2jspre_list_map(env0, arg0);
  return tmpret179;
} // end-of-function


function
ats2jspre_list_foldleft(arg0, arg1, arg2)
{
//
// knd = 0
  var tmpret180
  var tmplab, tmplab_js
//
  // __patsflab_list_foldleft
  tmpret180 = _ats2jspre_list_loop_63(arg2, arg1, arg0);
  return tmpret180;
} // end-of-function


function
_ats2jspre_list_loop_63(env0, arg0, arg1)
{
//
// knd = 1
  var apy0
  var apy1
  var tmpret181
  var tmp182
  var tmp183
  var tmp184
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_list_loop_63
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab69
        if(ATSCKptriscons(arg1)) { tmplab_js = 4; break; }
        case 2: // __atstmplab70
        tmpret181 = arg0;
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab71
        case 4: // __atstmplab72
        tmp182 = arg1[0];
        tmp183 = arg1[1];
        tmp184 = env0[0](env0, arg0, tmp182);
        // ATStailcalseq_beg
        apy0 = tmp184;
        apy1 = tmp183;
        arg0 = apy0;
        arg1 = apy1;
        funlab_js = 1; // __patsflab__ats2jspre_list_loop_63
        // ATStailcalseq_end
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
    if (funlab_js > 0) continue; else return tmpret181;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_list_foldleft_method(arg0, arg1)
{
//
// knd = 0
  var tmpret185
  var tmplab, tmplab_js
//
  // __patsflab_list_foldleft_method
  tmpret185 = _ats2jspre_list_patsfun_65__closurerize(arg0, arg1);
  return tmpret185;
} // end-of-function


function
_ats2jspre_list_patsfun_65(env0, env1, arg0)
{
//
// knd = 0
  var tmpret186
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_list_patsfun_65
  tmpret186 = ats2jspre_list_foldleft(env0, env1, arg0);
  return tmpret186;
} // end-of-function


function
ats2jspre_list_ifoldleft(arg0, arg1, arg2)
{
//
// knd = 0
  var tmpret187
  var tmplab, tmplab_js
//
  // __patsflab_list_ifoldleft
  tmpret187 = _ats2jspre_list_loop_67(arg2, 0, arg1, arg0);
  return tmpret187;
} // end-of-function


function
_ats2jspre_list_loop_67(env0, arg0, arg1, arg2)
{
//
// knd = 1
  var apy0
  var apy1
  var apy2
  var tmpret188
  var tmp189
  var tmp190
  var tmp191
  var tmp192
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_list_loop_67
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab73
        if(ATSCKptriscons(arg2)) { tmplab_js = 4; break; }
        case 2: // __atstmplab74
        tmpret188 = arg1;
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab75
        case 4: // __atstmplab76
        tmp189 = arg2[0];
        tmp190 = arg2[1];
        tmp191 = ats2jspre_add_int1_int1(arg0, 1);
        tmp192 = env0[0](env0, arg0, arg1, tmp189);
        // ATStailcalseq_beg
        apy0 = tmp191;
        apy1 = tmp192;
        apy2 = tmp190;
        arg0 = apy0;
        arg1 = apy1;
        arg2 = apy2;
        funlab_js = 1; // __patsflab__ats2jspre_list_loop_67
        // ATStailcalseq_end
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
    if (funlab_js > 0) continue; else return tmpret188;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_list_ifoldleft_method(arg0, arg1)
{
//
// knd = 0
  var tmpret193
  var tmplab, tmplab_js
//
  // __patsflab_list_ifoldleft_method
  tmpret193 = _ats2jspre_list_patsfun_69__closurerize(arg0, arg1);
  return tmpret193;
} // end-of-function


function
_ats2jspre_list_patsfun_69(env0, env1, arg0)
{
//
// knd = 0
  var tmpret194
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_list_patsfun_69
  tmpret194 = ats2jspre_list_ifoldleft(env0, env1, arg0);
  return tmpret194;
} // end-of-function


function
ats2jspre_list_foldright(arg0, arg1, arg2)
{
//
// knd = 0
  var tmpret195
  var tmplab, tmplab_js
//
  // __patsflab_list_foldright
  tmpret195 = _ats2jspre_list_aux_71(arg1, arg0, arg2);
  return tmpret195;
} // end-of-function


function
_ats2jspre_list_aux_71(env0, arg0, arg1)
{
//
// knd = 0
  var tmpret196
  var tmp197
  var tmp198
  var tmp199
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_list_aux_71
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab77
      if(ATSCKptriscons(arg0)) { tmplab_js = 4; break; }
      case 2: // __atstmplab78
      tmpret196 = arg1;
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab79
      case 4: // __atstmplab80
      tmp197 = arg0[0];
      tmp198 = arg0[1];
      tmp199 = _ats2jspre_list_aux_71(env0, tmp198, arg1);
      tmpret196 = env0[0](env0, tmp197, tmp199);
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret196;
} // end-of-function


function
ats2jspre_list_foldright_method(arg0, arg1)
{
//
// knd = 0
  var tmpret200
  var tmplab, tmplab_js
//
  // __patsflab_list_foldright_method
  tmpret200 = _ats2jspre_list_patsfun_73__closurerize(arg0, arg1);
  return tmpret200;
} // end-of-function


function
_ats2jspre_list_patsfun_73(env0, env1, arg0)
{
//
// knd = 0
  var tmpret201
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_list_patsfun_73
  tmpret201 = ats2jspre_list_foldright(env0, arg0, env1);
  return tmpret201;
} // end-of-function


function
ats2jspre_list_ifoldright(arg0, arg1, arg2)
{
//
// knd = 0
  var tmpret202
  var tmplab, tmplab_js
//
  // __patsflab_list_ifoldright
  tmpret202 = _ats2jspre_list_aux_75(arg1, 0, arg0, arg2);
  return tmpret202;
} // end-of-function


function
_ats2jspre_list_aux_75(env0, arg0, arg1, arg2)
{
//
// knd = 0
  var tmpret203
  var tmp204
  var tmp205
  var tmp206
  var tmp207
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_list_aux_75
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab81
      if(ATSCKptriscons(arg1)) { tmplab_js = 4; break; }
      case 2: // __atstmplab82
      tmpret203 = arg2;
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab83
      case 4: // __atstmplab84
      tmp204 = arg1[0];
      tmp205 = arg1[1];
      tmp207 = ats2jspre_add_int1_int1(arg0, 1);
      tmp206 = _ats2jspre_list_aux_75(env0, tmp207, tmp205, arg2);
      tmpret203 = env0[0](env0, arg0, tmp204, tmp206);
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret203;
} // end-of-function


function
ats2jspre_list_ifoldright_method(arg0, arg1)
{
//
// knd = 0
  var tmpret208
  var tmplab, tmplab_js
//
  // __patsflab_list_ifoldright_method
  tmpret208 = _ats2jspre_list_patsfun_77__closurerize(arg0, arg1);
  return tmpret208;
} // end-of-function


function
_ats2jspre_list_patsfun_77(env0, env1, arg0)
{
//
// knd = 0
  var tmpret209
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_list_patsfun_77
  tmpret209 = ats2jspre_list_ifoldright(env0, arg0, env1);
  return tmpret209;
} // end-of-function


function
ats2jspre_streamize_list_elt(arg0)
{
//
// knd = 0
  var tmpret212
  var tmplab, tmplab_js
//
  // __patsflab_streamize_list_elt
  tmpret212 = _ats2jspre_list_auxmain_81(arg0);
  return tmpret212;
} // end-of-function


function
_ats2jspre_list_auxmain_81(arg0)
{
//
// knd = 0
  var tmpret213
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_list_auxmain_81
  tmpret213 = ATSPMVllazyval(_ats2jspre_list_patsfun_82__closurerize(arg0));
  return tmpret213;
} // end-of-function


function
_ats2jspre_list_patsfun_82(env0, arg0)
{
//
// knd = 0
  var tmpret214
  var tmp215
  var tmp216
  var tmp217
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_list_patsfun_82
  if(arg0) {
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab85
        if(ATSCKptriscons(env0)) { tmplab_js = 4; break; }
        case 2: // __atstmplab86
        tmpret214 = null;
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab87
        case 4: // __atstmplab88
        tmp215 = env0[0];
        tmp216 = env0[1];
        tmp217 = _ats2jspre_list_auxmain_81(tmp216);
        tmpret214 = [tmp215, tmp217];
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
  } else {
  } // endif
  return tmpret214;
} // end-of-function


function
ats2jspre_streamize_list_zip(arg0, arg1)
{
//
// knd = 0
  var tmpret218
  var tmplab, tmplab_js
//
  // __patsflab_streamize_list_zip
  tmpret218 = _ats2jspre_list_auxmain_84(arg0, arg1);
  return tmpret218;
} // end-of-function


function
_ats2jspre_list_auxmain_84(arg0, arg1)
{
//
// knd = 0
  var tmpret219
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_list_auxmain_84
  tmpret219 = ATSPMVllazyval(_ats2jspre_list_patsfun_85__closurerize(arg0, arg1));
  return tmpret219;
} // end-of-function


function
_ats2jspre_list_patsfun_85(env0, env1, arg0)
{
//
// knd = 0
  var tmpret220
  var tmp221
  var tmp222
  var tmp223
  var tmp224
  var tmp225
  var tmp226
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_list_patsfun_85
  if(arg0) {
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab89
        if(ATSCKptriscons(env0)) { tmplab_js = 4; break; }
        case 2: // __atstmplab90
        tmpret220 = null;
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab91
        case 4: // __atstmplab92
        tmp221 = env0[0];
        tmp222 = env0[1];
        // ATScaseofseq_beg
        tmplab_js = 1;
        while(true) {
          tmplab = tmplab_js; tmplab_js = 0;
          switch(tmplab) {
            // ATSbranchseq_beg
            case 1: // __atstmplab93
            if(ATSCKptriscons(env1)) { tmplab_js = 4; break; }
            case 2: // __atstmplab94
            tmpret220 = null;
            break;
            // ATSbranchseq_end
            // ATSbranchseq_beg
            case 3: // __atstmplab95
            case 4: // __atstmplab96
            tmp223 = env1[0];
            tmp224 = env1[1];
            tmp225 = [tmp221, tmp223];
            tmp226 = _ats2jspre_list_auxmain_84(tmp222, tmp224);
            tmpret220 = [tmp225, tmp226];
            break;
            // ATSbranchseq_end
          } // end-of-switch
          if (tmplab_js === 0) break;
        } // endwhile
        // ATScaseofseq_end
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
  } else {
  } // endif
  return tmpret220;
} // end-of-function


function
ats2jspre_streamize_list_cross(arg0, arg1)
{
//
// knd = 0
  var tmpret227
  var tmplab, tmplab_js
//
  // __patsflab_streamize_list_cross
  tmpret227 = _ats2jspre_list_auxmain_89(arg0, arg1);
  return tmpret227;
} // end-of-function


function
_ats2jspre_list_auxone_87(arg0, arg1)
{
//
// knd = 0
  var tmpret228
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_list_auxone_87
  tmpret228 = ATSPMVllazyval(_ats2jspre_list_patsfun_88__closurerize(arg0, arg1));
  return tmpret228;
} // end-of-function


function
_ats2jspre_list_patsfun_88(env0, env1, arg0)
{
//
// knd = 0
  var tmpret229
  var tmp230
  var tmp231
  var tmp232
  var tmp233
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_list_patsfun_88
  if(arg0) {
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab97
        if(ATSCKptriscons(env1)) { tmplab_js = 4; break; }
        case 2: // __atstmplab98
        tmpret229 = null;
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab99
        case 4: // __atstmplab100
        tmp230 = env1[0];
        tmp231 = env1[1];
        tmp232 = [env0, tmp230];
        tmp233 = _ats2jspre_list_auxone_87(env0, tmp231);
        tmpret229 = [tmp232, tmp233];
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
  } else {
  } // endif
  return tmpret229;
} // end-of-function


function
_ats2jspre_list_auxmain_89(arg0, arg1)
{
//
// knd = 0
  var tmpret234
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_list_auxmain_89
  tmpret234 = ATSPMVllazyval(_ats2jspre_list_patsfun_90__closurerize(arg0, arg1));
  return tmpret234;
} // end-of-function


function
_ats2jspre_list_patsfun_90(env0, env1, arg0)
{
//
// knd = 0
  var tmpret235
  var tmp236
  var tmp237
  var tmp238
  var tmp239
  var tmp240
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_list_patsfun_90
  if(arg0) {
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab101
        if(ATSCKptriscons(env0)) { tmplab_js = 4; break; }
        case 2: // __atstmplab102
        tmpret235 = null;
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab103
        case 4: // __atstmplab104
        tmp236 = env0[0];
        tmp237 = env0[1];
        tmp239 = _ats2jspre_list_auxone_87(tmp236, env1);
        tmp240 = _ats2jspre_list_auxmain_89(tmp237, env1);
        tmp238 = ats2jspre_stream_vt_append(tmp239, tmp240);
        tmpret235 = ATSPMVllazyval_eval(tmp238);
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
  } else {
  } // endif
  return tmpret235;
} // end-of-function


function
ats2jspre_list_sort_2(arg0, arg1)
{
//
// knd = 0
  var tmpret248
  var tmp249
  var tmp251
  var tmp257
  var tmp258
  var tmplab, tmplab_js
//
  // __patsflab_list_sort_2
  tmp249 = ats2jspre_JSarray_make_list(arg0);
  ats2jspre_JSarray_sort_2(tmp249, arg1);
  tmp251 = ats2jspre_JSarray_length(tmp249);
  tmp258 = null;
  tmp257 = _ats2jspre_list_loop_99(tmp249, tmp251, 0, tmp258);
  tmpret248 = tmp257;
  return tmpret248;
} // end-of-function


function
_ats2jspre_list_loop_99(env0, env1, arg0, arg1)
{
//
// knd = 1
  var apy0
  var apy1
  var tmpret252
  var tmp253
  var tmp254
  var tmp255
  var tmp256
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_list_loop_99
    tmp253 = ats2jspre_lt_int0_int0(arg0, env1);
    if(tmp253) {
      tmp254 = ats2jspre_add_int0_int0(arg0, 1);
      tmp256 = ats2jspre_JSarray_pop(env0);
      tmp255 = [tmp256, arg1];
      // ATStailcalseq_beg
      apy0 = tmp254;
      apy1 = tmp255;
      arg0 = apy0;
      arg1 = apy1;
      funlab_js = 1; // __patsflab__ats2jspre_list_loop_99
      // ATStailcalseq_end
    } else {
      tmpret252 = arg1;
    } // endif
    if (funlab_js > 0) continue; else return tmpret252;
  } // endwhile-fun
} // end-of-function


/* ****** ****** */

/* end-of-compilation-unit */
/*
**
** The JavaScript code is generated by atscc2js
** The starting compilation time is: 2016-12-25: 17h:42m
**
*/

function
ats2jspre_list_vt_length(arg0)
{
//
// knd = 0
  var tmpret2
  var tmplab, tmplab_js
//
  // __patsflab_list_vt_length
  tmpret2 = _ats2jspre_list_loop_3(arg0, 0);
  return tmpret2;
} // end-of-function


function
_ats2jspre_list_loop_3(arg0, arg1)
{
//
// knd = 1
  var apy0
  var apy1
  var tmpret3
  var tmp5
  var tmp6
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_list_loop_3
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab8
        if(ATSCKptriscons(arg0)) { tmplab_js = 4; break; }
        case 2: // __atstmplab9
        tmpret3 = arg1;
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab10
        case 4: // __atstmplab11
        tmp5 = arg0[1];
        tmp6 = ats2jspre_add_int1_int1(arg1, 1);
        // ATStailcalseq_beg
        apy0 = tmp5;
        apy1 = tmp6;
        arg0 = apy0;
        arg1 = apy1;
        funlab_js = 1; // __patsflab__ats2jspre_list_loop_3
        // ATStailcalseq_end
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
    if (funlab_js > 0) continue; else return tmpret3;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_list_vt_snoc(arg0, arg1)
{
//
// knd = 0
  var tmpret7
  var tmp8
  var tmp9
  var tmplab, tmplab_js
//
  // __patsflab_list_vt_snoc
  tmp9 = null;
  tmp8 = [arg1, tmp9];
  tmpret7 = ats2jspre_list_vt_append(arg0, tmp8);
  return tmpret7;
} // end-of-function


function
ats2jspre_list_vt_extend(arg0, arg1)
{
//
// knd = 0
  var tmpret10
  var tmp11
  var tmp12
  var tmplab, tmplab_js
//
  // __patsflab_list_vt_extend
  tmp12 = null;
  tmp11 = [arg1, tmp12];
  tmpret10 = ats2jspre_list_vt_append(arg0, tmp11);
  return tmpret10;
} // end-of-function


function
ats2jspre_list_vt_append(arg0, arg1)
{
//
// knd = 0
  var tmpret13
  var tmplab, tmplab_js
//
  // __patsflab_list_vt_append
  tmpret13 = _ats2jspre_list_aux_7(arg0, arg1);
  return tmpret13;
} // end-of-function


function
_ats2jspre_list_aux_7(arg0, arg1)
{
//
// knd = 0
  var tmpret14
  var tmp15
  var tmp16
  var tmp17
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_list_aux_7
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab12
      if(ATSCKptriscons(arg0)) { tmplab_js = 4; break; }
      case 2: // __atstmplab13
      tmpret14 = arg1;
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab14
      case 4: // __atstmplab15
      tmp15 = arg0[0];
      tmp16 = arg0[1];
      // ATSINSfreecon(arg0);
      tmp17 = _ats2jspre_list_aux_7(tmp16, arg1);
      tmpret14 = [tmp15, tmp17];
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret14;
} // end-of-function


function
ats2jspre_list_vt_reverse(arg0)
{
//
// knd = 0
  var tmpret18
  var tmp19
  var tmplab, tmplab_js
//
  // __patsflab_list_vt_reverse
  tmp19 = null;
  tmpret18 = ats2jspre_list_vt_reverse_append(arg0, tmp19);
  return tmpret18;
} // end-of-function


function
ats2jspre_list_vt_reverse_append(arg0, arg1)
{
//
// knd = 0
  var tmpret20
  var tmplab, tmplab_js
//
  // __patsflab_list_vt_reverse_append
  tmpret20 = _ats2jspre_list_loop_10(arg0, arg1);
  return tmpret20;
} // end-of-function


function
_ats2jspre_list_loop_10(arg0, arg1)
{
//
// knd = 1
  var apy0
  var apy1
  var tmpret21
  var tmp22
  var tmp23
  var tmp24
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_list_loop_10
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab16
        if(ATSCKptriscons(arg0)) { tmplab_js = 4; break; }
        case 2: // __atstmplab17
        tmpret21 = arg1;
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab18
        case 4: // __atstmplab19
        tmp22 = arg0[0];
        tmp23 = arg0[1];
        // ATSINSfreecon(arg0);
        tmp24 = [tmp22, arg1];
        // ATStailcalseq_beg
        apy0 = tmp23;
        apy1 = tmp24;
        arg0 = apy0;
        arg1 = apy1;
        funlab_js = 1; // __patsflab__ats2jspre_list_loop_10
        // ATStailcalseq_end
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
    if (funlab_js > 0) continue; else return tmpret21;
  } // endwhile-fun
} // end-of-function


/* ****** ****** */

/* end-of-compilation-unit */
/*
**
** The JavaScript code is generated by atscc2js
** The starting compilation time is: 2016-12-25: 17h:42m
**
*/

function
ats2jspre_option_some(arg0)
{
//
// knd = 0
  var tmpret0
  var tmplab, tmplab_js
//
  // __patsflab_option_some
  tmpret0 = [arg0];
  return tmpret0;
} // end-of-function


function
ats2jspre_option_none()
{
//
// knd = 0
  var tmpret1
  var tmplab, tmplab_js
//
  // __patsflab_option_none
  tmpret1 = null;
  return tmpret1;
} // end-of-function


function
ats2jspre_option_unsome(arg0)
{
//
// knd = 0
  var tmpret2
  var tmp3
  var tmplab, tmplab_js
//
  // __patsflab_option_unsome
  tmp3 = arg0[0];
  tmpret2 = tmp3;
  return tmpret2;
} // end-of-function


function
ats2jspre_option_is_some(arg0)
{
//
// knd = 0
  var tmpret4
  var tmplab, tmplab_js
//
  // __patsflab_option_is_some
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab0
      if(ATSCKptrisnull(arg0)) { tmplab_js = 4; break; }
      case 2: // __atstmplab1
      tmpret4 = true;
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab2
      case 4: // __atstmplab3
      tmpret4 = false;
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret4;
} // end-of-function


function
ats2jspre_option_is_none(arg0)
{
//
// knd = 0
  var tmpret5
  var tmplab, tmplab_js
//
  // __patsflab_option_is_none
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab4
      if(ATSCKptriscons(arg0)) { tmplab_js = 4; break; }
      case 2: // __atstmplab5
      tmpret5 = true;
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab6
      case 4: // __atstmplab7
      tmpret5 = false;
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret5;
} // end-of-function


/* ****** ****** */

/* end-of-compilation-unit */
/*
**
** The JavaScript code is generated by atscc2js
** The starting compilation time is: 2016-12-25: 17h:42m
**
*/

function
_ats2jspre_stream_patsfun_6__closurerize(env0)
{
  return [function(cenv) { return _ats2jspre_stream_patsfun_6(cenv[1]); }, env0];
}


function
_ats2jspre_stream_patsfun_17__closurerize(env0, env1)
{
  return [function(cenv, arg0) { return _ats2jspre_stream_patsfun_17(cenv[1], cenv[2], arg0); }, env0, env1];
}


function
_ats2jspre_stream_patsfun_23__closurerize(env0, env1)
{
  return [function(cenv) { return _ats2jspre_stream_patsfun_23(cenv[1], cenv[2]); }, env0, env1];
}


function
_ats2jspre_stream_patsfun_25__closurerize(env0)
{
  return [function(cenv) { return _ats2jspre_stream_patsfun_25(cenv[1]); }, env0];
}


function
_ats2jspre_stream_patsfun_27__closurerize(env0, env1)
{
  return [function(cenv) { return _ats2jspre_stream_patsfun_27(cenv[1], cenv[2]); }, env0, env1];
}


function
_ats2jspre_stream_patsfun_29__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_stream_patsfun_29(cenv[1], arg0); }, env0];
}


function
_ats2jspre_stream_patsfun_31__closurerize(env0, env1)
{
  return [function(cenv) { return _ats2jspre_stream_patsfun_31(cenv[1], cenv[2]); }, env0, env1];
}


function
_ats2jspre_stream_patsfun_33__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_stream_patsfun_33(cenv[1], arg0); }, env0];
}


function
_ats2jspre_stream_patsfun_36__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_stream_patsfun_36(cenv[1], arg0); }, env0];
}


function
_ats2jspre_stream_patsfun_39__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_stream_patsfun_39(cenv[1], arg0); }, env0];
}


function
_ats2jspre_stream_patsfun_42__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_stream_patsfun_42(cenv[1], arg0); }, env0];
}


function
_ats2jspre_stream_patsfun_46__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_stream_patsfun_46(cenv[1], arg0); }, env0];
}


function
_ats2jspre_stream_patsfun_49__closurerize(env0, env1)
{
  return [function(cenv) { return _ats2jspre_stream_patsfun_49(cenv[1], cenv[2]); }, env0, env1];
}


function
_ats2jspre_stream_patsfun_52__closurerize(env0, env1, env2, env3)
{
  return [function(cenv) { return _ats2jspre_stream_patsfun_52(cenv[1], cenv[2], cenv[3], cenv[4]); }, env0, env1, env2, env3];
}


function
_ats2jspre_stream_patsfun_53__closurerize(env0, env1)
{
  return [function(cenv) { return _ats2jspre_stream_patsfun_53(cenv[1], cenv[2]); }, env0, env1];
}


function
_ats2jspre_stream_patsfun_56__closurerize(env0)
{
  return [function(cenv) { return _ats2jspre_stream_patsfun_56(cenv[1]); }, env0];
}


function
_ats2jspre_stream_patsfun_58__closurerize(env0)
{
  return [function(cenv) { return _ats2jspre_stream_patsfun_58(cenv[1]); }, env0];
}


function
_ats2jspre_stream_patsfun_60__closurerize(env0, env1)
{
  return [function(cenv) { return _ats2jspre_stream_patsfun_60(cenv[1], cenv[2]); }, env0, env1];
}


function
_ats2jspre_stream_patsfun_65__closurerize(env0)
{
  return [function(cenv, arg0, arg1) { return _ats2jspre_stream_patsfun_65(cenv[1], arg0, arg1); }, env0];
}


function
_ats2jspre_stream_patsfun_67__closurerize(env0)
{
  return [function(cenv, arg0, arg1) { return _ats2jspre_stream_patsfun_67(cenv[1], arg0, arg1); }, env0];
}


function
_ats2jspre_stream_patsfun_70__closurerize(env0, env1)
{
  return [function(cenv) { return _ats2jspre_stream_patsfun_70(cenv[1], cenv[2]); }, env0, env1];
}


function
_ats2jspre_stream_patsfun_72__closurerize(env0, env1)
{
  return [function(cenv) { return _ats2jspre_stream_patsfun_72(cenv[1], cenv[2]); }, env0, env1];
}


function
ats2jspre_stream_make_list(arg0)
{
//
// knd = 0
  var tmpret7
  var tmplab, tmplab_js
//
  // __patsflab_stream_make_list
  tmpret7 = ATSPMVlazyval(_ats2jspre_stream_patsfun_6__closurerize(arg0));
  return tmpret7;
} // end-of-function


function
_ats2jspre_stream_patsfun_6(env0)
{
//
// knd = 0
  var tmpret8
  var tmp9
  var tmp10
  var tmp11
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_patsfun_6
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab0
      if(ATSCKptriscons(env0)) { tmplab_js = 4; break; }
      case 2: // __atstmplab1
      tmpret8 = null;
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab2
      case 4: // __atstmplab3
      tmp9 = env0[0];
      tmp10 = env0[1];
      tmp11 = ats2jspre_stream_make_list(tmp10);
      tmpret8 = [tmp9, tmp11];
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret8;
} // end-of-function


function
ats2jspre_stream_make_list0(arg0)
{
//
// knd = 0
  var tmpret12
  var tmplab, tmplab_js
//
  // __patsflab_stream_make_list0
  tmpret12 = ats2jspre_stream_make_list(arg0);
  return tmpret12;
} // end-of-function


function
ats2jspre_stream_nth_opt(arg0, arg1)
{
//
// knd = 0
  var tmpret13
  var tmplab, tmplab_js
//
  // __patsflab_stream_nth_opt
  tmpret13 = _ats2jspre_stream_loop_9(arg0, arg1);
  return tmpret13;
} // end-of-function


function
_ats2jspre_stream_loop_9(arg0, arg1)
{
//
// knd = 1
  var apy0
  var apy1
  var tmpret14
  var tmp15
  var tmp16
  var tmp17
  var tmp18
  var tmp19
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_stream_loop_9
    tmp15 = ATSPMVlazyval_eval(arg0); 
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab4
        if(ATSCKptriscons(tmp15)) { tmplab_js = 4; break; }
        case 2: // __atstmplab5
        tmpret14 = null;
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab6
        case 4: // __atstmplab7
        tmp16 = tmp15[0];
        tmp17 = tmp15[1];
        tmp18 = ats2jspre_gt_int1_int1(arg1, 0);
        if(tmp18) {
          tmp19 = ats2jspre_pred_int1(arg1);
          // ATStailcalseq_beg
          apy0 = tmp17;
          apy1 = tmp19;
          arg0 = apy0;
          arg1 = apy1;
          funlab_js = 1; // __patsflab__ats2jspre_stream_loop_9
          // ATStailcalseq_end
        } else {
          tmpret14 = [tmp16];
        } // endif
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
    if (funlab_js > 0) continue; else return tmpret14;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_stream_length(arg0)
{
//
// knd = 0
  var tmpret20
  var tmplab, tmplab_js
//
  // __patsflab_stream_length
  tmpret20 = _ats2jspre_stream_loop_11(arg0, 0);
  return tmpret20;
} // end-of-function


function
_ats2jspre_stream_loop_11(arg0, arg1)
{
//
// knd = 1
  var apy0
  var apy1
  var tmpret21
  var tmp22
  var tmp24
  var tmp25
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_stream_loop_11
    tmp22 = ATSPMVlazyval_eval(arg0); 
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab8
        if(ATSCKptriscons(tmp22)) { tmplab_js = 4; break; }
        case 2: // __atstmplab9
        tmpret21 = arg1;
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab10
        case 4: // __atstmplab11
        tmp24 = tmp22[1];
        tmp25 = ats2jspre_add_int1_int1(arg1, 1);
        // ATStailcalseq_beg
        apy0 = tmp24;
        apy1 = tmp25;
        arg0 = apy0;
        arg1 = apy1;
        funlab_js = 1; // __patsflab__ats2jspre_stream_loop_11
        // ATStailcalseq_end
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
    if (funlab_js > 0) continue; else return tmpret21;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_stream2list(arg0)
{
//
// knd = 0
  var tmpret26
  var tmplab, tmplab_js
//
  // __patsflab_stream2list
  tmpret26 = _ats2jspre_stream_aux_13(arg0);
  return tmpret26;
} // end-of-function


function
_ats2jspre_stream_aux_13(arg0)
{
//
// knd = 0
  var tmpret27
  var tmp28
  var tmp29
  var tmp30
  var tmp31
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_aux_13
  tmp28 = ATSPMVlazyval_eval(arg0); 
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab12
      if(ATSCKptriscons(tmp28)) { tmplab_js = 4; break; }
      case 2: // __atstmplab13
      tmpret27 = null;
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab14
      case 4: // __atstmplab15
      tmp29 = tmp28[0];
      tmp30 = tmp28[1];
      tmp31 = _ats2jspre_stream_aux_13(tmp30);
      tmpret27 = [tmp29, tmp31];
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret27;
} // end-of-function


function
ats2jspre_stream2list_rev(arg0)
{
//
// knd = 0
  var tmpret32
  var tmp38
  var tmplab, tmplab_js
//
  // __patsflab_stream2list_rev
  tmp38 = null;
  tmpret32 = _ats2jspre_stream_loop_15(arg0, tmp38);
  return tmpret32;
} // end-of-function


function
_ats2jspre_stream_loop_15(arg0, arg1)
{
//
// knd = 1
  var apy0
  var apy1
  var tmpret33
  var tmp34
  var tmp35
  var tmp36
  var tmp37
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_stream_loop_15
    tmp34 = ATSPMVlazyval_eval(arg0); 
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab16
        if(ATSCKptriscons(tmp34)) { tmplab_js = 4; break; }
        case 2: // __atstmplab17
        tmpret33 = arg1;
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab18
        case 4: // __atstmplab19
        tmp35 = tmp34[0];
        tmp36 = tmp34[1];
        tmp37 = [tmp35, arg1];
        // ATStailcalseq_beg
        apy0 = tmp36;
        apy1 = tmp37;
        arg0 = apy0;
        arg1 = apy1;
        funlab_js = 1; // __patsflab__ats2jspre_stream_loop_15
        // ATStailcalseq_end
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
    if (funlab_js > 0) continue; else return tmpret33;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_stream_takeLte(arg0, arg1)
{
//
// knd = 0
  var tmpret39
  var tmplab, tmplab_js
//
  // __patsflab_stream_takeLte
  tmpret39 = ATSPMVllazyval(_ats2jspre_stream_patsfun_17__closurerize(arg0, arg1));
  return tmpret39;
} // end-of-function


function
_ats2jspre_stream_patsfun_17(env0, env1, arg0)
{
//
// knd = 0
  var tmpret40
  var tmp41
  var tmp42
  var tmp43
  var tmp44
  var tmp45
  var tmp46
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_patsfun_17
  if(arg0) {
    tmp41 = ats2jspre_gt_int1_int1(env1, 0);
    if(tmp41) {
      tmp42 = ATSPMVlazyval_eval(env0); 
      // ATScaseofseq_beg
      tmplab_js = 1;
      while(true) {
        tmplab = tmplab_js; tmplab_js = 0;
        switch(tmplab) {
          // ATSbranchseq_beg
          case 1: // __atstmplab20
          if(ATSCKptriscons(tmp42)) { tmplab_js = 4; break; }
          case 2: // __atstmplab21
          tmpret40 = null;
          break;
          // ATSbranchseq_end
          // ATSbranchseq_beg
          case 3: // __atstmplab22
          case 4: // __atstmplab23
          tmp43 = tmp42[0];
          tmp44 = tmp42[1];
          tmp46 = ats2jspre_sub_int1_int1(env1, 1);
          tmp45 = ats2jspre_stream_takeLte(tmp44, tmp46);
          tmpret40 = [tmp43, tmp45];
          break;
          // ATSbranchseq_end
        } // end-of-switch
        if (tmplab_js === 0) break;
      } // endwhile
      // ATScaseofseq_end
    } else {
      tmpret40 = null;
    } // endif
  } else {
  } // endif
  return tmpret40;
} // end-of-function


function
ats2jspre_stream_take_opt(arg0, arg1)
{
//
// knd = 0
  var tmpret47
  var tmp56
  var tmplab, tmplab_js
//
  // __patsflab_stream_take_opt
  tmp56 = null;
  tmpret47 = _ats2jspre_stream_auxmain_19(arg1, arg0, 0, tmp56);
  return tmpret47;
} // end-of-function


function
_ats2jspre_stream_auxmain_19(env0, arg0, arg1, arg2)
{
//
// knd = 1
  var apy0
  var apy1
  var apy2
  var tmpret48
  var tmp49
  var tmp50
  var tmp51
  var tmp52
  var tmp53
  var tmp54
  var tmp55
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_stream_auxmain_19
    tmp49 = ats2jspre_lt_int1_int1(arg1, env0);
    if(tmp49) {
      tmp50 = ATSPMVlazyval_eval(arg0); 
      // ATScaseofseq_beg
      tmplab_js = 1;
      while(true) {
        tmplab = tmplab_js; tmplab_js = 0;
        switch(tmplab) {
          // ATSbranchseq_beg
          case 1: // __atstmplab24
          if(ATSCKptriscons(tmp50)) { tmplab_js = 4; break; }
          case 2: // __atstmplab25
          tmpret48 = null;
          break;
          // ATSbranchseq_end
          // ATSbranchseq_beg
          case 3: // __atstmplab26
          case 4: // __atstmplab27
          tmp51 = tmp50[0];
          tmp52 = tmp50[1];
          tmp53 = ats2jspre_add_int1_int1(arg1, 1);
          tmp54 = [tmp51, arg2];
          // ATStailcalseq_beg
          apy0 = tmp52;
          apy1 = tmp53;
          apy2 = tmp54;
          arg0 = apy0;
          arg1 = apy1;
          arg2 = apy2;
          funlab_js = 1; // __patsflab__ats2jspre_stream_auxmain_19
          // ATStailcalseq_end
          break;
          // ATSbranchseq_end
        } // end-of-switch
        if (tmplab_js === 0) break;
      } // endwhile
      // ATScaseofseq_end
    } else {
      tmp55 = ats2jspre_list_reverse(arg2);
      tmpret48 = [tmp55];
    } // endif
    if (funlab_js > 0) continue; else return tmpret48;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_stream_drop_opt(arg0, arg1)
{
//
// knd = 0
  var tmpret57
  var tmplab, tmplab_js
//
  // __patsflab_stream_drop_opt
  tmpret57 = _ats2jspre_stream_auxmain_21(arg1, arg0, 0);
  return tmpret57;
} // end-of-function


function
_ats2jspre_stream_auxmain_21(env0, arg0, arg1)
{
//
// knd = 1
  var apy0
  var apy1
  var tmpret58
  var tmp59
  var tmp60
  var tmp62
  var tmp63
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_stream_auxmain_21
    tmp59 = ats2jspre_lt_int1_int1(arg1, env0);
    if(tmp59) {
      tmp60 = ATSPMVlazyval_eval(arg0); 
      // ATScaseofseq_beg
      tmplab_js = 1;
      while(true) {
        tmplab = tmplab_js; tmplab_js = 0;
        switch(tmplab) {
          // ATSbranchseq_beg
          case 1: // __atstmplab28
          if(ATSCKptriscons(tmp60)) { tmplab_js = 4; break; }
          case 2: // __atstmplab29
          tmpret58 = null;
          break;
          // ATSbranchseq_end
          // ATSbranchseq_beg
          case 3: // __atstmplab30
          case 4: // __atstmplab31
          tmp62 = tmp60[1];
          tmp63 = ats2jspre_add_int1_int1(arg1, 1);
          // ATStailcalseq_beg
          apy0 = tmp62;
          apy1 = tmp63;
          arg0 = apy0;
          arg1 = apy1;
          funlab_js = 1; // __patsflab__ats2jspre_stream_auxmain_21
          // ATStailcalseq_end
          break;
          // ATSbranchseq_end
        } // end-of-switch
        if (tmplab_js === 0) break;
      } // endwhile
      // ATScaseofseq_end
    } else {
      tmpret58 = [arg0];
    } // endif
    if (funlab_js > 0) continue; else return tmpret58;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_stream_append(arg0, arg1)
{
//
// knd = 0
  var tmpret64
  var tmplab, tmplab_js
//
  // __patsflab_stream_append
  tmpret64 = ATSPMVlazyval(_ats2jspre_stream_patsfun_23__closurerize(arg0, arg1));
  return tmpret64;
} // end-of-function


function
_ats2jspre_stream_patsfun_23(env0, env1)
{
//
// knd = 0
  var tmpret65
  var tmp66
  var tmp67
  var tmp68
  var tmp69
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_patsfun_23
  tmp66 = ATSPMVlazyval_eval(env0); 
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab32
      if(ATSCKptriscons(tmp66)) { tmplab_js = 4; break; }
      case 2: // __atstmplab33
      tmpret65 = ATSPMVlazyval_eval(env1); 
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab34
      case 4: // __atstmplab35
      tmp67 = tmp66[0];
      tmp68 = tmp66[1];
      tmp69 = ats2jspre_stream_append(tmp68, env1);
      tmpret65 = [tmp67, tmp69];
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret65;
} // end-of-function


function
ats2jspre_stream_concat(arg0)
{
//
// knd = 0
  var tmpret70
  var tmplab, tmplab_js
//
  // __patsflab_stream_concat
  tmpret70 = ATSPMVlazyval(_ats2jspre_stream_patsfun_25__closurerize(arg0));
  return tmpret70;
} // end-of-function


function
_ats2jspre_stream_patsfun_25(env0)
{
//
// knd = 0
  var tmpret71
  var tmp72
  var tmp73
  var tmp74
  var tmp75
  var tmp76
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_patsfun_25
  tmp72 = ATSPMVlazyval_eval(env0); 
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab36
      if(ATSCKptriscons(tmp72)) { tmplab_js = 4; break; }
      case 2: // __atstmplab37
      tmpret71 = null;
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab38
      case 4: // __atstmplab39
      tmp73 = tmp72[0];
      tmp74 = tmp72[1];
      tmp76 = ats2jspre_stream_concat(tmp74);
      tmp75 = ats2jspre_stream_append(tmp73, tmp76);
      tmpret71 = ATSPMVlazyval_eval(tmp75); 
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret71;
} // end-of-function


function
ats2jspre_stream_map_cloref(arg0, arg1)
{
//
// knd = 0
  var tmpret77
  var tmplab, tmplab_js
//
  // __patsflab_stream_map_cloref
  tmpret77 = ATSPMVlazyval(_ats2jspre_stream_patsfun_27__closurerize(arg0, arg1));
  return tmpret77;
} // end-of-function


function
_ats2jspre_stream_patsfun_27(env0, env1)
{
//
// knd = 0
  var tmpret78
  var tmp79
  var tmp80
  var tmp81
  var tmp82
  var tmp83
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_patsfun_27
  tmp79 = ATSPMVlazyval_eval(env0); 
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab40
      if(ATSCKptriscons(tmp79)) { tmplab_js = 4; break; }
      case 2: // __atstmplab41
      tmpret78 = null;
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab42
      case 4: // __atstmplab43
      tmp80 = tmp79[0];
      tmp81 = tmp79[1];
      tmp82 = env1[0](env1, tmp80);
      tmp83 = ats2jspre_stream_map_cloref(tmp81, env1);
      tmpret78 = [tmp82, tmp83];
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret78;
} // end-of-function


function
ats2jspre_stream_map_method(arg0, arg1)
{
//
// knd = 0
  var tmpret84
  var tmplab, tmplab_js
//
  // __patsflab_stream_map_method
  tmpret84 = _ats2jspre_stream_patsfun_29__closurerize(arg0);
  return tmpret84;
} // end-of-function


function
_ats2jspre_stream_patsfun_29(env0, arg0)
{
//
// knd = 0
  var tmpret85
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_patsfun_29
  tmpret85 = ats2jspre_stream_map_cloref(env0, arg0);
  return tmpret85;
} // end-of-function


function
ats2jspre_stream_filter_cloref(arg0, arg1)
{
//
// knd = 0
  var tmpret86
  var tmplab, tmplab_js
//
  // __patsflab_stream_filter_cloref
  tmpret86 = ATSPMVlazyval(_ats2jspre_stream_patsfun_31__closurerize(arg0, arg1));
  return tmpret86;
} // end-of-function


function
_ats2jspre_stream_patsfun_31(env0, env1)
{
//
// knd = 0
  var tmpret87
  var tmp88
  var tmp89
  var tmp90
  var tmp91
  var tmp92
  var tmp93
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_patsfun_31
  tmp88 = ATSPMVlazyval_eval(env0); 
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab44
      if(ATSCKptriscons(tmp88)) { tmplab_js = 4; break; }
      case 2: // __atstmplab45
      tmpret87 = null;
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab46
      case 4: // __atstmplab47
      tmp89 = tmp88[0];
      tmp90 = tmp88[1];
      tmp91 = env1[0](env1, tmp89);
      if(tmp91) {
        tmp92 = ats2jspre_stream_filter_cloref(tmp90, env1);
        tmpret87 = [tmp89, tmp92];
      } else {
        tmp93 = ats2jspre_stream_filter_cloref(tmp90, env1);
        tmpret87 = ATSPMVlazyval_eval(tmp93); 
      } // endif
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret87;
} // end-of-function


function
ats2jspre_stream_filter_method(arg0)
{
//
// knd = 0
  var tmpret94
  var tmplab, tmplab_js
//
  // __patsflab_stream_filter_method
  tmpret94 = _ats2jspre_stream_patsfun_33__closurerize(arg0);
  return tmpret94;
} // end-of-function


function
_ats2jspre_stream_patsfun_33(env0, arg0)
{
//
// knd = 0
  var tmpret95
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_patsfun_33
  tmpret95 = ats2jspre_stream_filter_cloref(env0, arg0);
  return tmpret95;
} // end-of-function


function
ats2jspre_stream_forall_cloref(arg0, arg1)
{
//
// knd = 1
  var apy0
  var apy1
  var tmpret96
  var tmp97
  var tmp98
  var tmp99
  var tmp100
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab_stream_forall_cloref
    tmp97 = ATSPMVlazyval_eval(arg0); 
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab48
        if(ATSCKptriscons(tmp97)) { tmplab_js = 4; break; }
        case 2: // __atstmplab49
        tmpret96 = true;
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab50
        case 4: // __atstmplab51
        tmp98 = tmp97[0];
        tmp99 = tmp97[1];
        tmp100 = arg1[0](arg1, tmp98);
        if(tmp100) {
          // ATStailcalseq_beg
          apy0 = tmp99;
          apy1 = arg1;
          arg0 = apy0;
          arg1 = apy1;
          funlab_js = 1; // __patsflab_stream_forall_cloref
          // ATStailcalseq_end
        } else {
          tmpret96 = false;
        } // endif
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
    if (funlab_js > 0) continue; else return tmpret96;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_stream_forall_method(arg0)
{
//
// knd = 0
  var tmpret101
  var tmplab, tmplab_js
//
  // __patsflab_stream_forall_method
  tmpret101 = _ats2jspre_stream_patsfun_36__closurerize(arg0);
  return tmpret101;
} // end-of-function


function
_ats2jspre_stream_patsfun_36(env0, arg0)
{
//
// knd = 0
  var tmpret102
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_patsfun_36
  tmpret102 = ats2jspre_stream_forall_cloref(env0, arg0);
  return tmpret102;
} // end-of-function


function
ats2jspre_stream_exists_cloref(arg0, arg1)
{
//
// knd = 1
  var apy0
  var apy1
  var tmpret103
  var tmp104
  var tmp105
  var tmp106
  var tmp107
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab_stream_exists_cloref
    tmp104 = ATSPMVlazyval_eval(arg0); 
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab52
        if(ATSCKptriscons(tmp104)) { tmplab_js = 4; break; }
        case 2: // __atstmplab53
        tmpret103 = false;
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab54
        case 4: // __atstmplab55
        tmp105 = tmp104[0];
        tmp106 = tmp104[1];
        tmp107 = arg1[0](arg1, tmp105);
        if(tmp107) {
          tmpret103 = true;
        } else {
          // ATStailcalseq_beg
          apy0 = tmp106;
          apy1 = arg1;
          arg0 = apy0;
          arg1 = apy1;
          funlab_js = 1; // __patsflab_stream_exists_cloref
          // ATStailcalseq_end
        } // endif
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
    if (funlab_js > 0) continue; else return tmpret103;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_stream_exists_method(arg0)
{
//
// knd = 0
  var tmpret108
  var tmplab, tmplab_js
//
  // __patsflab_stream_exists_method
  tmpret108 = _ats2jspre_stream_patsfun_39__closurerize(arg0);
  return tmpret108;
} // end-of-function


function
_ats2jspre_stream_patsfun_39(env0, arg0)
{
//
// knd = 0
  var tmpret109
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_patsfun_39
  tmpret109 = ats2jspre_stream_exists_cloref(env0, arg0);
  return tmpret109;
} // end-of-function


function
ats2jspre_stream_foreach_cloref(arg0, arg1)
{
//
// knd = 1
  var apy0
  var apy1
  var tmp111
  var tmp112
  var tmp113
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab_stream_foreach_cloref
    tmp111 = ATSPMVlazyval_eval(arg0); 
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab56
        if(ATSCKptriscons(tmp111)) { tmplab_js = 4; break; }
        case 2: // __atstmplab57
        // ATSINSmove_void
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab58
        case 4: // __atstmplab59
        tmp112 = tmp111[0];
        tmp113 = tmp111[1];
        arg1[0](arg1, tmp112);
        // ATStailcalseq_beg
        apy0 = tmp113;
        apy1 = arg1;
        arg0 = apy0;
        arg1 = apy1;
        funlab_js = 1; // __patsflab_stream_foreach_cloref
        // ATStailcalseq_end
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
    if (funlab_js > 0) continue; else return/*_void*/;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_stream_foreach_method(arg0)
{
//
// knd = 0
  var tmpret115
  var tmplab, tmplab_js
//
  // __patsflab_stream_foreach_method
  tmpret115 = _ats2jspre_stream_patsfun_42__closurerize(arg0);
  return tmpret115;
} // end-of-function


function
_ats2jspre_stream_patsfun_42(env0, arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_patsfun_42
  ats2jspre_stream_foreach_cloref(env0, arg0);
  return/*_void*/;
} // end-of-function


function
ats2jspre_stream_iforeach_cloref(arg0, arg1)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_stream_iforeach_cloref
  _ats2jspre_stream_loop_44(arg1, 0, arg0);
  return/*_void*/;
} // end-of-function


function
_ats2jspre_stream_loop_44(env0, arg0, arg1)
{
//
// knd = 1
  var apy0
  var apy1
  var tmp119
  var tmp120
  var tmp121
  var tmp123
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_stream_loop_44
    tmp119 = ATSPMVlazyval_eval(arg1); 
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab60
        if(ATSCKptriscons(tmp119)) { tmplab_js = 4; break; }
        case 2: // __atstmplab61
        // ATSINSmove_void
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab62
        case 4: // __atstmplab63
        tmp120 = tmp119[0];
        tmp121 = tmp119[1];
        env0[0](env0, arg0, tmp120);
        tmp123 = ats2jspre_add_int1_int1(arg0, 1);
        // ATStailcalseq_beg
        apy0 = tmp123;
        apy1 = tmp121;
        arg0 = apy0;
        arg1 = apy1;
        funlab_js = 1; // __patsflab__ats2jspre_stream_loop_44
        // ATStailcalseq_end
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
    if (funlab_js > 0) continue; else return/*_void*/;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_stream_iforeach_method(arg0)
{
//
// knd = 0
  var tmpret124
  var tmplab, tmplab_js
//
  // __patsflab_stream_iforeach_method
  tmpret124 = _ats2jspre_stream_patsfun_46__closurerize(arg0);
  return tmpret124;
} // end-of-function


function
_ats2jspre_stream_patsfun_46(env0, arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_patsfun_46
  ats2jspre_stream_iforeach_cloref(env0, arg0);
  return/*_void*/;
} // end-of-function


function
ats2jspre_stream_tabulate_cloref(arg0)
{
//
// knd = 0
  var tmpret126
  var tmplab, tmplab_js
//
  // __patsflab_stream_tabulate_cloref
  tmpret126 = _ats2jspre_stream_auxmain_48(arg0, 0);
  return tmpret126;
} // end-of-function


function
_ats2jspre_stream_auxmain_48(env0, arg0)
{
//
// knd = 0
  var tmpret127
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_auxmain_48
  tmpret127 = ATSPMVlazyval(_ats2jspre_stream_patsfun_49__closurerize(env0, arg0));
  return tmpret127;
} // end-of-function


function
_ats2jspre_stream_patsfun_49(env0, env1)
{
//
// knd = 0
  var tmpret128
  var tmp129
  var tmp130
  var tmp131
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_patsfun_49
  tmp129 = env0[0](env0, env1);
  tmp131 = ats2jspre_add_int1_int1(env1, 1);
  tmp130 = _ats2jspre_stream_auxmain_48(env0, tmp131);
  tmpret128 = [tmp129, tmp130];
  return tmpret128;
} // end-of-function


function
ats2jspre_cross_stream_list(arg0, arg1)
{
//
// knd = 0
  var tmpret132
  var tmplab, tmplab_js
//
  // __patsflab_cross_stream_list
  tmpret132 = ATSPMVlazyval(_ats2jspre_stream_patsfun_53__closurerize(arg0, arg1));
  return tmpret132;
} // end-of-function


function
_ats2jspre_stream_auxmain_51(arg0, arg1, arg2, arg3)
{
//
// knd = 0
  var tmpret133
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_auxmain_51
  tmpret133 = ATSPMVlazyval(_ats2jspre_stream_patsfun_52__closurerize(arg0, arg1, arg2, arg3));
  return tmpret133;
} // end-of-function


function
_ats2jspre_stream_patsfun_52(env0, env1, env2, env3)
{
//
// knd = 0
  var tmpret134
  var tmp135
  var tmp136
  var tmp137
  var tmp138
  var tmp139
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_patsfun_52
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab64
      if(ATSCKptriscons(env3)) { tmplab_js = 4; break; }
      case 2: // __atstmplab65
      tmp137 = ats2jspre_cross_stream_list(env1, env2);
      tmpret134 = ATSPMVlazyval_eval(tmp137); 
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab66
      case 4: // __atstmplab67
      tmp135 = env3[0];
      tmp136 = env3[1];
      tmp138 = [env0, tmp135];
      tmp139 = _ats2jspre_stream_auxmain_51(env0, env1, env2, tmp136);
      tmpret134 = [tmp138, tmp139];
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret134;
} // end-of-function


function
_ats2jspre_stream_patsfun_53(env0, env1)
{
//
// knd = 0
  var tmpret140
  var tmp141
  var tmp142
  var tmp143
  var tmp144
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_patsfun_53
  tmp141 = ATSPMVlazyval_eval(env0); 
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab68
      if(ATSCKptriscons(tmp141)) { tmplab_js = 4; break; }
      case 2: // __atstmplab69
      tmpret140 = null;
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab70
      if(ATSCKptrisnull(tmp141)) ATSINScaseof_fail("/Users/RyanKing/ATS2-contrib/contrib/libatscc/DATS/stream.dats: 6907(line=451, offs=1) -- 6999(line=453, offs=50)");
      case 4: // __atstmplab71
      tmp142 = tmp141[0];
      tmp143 = tmp141[1];
      tmp144 = _ats2jspre_stream_auxmain_51(tmp142, tmp143, env1, env1);
      tmpret140 = ATSPMVlazyval_eval(tmp144); 
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret140;
} // end-of-function


function
ats2jspre_cross_stream_list0(arg0, arg1)
{
//
// knd = 0
  var tmpret145
  var tmplab, tmplab_js
//
  // __patsflab_cross_stream_list0
  tmpret145 = ats2jspre_cross_stream_list(arg0, arg1);
  return tmpret145;
} // end-of-function


function
ats2jspre_stream2cloref_exn(arg0)
{
//
// knd = 0
  var tmpret146
  var tmp147
  var tmplab, tmplab_js
//
  // __patsflab_stream2cloref_exn
  tmp147 = ats2jspre_ref(arg0);
  tmpret146 = _ats2jspre_stream_patsfun_56__closurerize(tmp147);
  return tmpret146;
} // end-of-function


function
_ats2jspre_stream_patsfun_56(env0)
{
//
// knd = 0
  var tmpret148
  var tmp149
  var tmp150
  var tmp151
  var tmp152
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_patsfun_56
  tmp149 = ats2jspre_ref_get_elt(env0);
  tmp150 = ATSPMVlazyval_eval(tmp149); 
  if(ATSCKptrisnull(tmp150)) ATSINScaseof_fail("/Users/RyanKing/ATS2-contrib/contrib/libatscc/DATS/stream.dats: 7300(line=479, offs=5) -- 7324(line=479, offs=29)");
  tmp151 = tmp150[0];
  tmp152 = tmp150[1];
  ats2jspre_ref_set_elt(env0, tmp152);
  tmpret148 = tmp151;
  return tmpret148;
} // end-of-function


function
ats2jspre_stream2cloref_opt(arg0)
{
//
// knd = 0
  var tmpret154
  var tmp155
  var tmplab, tmplab_js
//
  // __patsflab_stream2cloref_opt
  tmp155 = ats2jspre_ref(arg0);
  tmpret154 = _ats2jspre_stream_patsfun_58__closurerize(tmp155);
  return tmpret154;
} // end-of-function


function
_ats2jspre_stream_patsfun_58(env0)
{
//
// knd = 0
  var tmpret156
  var tmp157
  var tmp158
  var tmp159
  var tmp160
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_patsfun_58
  tmp157 = ats2jspre_ref_get_elt(env0);
  tmp158 = ATSPMVlazyval_eval(tmp157); 
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab72
      if(ATSCKptriscons(tmp158)) { tmplab_js = 4; break; }
      case 2: // __atstmplab73
      tmpret156 = null;
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab74
      case 4: // __atstmplab75
      tmp159 = tmp158[0];
      tmp160 = tmp158[1];
      ats2jspre_ref_set_elt(env0, tmp160);
      tmpret156 = [tmp159];
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret156;
} // end-of-function


function
ats2jspre_stream2cloref_last(arg0, arg1)
{
//
// knd = 0
  var tmpret162
  var tmp163
  var tmp164
  var tmplab, tmplab_js
//
  // __patsflab_stream2cloref_last
  tmp163 = ats2jspre_ref(arg0);
  tmp164 = ats2jspre_ref(arg1);
  tmpret162 = _ats2jspre_stream_patsfun_60__closurerize(tmp163, tmp164);
  return tmpret162;
} // end-of-function


function
_ats2jspre_stream_patsfun_60(env0, env1)
{
//
// knd = 0
  var tmpret165
  var tmp166
  var tmp167
  var tmp168
  var tmp169
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_patsfun_60
  tmp166 = ats2jspre_ref_get_elt(env0);
  tmp167 = ATSPMVlazyval_eval(tmp166); 
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab76
      if(ATSCKptriscons(tmp167)) { tmplab_js = 4; break; }
      case 2: // __atstmplab77
      tmpret165 = ats2jspre_ref_get_elt(env1);
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab78
      case 4: // __atstmplab79
      tmp168 = tmp167[0];
      tmp169 = tmp167[1];
      ats2jspre_ref_set_elt(env0, tmp169);
      ats2jspre_ref_set_elt(env1, tmp168);
      tmpret165 = tmp168;
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret165;
} // end-of-function


function
ats2jspre_stream_take_while_cloref(arg0, arg1)
{
//
// knd = 0
  var tmpret172
  var tmp173
  var tmp174
  var tmp175
  var tmp176
  var tmplab, tmplab_js
//
  // __patsflab_stream_take_while_cloref
  tmp173 = ats2jspre_stream_rtake_while_cloref(arg0, arg1);
  tmp174 = tmp173[0];
  tmp175 = tmp173[1];
  tmp176 = ats2jspre_list_reverse(tmp175);
  tmpret172 = [tmp174, tmp176];
  return tmpret172;
} // end-of-function


function
ats2jspre_stream_rtake_while_cloref(arg0, arg1)
{
//
// knd = 0
  var tmpret177
  var tmp185
  var tmplab, tmplab_js
//
  // __patsflab_stream_rtake_while_cloref
  tmp185 = null;
  tmpret177 = _ats2jspre_stream_loop_63(arg1, arg0, 0, tmp185);
  return tmpret177;
} // end-of-function


function
_ats2jspre_stream_loop_63(env0, arg0, arg1, arg2)
{
//
// knd = 1
  var apy0
  var apy1
  var apy2
  var tmpret178
  var tmp179
  var tmp180
  var tmp181
  var tmp182
  var tmp183
  var tmp184
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_stream_loop_63
    tmp179 = ATSPMVlazyval_eval(arg0); 
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab80
        if(ATSCKptriscons(tmp179)) { tmplab_js = 4; break; }
        case 2: // __atstmplab81
        tmpret178 = [arg0, arg2];
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab82
        case 4: // __atstmplab83
        tmp180 = tmp179[0];
        tmp181 = tmp179[1];
        tmp182 = env0[0](env0, arg1, tmp180);
        if(tmp182) {
          tmp183 = ats2jspre_add_int1_int1(arg1, 1);
          tmp184 = [tmp180, arg2];
          // ATStailcalseq_beg
          apy0 = tmp181;
          apy1 = tmp183;
          apy2 = tmp184;
          arg0 = apy0;
          arg1 = apy1;
          arg2 = apy2;
          funlab_js = 1; // __patsflab__ats2jspre_stream_loop_63
          // ATStailcalseq_end
        } else {
          tmpret178 = [arg0, arg2];
        } // endif
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
    if (funlab_js > 0) continue; else return tmpret178;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_stream_take_until_cloref(arg0, arg1)
{
//
// knd = 0
  var tmpret186
  var tmplab, tmplab_js
//
  // __patsflab_stream_take_until_cloref
  tmpret186 = ats2jspre_stream_take_while_cloref(arg0, _ats2jspre_stream_patsfun_65__closurerize(arg1));
  return tmpret186;
} // end-of-function


function
_ats2jspre_stream_patsfun_65(env0, arg0, arg1)
{
//
// knd = 0
  var tmpret187
  var tmp188
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_patsfun_65
  tmp188 = env0[0](env0, arg0, arg1);
  tmpret187 = atspre_neg_bool0(tmp188);
  return tmpret187;
} // end-of-function


function
ats2jspre_stream_rtake_until_cloref(arg0, arg1)
{
//
// knd = 0
  var tmpret189
  var tmplab, tmplab_js
//
  // __patsflab_stream_rtake_until_cloref
  tmpret189 = ats2jspre_stream_rtake_while_cloref(arg0, _ats2jspre_stream_patsfun_67__closurerize(arg1));
  return tmpret189;
} // end-of-function


function
_ats2jspre_stream_patsfun_67(env0, arg0, arg1)
{
//
// knd = 0
  var tmpret190
  var tmp191
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_patsfun_67
  tmp191 = env0[0](env0, arg0, arg1);
  tmpret190 = atspre_neg_bool0(tmp191);
  return tmpret190;
} // end-of-function


function
ats2jspre_stream_list_xprod2(arg0, arg1)
{
//
// knd = 0
  var tmpret192
  var tmplab, tmplab_js
//
  // __patsflab_stream_list_xprod2
  tmpret192 = _ats2jspre_stream_auxlst_71(arg0, arg1);
  return tmpret192;
} // end-of-function


function
_ats2jspre_stream_aux_69(arg0, arg1)
{
//
// knd = 0
  var tmpret193
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_aux_69
  tmpret193 = ATSPMVlazyval(_ats2jspre_stream_patsfun_70__closurerize(arg0, arg1));
  return tmpret193;
} // end-of-function


function
_ats2jspre_stream_patsfun_70(env0, env1)
{
//
// knd = 0
  var tmpret194
  var tmp195
  var tmp196
  var tmp197
  var tmp198
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_patsfun_70
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab84
      if(ATSCKptriscons(env1)) { tmplab_js = 4; break; }
      case 2: // __atstmplab85
      tmpret194 = null;
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab86
      case 4: // __atstmplab87
      tmp195 = env1[0];
      tmp196 = env1[1];
      tmp197 = [env0, tmp195];
      tmp198 = _ats2jspre_stream_aux_69(env0, tmp196);
      tmpret194 = [tmp197, tmp198];
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret194;
} // end-of-function


function
_ats2jspre_stream_auxlst_71(arg0, arg1)
{
//
// knd = 0
  var tmpret199
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_auxlst_71
  tmpret199 = ATSPMVlazyval(_ats2jspre_stream_patsfun_72__closurerize(arg0, arg1));
  return tmpret199;
} // end-of-function


function
_ats2jspre_stream_patsfun_72(env0, env1)
{
//
// knd = 0
  var tmpret200
  var tmp201
  var tmp202
  var tmp203
  var tmp204
  var tmp205
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_patsfun_72
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab88
      if(ATSCKptriscons(env0)) { tmplab_js = 4; break; }
      case 2: // __atstmplab89
      tmpret200 = null;
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab90
      case 4: // __atstmplab91
      tmp201 = env0[0];
      tmp202 = env0[1];
      tmp204 = _ats2jspre_stream_aux_69(tmp201, env1);
      tmp205 = _ats2jspre_stream_auxlst_71(tmp202, env1);
      tmp203 = ats2jspre_stream_append(tmp204, tmp205);
      tmpret200 = ATSPMVlazyval_eval(tmp203); 
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret200;
} // end-of-function


function
ats2jspre_stream_nth_exn(arg0, arg1)
{
//
// knd = 0
  var tmpret206
  var tmp207
  var tmp208
  var tmplab, tmplab_js
//
  // __patsflab_stream_nth_exn
  tmp207 = ats2jspre_stream_nth_opt(arg0, arg1);
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab92
      if(ATSCKptrisnull(tmp207)) { tmplab_js = 4; break; }
      case 2: // __atstmplab93
      tmp208 = tmp207[0];
      // ATSINSfreecon(tmp207);
      tmpret206 = tmp208;
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab94
      case 4: // __atstmplab95
      tmpret206 = ats2jspre_StreamSubscriptExn_throw();
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret206;
} // end-of-function


/* ****** ****** */

/* end-of-compilation-unit */
/*
**
** The JavaScript code is generated by atscc2js
** The starting compilation time is: 2016-12-25: 17h:42m
**
*/

function
_ats2jspre_stream_vt_patsfun_7__closurerize(env0)
{
  return [function(cenv) { return _ats2jspre_stream_vt_patsfun_7(cenv[1]); }, env0];
}


function
_ats2jspre_stream_vt_patsfun_10__closurerize(env0, env1)
{
  return [function(cenv, arg0) { return _ats2jspre_stream_vt_patsfun_10(cenv[1], cenv[2], arg0); }, env0, env1];
}


function
_ats2jspre_stream_vt_patsfun_19__closurerize(env0, env1)
{
  return [function(cenv, arg0) { return _ats2jspre_stream_vt_patsfun_19(cenv[1], cenv[2], arg0); }, env0, env1];
}


function
_ats2jspre_stream_vt_patsfun_22__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_stream_vt_patsfun_22(cenv[1], arg0); }, env0];
}


function
_ats2jspre_stream_vt_patsfun_25__closurerize(env0, env1)
{
  return [function(cenv, arg0) { return _ats2jspre_stream_vt_patsfun_25(cenv[1], cenv[2], arg0); }, env0, env1];
}


function
_ats2jspre_stream_vt_patsfun_27__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_stream_vt_patsfun_27(cenv[1], arg0); }, env0];
}


function
_ats2jspre_stream_vt_patsfun_30__closurerize(env0, env1)
{
  return [function(cenv, arg0) { return _ats2jspre_stream_vt_patsfun_30(cenv[1], cenv[2], arg0); }, env0, env1];
}


function
_ats2jspre_stream_vt_patsfun_32__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_stream_vt_patsfun_32(cenv[1], arg0); }, env0];
}


function
_ats2jspre_stream_vt_patsfun_36__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_stream_vt_patsfun_36(cenv[1], arg0); }, env0];
}


function
_ats2jspre_stream_vt_patsfun_40__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_stream_vt_patsfun_40(cenv[1], arg0); }, env0];
}


function
_ats2jspre_stream_vt_patsfun_44__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_stream_vt_patsfun_44(cenv[1], arg0); }, env0];
}


function
_ats2jspre_stream_vt_patsfun_48__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_stream_vt_patsfun_48(cenv[1], arg0); }, env0];
}


function
_ats2jspre_stream_vt_patsfun_52__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_stream_vt_patsfun_52(cenv[1], arg0); }, env0];
}


function
_ats2jspre_stream_vt_patsfun_55__closurerize(env0, env1)
{
  return [function(cenv, arg0) { return _ats2jspre_stream_vt_patsfun_55(cenv[1], cenv[2], arg0); }, env0, env1];
}


function
ats2jspre_stream_vt_free(arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_stream_vt_free
  atspre_lazy_vt_free(arg0);
  return/*_void*/;
} // end-of-function


function
ats2jspre_stream_vt2t(arg0)
{
//
// knd = 0
  var tmpret6
  var tmplab, tmplab_js
//
  // __patsflab_stream_vt2t
  tmpret6 = _ats2jspre_stream_vt_aux_6(arg0);
  return tmpret6;
} // end-of-function


function
_ats2jspre_stream_vt_aux_6(arg0)
{
//
// knd = 0
  var tmpret7
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_vt_aux_6
  tmpret7 = ATSPMVlazyval(_ats2jspre_stream_vt_patsfun_7__closurerize(arg0));
  return tmpret7;
} // end-of-function


function
_ats2jspre_stream_vt_patsfun_7(env0)
{
//
// knd = 0
  var tmpret8
  var tmp9
  var tmp10
  var tmp11
  var tmp12
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_vt_patsfun_7
  tmp9 = ATSPMVllazyval_eval(env0);
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab0
      if(ATSCKptriscons(tmp9)) { tmplab_js = 4; break; }
      case 2: // __atstmplab1
      tmpret8 = null;
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab2
      case 4: // __atstmplab3
      tmp10 = tmp9[0];
      tmp11 = tmp9[1];
      // ATSINSfreecon(tmp9);
      tmp12 = _ats2jspre_stream_vt_aux_6(tmp11);
      tmpret8 = [tmp10, tmp12];
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret8;
} // end-of-function


function
ats2jspre_stream_vt_takeLte(arg0, arg1)
{
//
// knd = 0
  var tmpret13
  var tmplab, tmplab_js
//
  // __patsflab_stream_vt_takeLte
  tmpret13 = _ats2jspre_stream_vt_auxmain_9(arg0, arg1);
  return tmpret13;
} // end-of-function


function
_ats2jspre_stream_vt_auxmain_9(arg0, arg1)
{
//
// knd = 0
  var tmpret14
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_vt_auxmain_9
  tmpret14 = ATSPMVllazyval(_ats2jspre_stream_vt_patsfun_10__closurerize(arg0, arg1));
  return tmpret14;
} // end-of-function


function
_ats2jspre_stream_vt_patsfun_10(env0, env1, arg0)
{
//
// knd = 0
  var tmpret15
  var tmp16
  var tmp17
  var tmp18
  var tmp19
  var tmp20
  var tmp21
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_vt_patsfun_10
  if(arg0) {
    tmp16 = ats2jspre_gt_int1_int1(env1, 0);
    if(tmp16) {
      tmp17 = ATSPMVllazyval_eval(env0);
      // ATScaseofseq_beg
      tmplab_js = 1;
      while(true) {
        tmplab = tmplab_js; tmplab_js = 0;
        switch(tmplab) {
          // ATSbranchseq_beg
          case 1: // __atstmplab4
          if(ATSCKptriscons(tmp17)) { tmplab_js = 4; break; }
          case 2: // __atstmplab5
          tmpret15 = null;
          break;
          // ATSbranchseq_end
          // ATSbranchseq_beg
          case 3: // __atstmplab6
          case 4: // __atstmplab7
          tmp18 = tmp17[0];
          tmp19 = tmp17[1];
          // ATSINSfreecon(tmp17);
          tmp21 = ats2jspre_sub_int1_int1(env1, 1);
          tmp20 = _ats2jspre_stream_vt_auxmain_9(tmp19, tmp21);
          tmpret15 = [tmp18, tmp20];
          break;
          // ATSbranchseq_end
        } // end-of-switch
        if (tmplab_js === 0) break;
      } // endwhile
      // ATScaseofseq_end
    } else {
      atspre_lazy_vt_free(env0);
      tmpret15 = null;
    } // endif
  } else {
    atspre_lazy_vt_free(env0);
  } // endif
  return tmpret15;
} // end-of-function


function
ats2jspre_stream_vt_length(arg0)
{
//
// knd = 0
  var tmpret24
  var tmplab, tmplab_js
//
  // __patsflab_stream_vt_length
  tmpret24 = _ats2jspre_stream_vt_loop_12(arg0, 0);
  return tmpret24;
} // end-of-function


function
_ats2jspre_stream_vt_loop_12(arg0, arg1)
{
//
// knd = 1
  var apy0
  var apy1
  var tmpret25
  var tmp26
  var tmp28
  var tmp29
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_stream_vt_loop_12
    tmp26 = ATSPMVllazyval_eval(arg0);
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab8
        if(ATSCKptriscons(tmp26)) { tmplab_js = 4; break; }
        case 2: // __atstmplab9
        tmpret25 = arg1;
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab10
        case 4: // __atstmplab11
        tmp28 = tmp26[1];
        // ATSINSfreecon(tmp26);
        tmp29 = ats2jspre_add_int1_int1(arg1, 1);
        // ATStailcalseq_beg
        apy0 = tmp28;
        apy1 = tmp29;
        arg0 = apy0;
        arg1 = apy1;
        funlab_js = 1; // __patsflab__ats2jspre_stream_vt_loop_12
        // ATStailcalseq_end
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
    if (funlab_js > 0) continue; else return tmpret25;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_stream2list_vt(arg0)
{
//
// knd = 0
  var tmpret30
  var tmplab, tmplab_js
//
  // __patsflab_stream2list_vt
  tmpret30 = _ats2jspre_stream_vt_aux_14(arg0);
  return tmpret30;
} // end-of-function


function
_ats2jspre_stream_vt_aux_14(arg0)
{
//
// knd = 0
  var tmpret31
  var tmp32
  var tmp33
  var tmp34
  var tmp35
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_vt_aux_14
  tmp32 = ATSPMVllazyval_eval(arg0);
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab12
      if(ATSCKptriscons(tmp32)) { tmplab_js = 4; break; }
      case 2: // __atstmplab13
      tmpret31 = null;
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab14
      case 4: // __atstmplab15
      tmp33 = tmp32[0];
      tmp34 = tmp32[1];
      // ATSINSfreecon(tmp32);
      tmp35 = _ats2jspre_stream_vt_aux_14(tmp34);
      tmpret31 = [tmp33, tmp35];
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret31;
} // end-of-function


function
ats2jspre_stream2list_vt_rev(arg0)
{
//
// knd = 0
  var tmpret36
  var tmp42
  var tmplab, tmplab_js
//
  // __patsflab_stream2list_vt_rev
  tmp42 = null;
  tmpret36 = _ats2jspre_stream_vt_loop_16(arg0, tmp42);
  return tmpret36;
} // end-of-function


function
_ats2jspre_stream_vt_loop_16(arg0, arg1)
{
//
// knd = 1
  var apy0
  var apy1
  var tmpret37
  var tmp38
  var tmp39
  var tmp40
  var tmp41
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_stream_vt_loop_16
    tmp38 = ATSPMVllazyval_eval(arg0);
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab16
        if(ATSCKptriscons(tmp38)) { tmplab_js = 4; break; }
        case 2: // __atstmplab17
        tmpret37 = arg1;
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab18
        case 4: // __atstmplab19
        tmp39 = tmp38[0];
        tmp40 = tmp38[1];
        // ATSINSfreecon(tmp38);
        tmp41 = [tmp39, arg1];
        // ATStailcalseq_beg
        apy0 = tmp40;
        apy1 = tmp41;
        arg0 = apy0;
        arg1 = apy1;
        funlab_js = 1; // __patsflab__ats2jspre_stream_vt_loop_16
        // ATStailcalseq_end
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
    if (funlab_js > 0) continue; else return tmpret37;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_stream_vt_append(arg0, arg1)
{
//
// knd = 0
  var tmpret43
  var tmplab, tmplab_js
//
  // __patsflab_stream_vt_append
  tmpret43 = _ats2jspre_stream_vt_auxmain_18(arg0, arg1);
  return tmpret43;
} // end-of-function


function
_ats2jspre_stream_vt_auxmain_18(arg0, arg1)
{
//
// knd = 0
  var tmpret44
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_vt_auxmain_18
  tmpret44 = ATSPMVllazyval(_ats2jspre_stream_vt_patsfun_19__closurerize(arg0, arg1));
  return tmpret44;
} // end-of-function


function
_ats2jspre_stream_vt_patsfun_19(env0, env1, arg0)
{
//
// knd = 0
  var tmpret45
  var tmp46
  var tmp47
  var tmp48
  var tmp49
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_vt_patsfun_19
  if(arg0) {
    tmp46 = ATSPMVllazyval_eval(env0);
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab20
        if(ATSCKptriscons(tmp46)) { tmplab_js = 4; break; }
        case 2: // __atstmplab21
        tmpret45 = ATSPMVllazyval_eval(env1);
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab22
        case 4: // __atstmplab23
        tmp47 = tmp46[0];
        tmp48 = tmp46[1];
        // ATSINSfreecon(tmp46);
        tmp49 = _ats2jspre_stream_vt_auxmain_18(tmp48, env1);
        tmpret45 = [tmp47, tmp49];
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
  } else {
    atspre_lazy_vt_free(env0);
    atspre_lazy_vt_free(env1);
  } // endif
  return tmpret45;
} // end-of-function


function
ats2jspre_stream_vt_concat(arg0)
{
//
// knd = 0
  var tmpret52
  var tmplab, tmplab_js
//
  // __patsflab_stream_vt_concat
  tmpret52 = _ats2jspre_stream_vt_auxmain_21(arg0);
  return tmpret52;
} // end-of-function


function
_ats2jspre_stream_vt_auxmain_21(arg0)
{
//
// knd = 0
  var tmpret53
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_vt_auxmain_21
  tmpret53 = ATSPMVllazyval(_ats2jspre_stream_vt_patsfun_22__closurerize(arg0));
  return tmpret53;
} // end-of-function


function
_ats2jspre_stream_vt_patsfun_22(env0, arg0)
{
//
// knd = 0
  var tmpret54
  var tmp55
  var tmp56
  var tmp57
  var tmp58
  var tmp59
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_vt_patsfun_22
  if(arg0) {
    tmp55 = ATSPMVllazyval_eval(env0);
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab24
        if(ATSCKptriscons(tmp55)) { tmplab_js = 4; break; }
        case 2: // __atstmplab25
        tmpret54 = null;
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab26
        case 4: // __atstmplab27
        tmp56 = tmp55[0];
        tmp57 = tmp55[1];
        // ATSINSfreecon(tmp55);
        tmp59 = _ats2jspre_stream_vt_auxmain_21(tmp57);
        tmp58 = ats2jspre_stream_vt_append(tmp56, tmp59);
        tmpret54 = ATSPMVllazyval_eval(tmp58);
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
  } else {
    atspre_lazy_vt_free(env0);
  } // endif
  return tmpret54;
} // end-of-function


function
ats2jspre_stream_vt_map_cloref(arg0, arg1)
{
//
// knd = 0
  var tmpret61
  var tmplab, tmplab_js
//
  // __patsflab_stream_vt_map_cloref
  tmpret61 = _ats2jspre_stream_vt_auxmain_24(arg1, arg0);
  return tmpret61;
} // end-of-function


function
_ats2jspre_stream_vt_auxmain_24(env0, arg0)
{
//
// knd = 0
  var tmpret62
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_vt_auxmain_24
  tmpret62 = ATSPMVllazyval(_ats2jspre_stream_vt_patsfun_25__closurerize(env0, arg0));
  return tmpret62;
} // end-of-function


function
_ats2jspre_stream_vt_patsfun_25(env0, env1, arg0)
{
//
// knd = 0
  var tmpret63
  var tmp64
  var tmp65
  var tmp66
  var tmp67
  var tmp68
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_vt_patsfun_25
  if(arg0) {
    tmp64 = ATSPMVllazyval_eval(env1);
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab28
        if(ATSCKptriscons(tmp64)) { tmplab_js = 4; break; }
        case 2: // __atstmplab29
        tmpret63 = null;
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab30
        case 4: // __atstmplab31
        tmp65 = tmp64[0];
        tmp66 = tmp64[1];
        // ATSINSfreecon(tmp64);
        tmp67 = env0[0](env0, tmp65);
        tmp68 = _ats2jspre_stream_vt_auxmain_24(env0, tmp66);
        tmpret63 = [tmp67, tmp68];
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
  } else {
    atspre_lazy_vt_free(env1);
  } // endif
  return tmpret63;
} // end-of-function


function
ats2jspre_stream_vt_map_method(arg0, arg1)
{
//
// knd = 0
  var tmpret70
  var tmplab, tmplab_js
//
  // __patsflab_stream_vt_map_method
  tmpret70 = _ats2jspre_stream_vt_patsfun_27__closurerize(arg0);
  return tmpret70;
} // end-of-function


function
_ats2jspre_stream_vt_patsfun_27(env0, arg0)
{
//
// knd = 0
  var tmpret71
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_vt_patsfun_27
  tmpret71 = ats2jspre_stream_vt_map_cloref(env0, arg0);
  return tmpret71;
} // end-of-function


function
ats2jspre_stream_vt_filter_cloref(arg0, arg1)
{
//
// knd = 0
  var tmpret72
  var tmplab, tmplab_js
//
  // __patsflab_stream_vt_filter_cloref
  tmpret72 = _ats2jspre_stream_vt_auxmain_29(arg1, arg0);
  return tmpret72;
} // end-of-function


function
_ats2jspre_stream_vt_auxmain_29(env0, arg0)
{
//
// knd = 0
  var tmpret73
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_vt_auxmain_29
  tmpret73 = ATSPMVllazyval(_ats2jspre_stream_vt_patsfun_30__closurerize(env0, arg0));
  return tmpret73;
} // end-of-function


function
_ats2jspre_stream_vt_patsfun_30(env0, env1, arg0)
{
//
// knd = 0
  var tmpret74
  var tmp75
  var tmp76
  var tmp77
  var tmp78
  var tmp79
  var tmp80
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_vt_patsfun_30
  if(arg0) {
    tmp75 = ATSPMVllazyval_eval(env1);
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab32
        if(ATSCKptriscons(tmp75)) { tmplab_js = 4; break; }
        case 2: // __atstmplab33
        tmpret74 = null;
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab34
        case 4: // __atstmplab35
        tmp76 = tmp75[0];
        tmp77 = tmp75[1];
        // ATSINSfreecon(tmp75);
        tmp78 = env0[0](env0, tmp76);
        if(tmp78) {
          tmp79 = _ats2jspre_stream_vt_auxmain_29(env0, tmp77);
          tmpret74 = [tmp76, tmp79];
        } else {
          tmp80 = _ats2jspre_stream_vt_auxmain_29(env0, tmp77);
          tmpret74 = ATSPMVllazyval_eval(tmp80);
        } // endif
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
  } else {
    atspre_lazy_vt_free(env1);
  } // endif
  return tmpret74;
} // end-of-function


function
ats2jspre_stream_vt_filter_method(arg0)
{
//
// knd = 0
  var tmpret82
  var tmplab, tmplab_js
//
  // __patsflab_stream_vt_filter_method
  tmpret82 = _ats2jspre_stream_vt_patsfun_32__closurerize(arg0);
  return tmpret82;
} // end-of-function


function
_ats2jspre_stream_vt_patsfun_32(env0, arg0)
{
//
// knd = 0
  var tmpret83
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_vt_patsfun_32
  tmpret83 = ats2jspre_stream_vt_filter_cloref(env0, arg0);
  return tmpret83;
} // end-of-function


function
ats2jspre_stream_vt_exists_cloref(arg0, arg1)
{
//
// knd = 0
  var tmpret84
  var tmplab, tmplab_js
//
  // __patsflab_stream_vt_exists_cloref
  tmpret84 = _ats2jspre_stream_vt_loop_34(arg1, arg0);
  return tmpret84;
} // end-of-function


function
_ats2jspre_stream_vt_loop_34(env0, arg0)
{
//
// knd = 1
  var apy0
  var tmpret85
  var tmp86
  var tmp87
  var tmp88
  var tmp89
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_stream_vt_loop_34
    tmp86 = ATSPMVllazyval_eval(arg0);
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab36
        if(ATSCKptriscons(tmp86)) { tmplab_js = 4; break; }
        case 2: // __atstmplab37
        tmpret85 = false;
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab38
        case 4: // __atstmplab39
        tmp87 = tmp86[0];
        tmp88 = tmp86[1];
        // ATSINSfreecon(tmp86);
        tmp89 = env0[0](env0, tmp87);
        if(tmp89) {
          atspre_lazy_vt_free(tmp88);
          tmpret85 = true;
        } else {
          // ATStailcalseq_beg
          apy0 = tmp88;
          arg0 = apy0;
          funlab_js = 1; // __patsflab__ats2jspre_stream_vt_loop_34
          // ATStailcalseq_end
        } // endif
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
    if (funlab_js > 0) continue; else return tmpret85;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_stream_vt_exists_method(arg0)
{
//
// knd = 0
  var tmpret91
  var tmplab, tmplab_js
//
  // __patsflab_stream_vt_exists_method
  tmpret91 = _ats2jspre_stream_vt_patsfun_36__closurerize(arg0);
  return tmpret91;
} // end-of-function


function
_ats2jspre_stream_vt_patsfun_36(env0, arg0)
{
//
// knd = 0
  var tmpret92
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_vt_patsfun_36
  tmpret92 = ats2jspre_stream_vt_exists_cloref(env0, arg0);
  return tmpret92;
} // end-of-function


function
ats2jspre_stream_vt_forall_cloref(arg0, arg1)
{
//
// knd = 0
  var tmpret93
  var tmplab, tmplab_js
//
  // __patsflab_stream_vt_forall_cloref
  tmpret93 = _ats2jspre_stream_vt_loop_38(arg1, arg0);
  return tmpret93;
} // end-of-function


function
_ats2jspre_stream_vt_loop_38(env0, arg0)
{
//
// knd = 1
  var apy0
  var tmpret94
  var tmp95
  var tmp96
  var tmp97
  var tmp98
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_stream_vt_loop_38
    tmp95 = ATSPMVllazyval_eval(arg0);
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab40
        if(ATSCKptriscons(tmp95)) { tmplab_js = 4; break; }
        case 2: // __atstmplab41
        tmpret94 = true;
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab42
        case 4: // __atstmplab43
        tmp96 = tmp95[0];
        tmp97 = tmp95[1];
        // ATSINSfreecon(tmp95);
        tmp98 = env0[0](env0, tmp96);
        if(tmp98) {
          // ATStailcalseq_beg
          apy0 = tmp97;
          arg0 = apy0;
          funlab_js = 1; // __patsflab__ats2jspre_stream_vt_loop_38
          // ATStailcalseq_end
        } else {
          atspre_lazy_vt_free(tmp97);
          tmpret94 = false;
        } // endif
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
    if (funlab_js > 0) continue; else return tmpret94;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_stream_vt_forall_method(arg0)
{
//
// knd = 0
  var tmpret100
  var tmplab, tmplab_js
//
  // __patsflab_stream_vt_forall_method
  tmpret100 = _ats2jspre_stream_vt_patsfun_40__closurerize(arg0);
  return tmpret100;
} // end-of-function


function
_ats2jspre_stream_vt_patsfun_40(env0, arg0)
{
//
// knd = 0
  var tmpret101
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_vt_patsfun_40
  tmpret101 = ats2jspre_stream_vt_forall_cloref(env0, arg0);
  return tmpret101;
} // end-of-function


function
ats2jspre_stream_vt_foreach_cloref(arg0, arg1)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_stream_vt_foreach_cloref
  _ats2jspre_stream_vt_loop_42(arg1, arg0);
  return/*_void*/;
} // end-of-function


function
_ats2jspre_stream_vt_loop_42(env0, arg0)
{
//
// knd = 1
  var apy0
  var tmp104
  var tmp105
  var tmp106
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_stream_vt_loop_42
    tmp104 = ATSPMVllazyval_eval(arg0);
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab44
        if(ATSCKptriscons(tmp104)) { tmplab_js = 4; break; }
        case 2: // __atstmplab45
        // ATSINSmove_void
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab46
        case 4: // __atstmplab47
        tmp105 = tmp104[0];
        tmp106 = tmp104[1];
        // ATSINSfreecon(tmp104);
        env0[0](env0, tmp105);
        // ATStailcalseq_beg
        apy0 = tmp106;
        arg0 = apy0;
        funlab_js = 1; // __patsflab__ats2jspre_stream_vt_loop_42
        // ATStailcalseq_end
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
    if (funlab_js > 0) continue; else return/*_void*/;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_stream_vt_foreach_method(arg0)
{
//
// knd = 0
  var tmpret108
  var tmplab, tmplab_js
//
  // __patsflab_stream_vt_foreach_method
  tmpret108 = _ats2jspre_stream_vt_patsfun_44__closurerize(arg0);
  return tmpret108;
} // end-of-function


function
_ats2jspre_stream_vt_patsfun_44(env0, arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_vt_patsfun_44
  ats2jspre_stream_vt_foreach_cloref(env0, arg0);
  return/*_void*/;
} // end-of-function


function
ats2jspre_stream_vt_iforeach_cloref(arg0, arg1)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_stream_vt_iforeach_cloref
  _ats2jspre_stream_vt_loop_46(arg1, 0, arg0);
  return/*_void*/;
} // end-of-function


function
_ats2jspre_stream_vt_loop_46(env0, arg0, arg1)
{
//
// knd = 1
  var apy0
  var apy1
  var tmp112
  var tmp113
  var tmp114
  var tmp116
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_stream_vt_loop_46
    tmp112 = ATSPMVllazyval_eval(arg1);
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab48
        if(ATSCKptriscons(tmp112)) { tmplab_js = 4; break; }
        case 2: // __atstmplab49
        // ATSINSmove_void
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab50
        case 4: // __atstmplab51
        tmp113 = tmp112[0];
        tmp114 = tmp112[1];
        // ATSINSfreecon(tmp112);
        env0[0](env0, arg0, tmp113);
        tmp116 = ats2jspre_add_int1_int1(arg0, 1);
        // ATStailcalseq_beg
        apy0 = tmp116;
        apy1 = tmp114;
        arg0 = apy0;
        arg1 = apy1;
        funlab_js = 1; // __patsflab__ats2jspre_stream_vt_loop_46
        // ATStailcalseq_end
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
    if (funlab_js > 0) continue; else return/*_void*/;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_stream_vt_iforeach_method(arg0)
{
//
// knd = 0
  var tmpret117
  var tmplab, tmplab_js
//
  // __patsflab_stream_vt_iforeach_method
  tmpret117 = _ats2jspre_stream_vt_patsfun_48__closurerize(arg0);
  return tmpret117;
} // end-of-function


function
_ats2jspre_stream_vt_patsfun_48(env0, arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_vt_patsfun_48
  ats2jspre_stream_vt_iforeach_cloref(env0, arg0);
  return/*_void*/;
} // end-of-function


function
ats2jspre_stream_vt_rforeach_cloref(arg0, arg1)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_stream_vt_rforeach_cloref
  _ats2jspre_stream_vt_auxmain_50(arg1, arg0);
  return/*_void*/;
} // end-of-function


function
_ats2jspre_stream_vt_auxmain_50(env0, arg0)
{
//
// knd = 0
  var tmp121
  var tmp122
  var tmp123
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_vt_auxmain_50
  tmp121 = ATSPMVllazyval_eval(arg0);
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab52
      if(ATSCKptriscons(tmp121)) { tmplab_js = 4; break; }
      case 2: // __atstmplab53
      // ATSINSmove_void
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab54
      case 4: // __atstmplab55
      tmp122 = tmp121[0];
      tmp123 = tmp121[1];
      // ATSINSfreecon(tmp121);
      _ats2jspre_stream_vt_auxmain_50(env0, tmp123);
      env0[0](env0, tmp122);
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return/*_void*/;
} // end-of-function


function
ats2jspre_stream_vt_rforeach_method(arg0)
{
//
// knd = 0
  var tmpret125
  var tmplab, tmplab_js
//
  // __patsflab_stream_vt_rforeach_method
  tmpret125 = _ats2jspre_stream_vt_patsfun_52__closurerize(arg0);
  return tmpret125;
} // end-of-function


function
_ats2jspre_stream_vt_patsfun_52(env0, arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_vt_patsfun_52
  ats2jspre_stream_vt_rforeach_cloref(env0, arg0);
  return/*_void*/;
} // end-of-function


function
ats2jspre_stream_vt_tabulate_cloref(arg0)
{
//
// knd = 0
  var tmpret127
  var tmplab, tmplab_js
//
  // __patsflab_stream_vt_tabulate_cloref
  tmpret127 = _ats2jspre_stream_vt_auxmain_54(arg0, 0);
  return tmpret127;
} // end-of-function


function
_ats2jspre_stream_vt_auxmain_54(env0, arg0)
{
//
// knd = 0
  var tmpret128
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_vt_auxmain_54
  tmpret128 = ATSPMVllazyval(_ats2jspre_stream_vt_patsfun_55__closurerize(env0, arg0));
  return tmpret128;
} // end-of-function


function
_ats2jspre_stream_vt_patsfun_55(env0, env1, arg0)
{
//
// knd = 0
  var tmpret129
  var tmp130
  var tmp131
  var tmp132
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_vt_patsfun_55
  if(arg0) {
    tmp130 = env0[0](env0, env1);
    tmp132 = ats2jspre_add_int1_int1(env1, 1);
    tmp131 = _ats2jspre_stream_vt_auxmain_54(env0, tmp132);
    tmpret129 = [tmp130, tmp131];
  } else {
  } // endif
  return tmpret129;
} // end-of-function


/* ****** ****** */

/* end-of-compilation-unit */
/*
**
** The JavaScript code is generated by atscc2js
** The starting compilation time is: 2016-12-25: 17h:42m
**
*/

function
ats2jspre_gvalue_nil()
{
//
// knd = 0
  var tmpret0
  var tmplab, tmplab_js
//
  // __patsflab_gvalue_nil
  tmpret0 = 0;
  return tmpret0;
} // end-of-function


function
ats2jspre_gvalue_int(arg0)
{
//
// knd = 0
  var tmpret1
  var tmplab, tmplab_js
//
  // __patsflab_gvalue_int
  tmpret1 = [1, arg0];
  return tmpret1;
} // end-of-function


function
ats2jspre_gvalue_bool(arg0)
{
//
// knd = 0
  var tmpret2
  var tmplab, tmplab_js
//
  // __patsflab_gvalue_bool
  tmpret2 = [2, arg0];
  return tmpret2;
} // end-of-function


function
ats2jspre_gvalue_float(arg0)
{
//
// knd = 0
  var tmpret3
  var tmplab, tmplab_js
//
  // __patsflab_gvalue_float
  tmpret3 = [3, arg0];
  return tmpret3;
} // end-of-function


function
ats2jspre_gvalue_string(arg0)
{
//
// knd = 0
  var tmpret4
  var tmplab, tmplab_js
//
  // __patsflab_gvalue_string
  tmpret4 = [4, arg0];
  return tmpret4;
} // end-of-function


/* ****** ****** */

/* end-of-compilation-unit */
/*
**
** The JavaScript code is generated by atscc2js
** The starting compilation time is: 2016-12-25: 17h:42m
**
*/

function
_ats2jspre_intrange_patsfun_4__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_intrange_patsfun_4(cenv[1], arg0); }, env0];
}


function
_ats2jspre_intrange_patsfun_9__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_intrange_patsfun_9(cenv[1], arg0); }, env0];
}


function
_ats2jspre_intrange_patsfun_11__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_intrange_patsfun_11(cenv[1], arg0); }, env0];
}


function
_ats2jspre_intrange_patsfun_13__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_intrange_patsfun_13(cenv[1], arg0); }, env0];
}


function
_ats2jspre_intrange_patsfun_16__closurerize(env0, env1)
{
  return [function(cenv, arg0) { return _ats2jspre_intrange_patsfun_16(cenv[1], cenv[2], arg0); }, env0, env1];
}


function
_ats2jspre_intrange_patsfun_20__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_intrange_patsfun_20(cenv[1], arg0); }, env0];
}


function
_ats2jspre_intrange_patsfun_23__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_intrange_patsfun_23(cenv[1], arg0); }, env0];
}


function
_ats2jspre_intrange_patsfun_26__closurerize(env0, env1, env2)
{
  return [function(cenv) { return _ats2jspre_intrange_patsfun_26(cenv[1], cenv[2], cenv[3]); }, env0, env1, env2];
}


function
_ats2jspre_intrange_patsfun_28__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_intrange_patsfun_28(cenv[1], arg0); }, env0];
}


function
_ats2jspre_intrange_patsfun_31__closurerize(env0, env1, env2)
{
  return [function(cenv, arg0) { return _ats2jspre_intrange_patsfun_31(cenv[1], cenv[2], cenv[3], arg0); }, env0, env1, env2];
}


function
_ats2jspre_intrange_patsfun_33__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_intrange_patsfun_33(cenv[1], arg0); }, env0];
}


function
_ats2jspre_intrange_patsfun_40__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_intrange_patsfun_40(cenv[1], arg0); }, env0];
}


function
_ats2jspre_intrange_patsfun_44__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_intrange_patsfun_44(cenv[1], arg0); }, env0];
}


function
_ats2jspre_intrange_patsfun_48__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_intrange_patsfun_48(cenv[1], arg0); }, env0];
}


function
_ats2jspre_intrange_patsfun_52__closurerize(env0, env1, env2)
{
  return [function(cenv, arg0) { return _ats2jspre_intrange_patsfun_52(cenv[1], cenv[2], cenv[3], arg0); }, env0, env1, env2];
}


function
ats2jspre_int_repeat_lazy(arg0, arg1)
{
//
// knd = 0
  var tmp1
  var tmplab, tmplab_js
//
  // __patsflab_int_repeat_lazy
  tmp1 = ats2jspre_lazy2cloref(arg1);
  ats2jspre_int_repeat_cloref(arg0, tmp1);
  return/*_void*/;
} // end-of-function


function
ats2jspre_int_repeat_cloref(arg0, arg1)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_int_repeat_cloref
  _ats2jspre_intrange_loop_2(arg0, arg1);
  return/*_void*/;
} // end-of-function


function
_ats2jspre_intrange_loop_2(arg0, arg1)
{
//
// knd = 1
  var apy0
  var apy1
  var tmp4
  var tmp6
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_intrange_loop_2
    tmp4 = ats2jspre_gt_int0_int0(arg0, 0);
    if(tmp4) {
      arg1[0](arg1);
      tmp6 = ats2jspre_sub_int0_int0(arg0, 1);
      // ATStailcalseq_beg
      apy0 = tmp6;
      apy1 = arg1;
      arg0 = apy0;
      arg1 = apy1;
      funlab_js = 1; // __patsflab__ats2jspre_intrange_loop_2
      // ATStailcalseq_end
    } else {
      // ATSINSmove_void
    } // endif
    if (funlab_js > 0) continue; else return/*_void*/;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_int_repeat_method(arg0)
{
//
// knd = 0
  var tmpret7
  var tmplab, tmplab_js
//
  // __patsflab_int_repeat_method
  tmpret7 = _ats2jspre_intrange_patsfun_4__closurerize(arg0);
  return tmpret7;
} // end-of-function


function
_ats2jspre_intrange_patsfun_4(env0, arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_intrange_patsfun_4
  ats2jspre_int_repeat_cloref(env0, arg0);
  return/*_void*/;
} // end-of-function


function
ats2jspre_int_exists_cloref(arg0, arg1)
{
//
// knd = 0
  var tmpret9
  var tmplab, tmplab_js
//
  // __patsflab_int_exists_cloref
  tmpret9 = ats2jspre_intrange_exists_cloref(0, arg0, arg1);
  return tmpret9;
} // end-of-function


function
ats2jspre_int_forall_cloref(arg0, arg1)
{
//
// knd = 0
  var tmpret10
  var tmplab, tmplab_js
//
  // __patsflab_int_forall_cloref
  tmpret10 = ats2jspre_intrange_forall_cloref(0, arg0, arg1);
  return tmpret10;
} // end-of-function


function
ats2jspre_int_foreach_cloref(arg0, arg1)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_int_foreach_cloref
  ats2jspre_intrange_foreach_cloref(0, arg0, arg1);
  return/*_void*/;
} // end-of-function


function
ats2jspre_int_exists_method(arg0)
{
//
// knd = 0
  var tmpret12
  var tmplab, tmplab_js
//
  // __patsflab_int_exists_method
  tmpret12 = _ats2jspre_intrange_patsfun_9__closurerize(arg0);
  return tmpret12;
} // end-of-function


function
_ats2jspre_intrange_patsfun_9(env0, arg0)
{
//
// knd = 0
  var tmpret13
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_intrange_patsfun_9
  tmpret13 = ats2jspre_int_exists_cloref(env0, arg0);
  return tmpret13;
} // end-of-function


function
ats2jspre_int_forall_method(arg0)
{
//
// knd = 0
  var tmpret14
  var tmplab, tmplab_js
//
  // __patsflab_int_forall_method
  tmpret14 = _ats2jspre_intrange_patsfun_11__closurerize(arg0);
  return tmpret14;
} // end-of-function


function
_ats2jspre_intrange_patsfun_11(env0, arg0)
{
//
// knd = 0
  var tmpret15
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_intrange_patsfun_11
  tmpret15 = ats2jspre_int_forall_cloref(env0, arg0);
  return tmpret15;
} // end-of-function


function
ats2jspre_int_foreach_method(arg0)
{
//
// knd = 0
  var tmpret16
  var tmplab, tmplab_js
//
  // __patsflab_int_foreach_method
  tmpret16 = _ats2jspre_intrange_patsfun_13__closurerize(arg0);
  return tmpret16;
} // end-of-function


function
_ats2jspre_intrange_patsfun_13(env0, arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_intrange_patsfun_13
  ats2jspre_int_foreach_cloref(env0, arg0);
  return/*_void*/;
} // end-of-function


function
ats2jspre_int_foldleft_cloref(arg0, arg1, arg2)
{
//
// knd = 0
  var tmpret18
  var tmplab, tmplab_js
//
  // __patsflab_int_foldleft_cloref
  tmpret18 = ats2jspre_intrange_foldleft_cloref(0, arg0, arg1, arg2);
  return tmpret18;
} // end-of-function


function
ats2jspre_int_foldleft_method(arg0, arg1)
{
//
// knd = 0
  var tmpret19
  var tmplab, tmplab_js
//
  // __patsflab_int_foldleft_method
  tmpret19 = _ats2jspre_intrange_patsfun_16__closurerize(arg0, arg1);
  return tmpret19;
} // end-of-function


function
_ats2jspre_intrange_patsfun_16(env0, env1, arg0)
{
//
// knd = 0
  var tmpret20
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_intrange_patsfun_16
  tmpret20 = ats2jspre_int_foldleft_cloref(env0, env1, arg0);
  return tmpret20;
} // end-of-function


function
ats2jspre_int_list_map_cloref(arg0, arg1)
{
//
// knd = 0
  var tmpret21
  var tmplab, tmplab_js
//
  // __patsflab_int_list_map_cloref
  tmpret21 = _ats2jspre_intrange_aux_18(arg0, arg1, 0);
  return tmpret21;
} // end-of-function


function
_ats2jspre_intrange_aux_18(env0, env1, arg0)
{
//
// knd = 0
  var tmpret22
  var tmp23
  var tmp24
  var tmp25
  var tmp26
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_intrange_aux_18
  tmp23 = ats2jspre_lt_int1_int1(arg0, env0);
  if(tmp23) {
    tmp24 = env1[0](env1, arg0);
    tmp26 = ats2jspre_add_int1_int1(arg0, 1);
    tmp25 = _ats2jspre_intrange_aux_18(env0, env1, tmp26);
    tmpret22 = [tmp24, tmp25];
  } else {
    tmpret22 = null;
  } // endif
  return tmpret22;
} // end-of-function


function
ats2jspre_int_list_map_method(arg0, arg1)
{
//
// knd = 0
  var tmpret27
  var tmplab, tmplab_js
//
  // __patsflab_int_list_map_method
  tmpret27 = _ats2jspre_intrange_patsfun_20__closurerize(arg0);
  return tmpret27;
} // end-of-function


function
_ats2jspre_intrange_patsfun_20(env0, arg0)
{
//
// knd = 0
  var tmpret28
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_intrange_patsfun_20
  tmpret28 = ats2jspre_int_list_map_cloref(env0, arg0);
  return tmpret28;
} // end-of-function


function
ats2jspre_int_list0_map_cloref(arg0, arg1)
{
//
// knd = 0
  var tmpret29
  var tmp30
  var tmp31
  var tmplab, tmplab_js
//
  // __patsflab_int_list0_map_cloref
  tmp30 = ats2jspre_gte_int1_int1(arg0, 0);
  if(tmp30) {
    tmp31 = ats2jspre_int_list_map_cloref(arg0, arg1);
    tmpret29 = tmp31;
  } else {
    tmpret29 = null;
  } // endif
  return tmpret29;
} // end-of-function


function
ats2jspre_int_list0_map_method(arg0, arg1)
{
//
// knd = 0
  var tmpret32
  var tmplab, tmplab_js
//
  // __patsflab_int_list0_map_method
  tmpret32 = _ats2jspre_intrange_patsfun_23__closurerize(arg0);
  return tmpret32;
} // end-of-function


function
_ats2jspre_intrange_patsfun_23(env0, arg0)
{
//
// knd = 0
  var tmpret33
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_intrange_patsfun_23
  tmpret33 = ats2jspre_int_list0_map_cloref(env0, arg0);
  return tmpret33;
} // end-of-function


function
ats2jspre_int_stream_map_cloref(arg0, arg1)
{
//
// knd = 0
  var tmpret34
  var tmplab, tmplab_js
//
  // __patsflab_int_stream_map_cloref
  tmpret34 = _ats2jspre_intrange_aux_25(arg0, arg1, 0);
  return tmpret34;
} // end-of-function


function
_ats2jspre_intrange_aux_25(env0, env1, arg0)
{
//
// knd = 0
  var tmpret35
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_intrange_aux_25
  tmpret35 = ATSPMVlazyval(_ats2jspre_intrange_patsfun_26__closurerize(env0, env1, arg0));
  return tmpret35;
} // end-of-function


function
_ats2jspre_intrange_patsfun_26(env0, env1, env2)
{
//
// knd = 0
  var tmpret36
  var tmp37
  var tmp38
  var tmp39
  var tmp40
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_intrange_patsfun_26
  tmp37 = ats2jspre_lt_int1_int1(env2, env0);
  if(tmp37) {
    tmp38 = env1[0](env1, env2);
    tmp40 = ats2jspre_add_int1_int1(env2, 1);
    tmp39 = _ats2jspre_intrange_aux_25(env0, env1, tmp40);
    tmpret36 = [tmp38, tmp39];
  } else {
    tmpret36 = null;
  } // endif
  return tmpret36;
} // end-of-function


function
ats2jspre_int_stream_map_method(arg0, arg1)
{
//
// knd = 0
  var tmpret41
  var tmplab, tmplab_js
//
  // __patsflab_int_stream_map_method
  tmpret41 = _ats2jspre_intrange_patsfun_28__closurerize(arg0);
  return tmpret41;
} // end-of-function


function
_ats2jspre_intrange_patsfun_28(env0, arg0)
{
//
// knd = 0
  var tmpret42
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_intrange_patsfun_28
  tmpret42 = ats2jspre_int_stream_map_cloref(env0, arg0);
  return tmpret42;
} // end-of-function


function
ats2jspre_int_stream_vt_map_cloref(arg0, arg1)
{
//
// knd = 0
  var tmpret43
  var tmplab, tmplab_js
//
  // __patsflab_int_stream_vt_map_cloref
  tmpret43 = _ats2jspre_intrange_aux_30(arg0, arg1, 0);
  return tmpret43;
} // end-of-function


function
_ats2jspre_intrange_aux_30(env0, env1, arg0)
{
//
// knd = 0
  var tmpret44
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_intrange_aux_30
  tmpret44 = ATSPMVllazyval(_ats2jspre_intrange_patsfun_31__closurerize(env0, env1, arg0));
  return tmpret44;
} // end-of-function


function
_ats2jspre_intrange_patsfun_31(env0, env1, env2, arg0)
{
//
// knd = 0
  var tmpret45
  var tmp46
  var tmp47
  var tmp48
  var tmp49
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_intrange_patsfun_31
  if(arg0) {
    tmp46 = ats2jspre_lt_int1_int1(env2, env0);
    if(tmp46) {
      tmp47 = env1[0](env1, env2);
      tmp49 = ats2jspre_add_int1_int1(env2, 1);
      tmp48 = _ats2jspre_intrange_aux_30(env0, env1, tmp49);
      tmpret45 = [tmp47, tmp48];
    } else {
      tmpret45 = null;
    } // endif
  } else {
  } // endif
  return tmpret45;
} // end-of-function


function
ats2jspre_int_stream_vt_map_method(arg0, arg1)
{
//
// knd = 0
  var tmpret50
  var tmplab, tmplab_js
//
  // __patsflab_int_stream_vt_map_method
  tmpret50 = _ats2jspre_intrange_patsfun_33__closurerize(arg0);
  return tmpret50;
} // end-of-function


function
_ats2jspre_intrange_patsfun_33(env0, arg0)
{
//
// knd = 0
  var tmpret51
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_intrange_patsfun_33
  tmpret51 = ats2jspre_int_stream_vt_map_cloref(env0, arg0);
  return tmpret51;
} // end-of-function


function
ats2jspre_int2_exists_cloref(arg0, arg1, arg2)
{
//
// knd = 0
  var tmpret52
  var tmplab, tmplab_js
//
  // __patsflab_int2_exists_cloref
  tmpret52 = ats2jspre_intrange2_exists_cloref(0, arg0, 0, arg1, arg2);
  return tmpret52;
} // end-of-function


function
ats2jspre_int2_forall_cloref(arg0, arg1, arg2)
{
//
// knd = 0
  var tmpret53
  var tmplab, tmplab_js
//
  // __patsflab_int2_forall_cloref
  tmpret53 = ats2jspre_intrange2_forall_cloref(0, arg0, 0, arg1, arg2);
  return tmpret53;
} // end-of-function


function
ats2jspre_int2_foreach_cloref(arg0, arg1, arg2)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_int2_foreach_cloref
  ats2jspre_intrange2_foreach_cloref(0, arg0, 0, arg1, arg2);
  return/*_void*/;
} // end-of-function


function
ats2jspre_intrange_exists_cloref(arg0, arg1, arg2)
{
//
// knd = 0
  var tmpret55
  var tmplab, tmplab_js
//
  // __patsflab_intrange_exists_cloref
  tmpret55 = _ats2jspre_intrange_loop_38(arg0, arg1, arg2);
  return tmpret55;
} // end-of-function


function
_ats2jspre_intrange_loop_38(arg0, arg1, arg2)
{
//
// knd = 1
  var apy0
  var apy1
  var apy2
  var tmpret56
  var tmp57
  var tmp58
  var tmp59
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_intrange_loop_38
    tmp57 = ats2jspre_lt_int0_int0(arg0, arg1);
    if(tmp57) {
      tmp58 = arg2[0](arg2, arg0);
      if(tmp58) {
        tmpret56 = true;
      } else {
        tmp59 = ats2jspre_add_int0_int0(arg0, 1);
        // ATStailcalseq_beg
        apy0 = tmp59;
        apy1 = arg1;
        apy2 = arg2;
        arg0 = apy0;
        arg1 = apy1;
        arg2 = apy2;
        funlab_js = 1; // __patsflab__ats2jspre_intrange_loop_38
        // ATStailcalseq_end
      } // endif
    } else {
      tmpret56 = false;
    } // endif
    if (funlab_js > 0) continue; else return tmpret56;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_intrange_exists_method(arg0)
{
//
// knd = 0
  var tmpret60
  var tmplab, tmplab_js
//
  // __patsflab_intrange_exists_method
  tmpret60 = _ats2jspre_intrange_patsfun_40__closurerize(arg0);
  return tmpret60;
} // end-of-function


function
_ats2jspre_intrange_patsfun_40(env0, arg0)
{
//
// knd = 0
  var tmpret61
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_intrange_patsfun_40
  tmpret61 = ats2jspre_intrange_exists_cloref(env0[0], env0[1], arg0);
  return tmpret61;
} // end-of-function


function
ats2jspre_intrange_forall_cloref(arg0, arg1, arg2)
{
//
// knd = 0
  var tmpret62
  var tmplab, tmplab_js
//
  // __patsflab_intrange_forall_cloref
  tmpret62 = _ats2jspre_intrange_loop_42(arg0, arg1, arg2);
  return tmpret62;
} // end-of-function


function
_ats2jspre_intrange_loop_42(arg0, arg1, arg2)
{
//
// knd = 1
  var apy0
  var apy1
  var apy2
  var tmpret63
  var tmp64
  var tmp65
  var tmp66
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_intrange_loop_42
    tmp64 = ats2jspre_lt_int0_int0(arg0, arg1);
    if(tmp64) {
      tmp65 = arg2[0](arg2, arg0);
      if(tmp65) {
        tmp66 = ats2jspre_add_int0_int0(arg0, 1);
        // ATStailcalseq_beg
        apy0 = tmp66;
        apy1 = arg1;
        apy2 = arg2;
        arg0 = apy0;
        arg1 = apy1;
        arg2 = apy2;
        funlab_js = 1; // __patsflab__ats2jspre_intrange_loop_42
        // ATStailcalseq_end
      } else {
        tmpret63 = false;
      } // endif
    } else {
      tmpret63 = true;
    } // endif
    if (funlab_js > 0) continue; else return tmpret63;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_intrange_forall_method(arg0)
{
//
// knd = 0
  var tmpret67
  var tmplab, tmplab_js
//
  // __patsflab_intrange_forall_method
  tmpret67 = _ats2jspre_intrange_patsfun_44__closurerize(arg0);
  return tmpret67;
} // end-of-function


function
_ats2jspre_intrange_patsfun_44(env0, arg0)
{
//
// knd = 0
  var tmpret68
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_intrange_patsfun_44
  tmpret68 = ats2jspre_intrange_forall_cloref(env0[0], env0[1], arg0);
  return tmpret68;
} // end-of-function


function
ats2jspre_intrange_foreach_cloref(arg0, arg1, arg2)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_intrange_foreach_cloref
  _ats2jspre_intrange_loop_46(arg0, arg1, arg2);
  return/*_void*/;
} // end-of-function


function
_ats2jspre_intrange_loop_46(arg0, arg1, arg2)
{
//
// knd = 1
  var apy0
  var apy1
  var apy2
  var tmp71
  var tmp73
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_intrange_loop_46
    tmp71 = ats2jspre_lt_int0_int0(arg0, arg1);
    if(tmp71) {
      arg2[0](arg2, arg0);
      tmp73 = ats2jspre_add_int0_int0(arg0, 1);
      // ATStailcalseq_beg
      apy0 = tmp73;
      apy1 = arg1;
      apy2 = arg2;
      arg0 = apy0;
      arg1 = apy1;
      arg2 = apy2;
      funlab_js = 1; // __patsflab__ats2jspre_intrange_loop_46
      // ATStailcalseq_end
    } else {
      // ATSINSmove_void
    } // endif
    if (funlab_js > 0) continue; else return/*_void*/;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_intrange_foreach_method(arg0)
{
//
// knd = 0
  var tmpret74
  var tmplab, tmplab_js
//
  // __patsflab_intrange_foreach_method
  tmpret74 = _ats2jspre_intrange_patsfun_48__closurerize(arg0);
  return tmpret74;
} // end-of-function


function
_ats2jspre_intrange_patsfun_48(env0, arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_intrange_patsfun_48
  ats2jspre_intrange_foreach_cloref(env0[0], env0[1], arg0);
  return/*_void*/;
} // end-of-function


function
ats2jspre_intrange_foldleft_cloref(arg0, arg1, arg2, arg3)
{
//
// knd = 0
  var tmpret76
  var tmplab, tmplab_js
//
  // __patsflab_intrange_foldleft_cloref
  tmpret76 = _ats2jspre_intrange_loop_50(arg3, arg0, arg1, arg2, arg3);
  return tmpret76;
} // end-of-function


function
_ats2jspre_intrange_loop_50(env0, arg0, arg1, arg2, arg3)
{
//
// knd = 1
  var apy0
  var apy1
  var apy2
  var apy3
  var tmpret77
  var tmp78
  var tmp79
  var tmp80
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_intrange_loop_50
    tmp78 = ats2jspre_lt_int0_int0(arg0, arg1);
    if(tmp78) {
      tmp79 = ats2jspre_add_int0_int0(arg0, 1);
      tmp80 = arg3[0](arg3, arg2, arg0);
      // ATStailcalseq_beg
      apy0 = tmp79;
      apy1 = arg1;
      apy2 = tmp80;
      apy3 = env0;
      arg0 = apy0;
      arg1 = apy1;
      arg2 = apy2;
      arg3 = apy3;
      funlab_js = 1; // __patsflab__ats2jspre_intrange_loop_50
      // ATStailcalseq_end
    } else {
      tmpret77 = arg2;
    } // endif
    if (funlab_js > 0) continue; else return tmpret77;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_intrange_foldleft_method(arg0, arg1)
{
//
// knd = 0
  var tmp81
  var tmp82
  var tmpret83
  var tmplab, tmplab_js
//
  // __patsflab_intrange_foldleft_method
  tmp81 = arg0[0];
  tmp82 = arg0[1];
  tmpret83 = _ats2jspre_intrange_patsfun_52__closurerize(tmp81, tmp82, arg1);
  return tmpret83;
} // end-of-function


function
_ats2jspre_intrange_patsfun_52(env0, env1, env2, arg0)
{
//
// knd = 0
  var tmpret84
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_intrange_patsfun_52
  tmpret84 = ats2jspre_intrange_foldleft_cloref(env0, env1, env2, arg0);
  return tmpret84;
} // end-of-function


function
ats2jspre_intrange2_exists_cloref(arg0, arg1, arg2, arg3, arg4)
{
//
// knd = 0
  var tmpret85
  var tmplab, tmplab_js
//
  // __patsflab_intrange2_exists_cloref
  tmpret85 = _ats2jspre_intrange_loop1_54(arg2, arg3, arg4, arg0, arg1, arg2, arg3, arg4);
  return tmpret85;
} // end-of-function


function
_ats2jspre_intrange_loop1_54(env0, env1, env2, arg0, arg1, arg2, arg3, arg4)
{
//
// knd = 2
  var apy0
  var apy1
  var apy2
  var apy3
  var apy4
  var tmpret86
  var tmp87
  var a2rg0
  var a2rg1
  var a2rg2
  var a2rg3
  var a2rg4
  var a2py0
  var a2py1
  var a2py2
  var a2py3
  var a2py4
  var tmpret88
  var tmp89
  var tmp90
  var tmp91
  var tmp92
  var funlab_js
  var tmplab, tmplab_js
//
  funlab_js = 1;
  while(true) {
    switch(funlab_js) {
      case 1: {
        funlab_js = 0;
        tmp87 = ats2jspre_lt_int0_int0(arg0, arg1);
        if(tmp87) {
          // ATStailcalseq_beg
          a2py0 = arg0;
          a2py1 = arg1;
          a2py2 = arg2;
          a2py3 = arg3;
          a2py4 = env2;
          a2rg0 = a2py0;
          a2rg1 = a2py1;
          a2rg2 = a2py2;
          a2rg3 = a2py3;
          a2rg4 = a2py4;
          funlab_js = 2; // __patsflab__ats2jspre_intrange_loop2_55
          // ATStailcalseq_end
        } else {
          tmpret86 = false;
        } // endif
        if (funlab_js > 0) continue; else return tmpret86;
      } // end-of-case
      case 2: {
        funlab_js = 0;
        tmp89 = ats2jspre_lt_int0_int0(a2rg2, a2rg3);
        if(tmp89) {
          tmp90 = a2rg4[0](a2rg4, a2rg0, a2rg2);
          if(tmp90) {
            tmpret88 = true;
          } else {
            tmp91 = ats2jspre_add_int0_int0(a2rg2, 1);
            // ATStailcalseq_beg
            a2py0 = a2rg0;
            a2py1 = a2rg1;
            a2py2 = tmp91;
            a2py3 = a2rg3;
            a2py4 = a2rg4;
            a2rg0 = a2py0;
            a2rg1 = a2py1;
            a2rg2 = a2py2;
            a2rg3 = a2py3;
            a2rg4 = a2py4;
            funlab_js = 2; // __patsflab__ats2jspre_intrange_loop2_55
            // ATStailcalseq_end
          } // endif
        } else {
          tmp92 = ats2jspre_add_int0_int0(a2rg0, 1);
          // ATStailcalseq_beg
          apy0 = tmp92;
          apy1 = a2rg1;
          apy2 = env0;
          apy3 = env1;
          apy4 = a2rg4;
          arg0 = apy0;
          arg1 = apy1;
          arg2 = apy2;
          arg3 = apy3;
          arg4 = apy4;
          funlab_js = 1; // __patsflab__ats2jspre_intrange_loop1_54
          // ATStailcalseq_end
        } // endif
        if (funlab_js > 0) continue; else return tmpret88;
      } // end-of-case
    } // end-of-switch
  } // endwhile-fun
} // end-of-function


function
ats2jspre_intrange2_forall_cloref(arg0, arg1, arg2, arg3, arg4)
{
//
// knd = 0
  var tmpret93
  var tmplab, tmplab_js
//
  // __patsflab_intrange2_forall_cloref
  tmpret93 = _ats2jspre_intrange_loop1_57(arg2, arg3, arg0, arg1, arg2, arg3, arg4);
  return tmpret93;
} // end-of-function


function
_ats2jspre_intrange_loop1_57(env0, env1, arg0, arg1, arg2, arg3, arg4)
{
//
// knd = 2
  var apy0
  var apy1
  var apy2
  var apy3
  var apy4
  var tmpret94
  var tmp95
  var a2rg0
  var a2rg1
  var a2rg2
  var a2rg3
  var a2rg4
  var a2py0
  var a2py1
  var a2py2
  var a2py3
  var a2py4
  var tmpret96
  var tmp97
  var tmp98
  var tmp99
  var tmp100
  var funlab_js
  var tmplab, tmplab_js
//
  funlab_js = 1;
  while(true) {
    switch(funlab_js) {
      case 1: {
        funlab_js = 0;
        tmp95 = ats2jspre_lt_int0_int0(arg0, arg1);
        if(tmp95) {
          // ATStailcalseq_beg
          a2py0 = arg0;
          a2py1 = arg1;
          a2py2 = arg2;
          a2py3 = arg3;
          a2py4 = arg4;
          a2rg0 = a2py0;
          a2rg1 = a2py1;
          a2rg2 = a2py2;
          a2rg3 = a2py3;
          a2rg4 = a2py4;
          funlab_js = 2; // __patsflab__ats2jspre_intrange_loop2_58
          // ATStailcalseq_end
        } else {
          tmpret94 = true;
        } // endif
        if (funlab_js > 0) continue; else return tmpret94;
      } // end-of-case
      case 2: {
        funlab_js = 0;
        tmp97 = ats2jspre_lt_int0_int0(a2rg2, a2rg3);
        if(tmp97) {
          tmp98 = a2rg4[0](a2rg4, a2rg0, a2rg2);
          if(tmp98) {
            tmp99 = ats2jspre_add_int0_int0(a2rg2, 1);
            // ATStailcalseq_beg
            a2py0 = a2rg0;
            a2py1 = a2rg1;
            a2py2 = tmp99;
            a2py3 = a2rg3;
            a2py4 = a2rg4;
            a2rg0 = a2py0;
            a2rg1 = a2py1;
            a2rg2 = a2py2;
            a2rg3 = a2py3;
            a2rg4 = a2py4;
            funlab_js = 2; // __patsflab__ats2jspre_intrange_loop2_58
            // ATStailcalseq_end
          } else {
            tmpret96 = false;
          } // endif
        } else {
          tmp100 = ats2jspre_add_int0_int0(a2rg0, 1);
          // ATStailcalseq_beg
          apy0 = tmp100;
          apy1 = a2rg1;
          apy2 = env0;
          apy3 = env1;
          apy4 = a2rg4;
          arg0 = apy0;
          arg1 = apy1;
          arg2 = apy2;
          arg3 = apy3;
          arg4 = apy4;
          funlab_js = 1; // __patsflab__ats2jspre_intrange_loop1_57
          // ATStailcalseq_end
        } // endif
        if (funlab_js > 0) continue; else return tmpret96;
      } // end-of-case
    } // end-of-switch
  } // endwhile-fun
} // end-of-function


function
ats2jspre_intrange2_foreach_cloref(arg0, arg1, arg2, arg3, arg4)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_intrange2_foreach_cloref
  _ats2jspre_intrange_loop1_60(arg2, arg3, arg0, arg1, arg2, arg3, arg4);
  return/*_void*/;
} // end-of-function


function
_ats2jspre_intrange_loop1_60(env0, env1, arg0, arg1, arg2, arg3, arg4)
{
//
// knd = 2
  var apy0
  var apy1
  var apy2
  var apy3
  var apy4
  var tmp103
  var a2rg0
  var a2rg1
  var a2rg2
  var a2rg3
  var a2rg4
  var a2py0
  var a2py1
  var a2py2
  var a2py3
  var a2py4
  var tmp105
  var tmp107
  var tmp108
  var funlab_js
  var tmplab, tmplab_js
//
  funlab_js = 1;
  while(true) {
    switch(funlab_js) {
      case 1: {
        funlab_js = 0;
        tmp103 = ats2jspre_lt_int0_int0(arg0, arg1);
        if(tmp103) {
          // ATStailcalseq_beg
          a2py0 = arg0;
          a2py1 = arg1;
          a2py2 = arg2;
          a2py3 = arg3;
          a2py4 = arg4;
          a2rg0 = a2py0;
          a2rg1 = a2py1;
          a2rg2 = a2py2;
          a2rg3 = a2py3;
          a2rg4 = a2py4;
          funlab_js = 2; // __patsflab__ats2jspre_intrange_loop2_61
          // ATStailcalseq_end
        } else {
          // ATSINSmove_void
        } // endif
        if (funlab_js > 0) continue; else return/*_void*/;
      } // end-of-case
      case 2: {
        funlab_js = 0;
        tmp105 = ats2jspre_lt_int0_int0(a2rg2, a2rg3);
        if(tmp105) {
          a2rg4[0](a2rg4, a2rg0, a2rg2);
          tmp107 = ats2jspre_add_int0_int0(a2rg2, 1);
          // ATStailcalseq_beg
          a2py0 = a2rg0;
          a2py1 = a2rg1;
          a2py2 = tmp107;
          a2py3 = a2rg3;
          a2py4 = a2rg4;
          a2rg0 = a2py0;
          a2rg1 = a2py1;
          a2rg2 = a2py2;
          a2rg3 = a2py3;
          a2rg4 = a2py4;
          funlab_js = 2; // __patsflab__ats2jspre_intrange_loop2_61
          // ATStailcalseq_end
        } else {
          tmp108 = ats2jspre_succ_int0(a2rg0);
          // ATStailcalseq_beg
          apy0 = tmp108;
          apy1 = a2rg1;
          apy2 = env0;
          apy3 = env1;
          apy4 = a2rg4;
          arg0 = apy0;
          arg1 = apy1;
          arg2 = apy2;
          arg3 = apy3;
          arg4 = apy4;
          funlab_js = 1; // __patsflab__ats2jspre_intrange_loop1_60
          // ATStailcalseq_end
        } // endif
        if (funlab_js > 0) continue; else return/*_void*/;
      } // end-of-case
    } // end-of-switch
  } // endwhile-fun
} // end-of-function


/* ****** ****** */

/* end-of-compilation-unit */
/*
**
** The JavaScript code is generated by atscc2js
** The starting compilation time is: 2016-12-25: 17h:42m
**
*/

function
ats2jspre_JSarray_make_list(arg0)
{
//
// knd = 0
  var tmpret0
  var tmp5
  var tmplab, tmplab_js
//
  // __patsflab_JSarray_make_list
  tmp5 = ats2jspre_JSarray_nil();
  _ats2jspre_JSarray_loop_1(tmp5, arg0);
  tmpret0 = tmp5;
  return tmpret0;
} // end-of-function


function
_ats2jspre_JSarray_loop_1(arg0, arg1)
{
//
// knd = 1
  var apy0
  var apy1
  var tmp2
  var tmp3
  var tmp4
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_JSarray_loop_1
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab0
        if(ATSCKptriscons(arg1)) { tmplab_js = 4; break; }
        case 2: // __atstmplab1
        // ATSINSmove_void
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab2
        case 4: // __atstmplab3
        tmp2 = arg1[0];
        tmp3 = arg1[1];
        tmp4 = ats2jspre_JSarray_push(arg0, tmp2);
        // ATStailcalseq_beg
        apy0 = arg0;
        apy1 = tmp3;
        arg0 = apy0;
        arg1 = apy1;
        funlab_js = 1; // __patsflab__ats2jspre_JSarray_loop_1
        // ATStailcalseq_end
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
    if (funlab_js > 0) continue; else return/*_void*/;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_JSarray_make_list_vt(arg0)
{
//
// knd = 0
  var tmpret7
  var tmp12
  var tmplab, tmplab_js
//
  // __patsflab_JSarray_make_list_vt
  tmp12 = ats2jspre_JSarray_nil();
  _ats2jspre_JSarray_loop_3(tmp12, arg0);
  tmpret7 = tmp12;
  return tmpret7;
} // end-of-function


function
_ats2jspre_JSarray_loop_3(arg0, arg1)
{
//
// knd = 1
  var apy0
  var apy1
  var tmp9
  var tmp10
  var tmp11
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_JSarray_loop_3
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab4
        if(ATSCKptriscons(arg1)) { tmplab_js = 4; break; }
        case 2: // __atstmplab5
        // ATSINSmove_void
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab6
        case 4: // __atstmplab7
        tmp9 = arg1[0];
        tmp10 = arg1[1];
        // ATSINSfreecon(arg1);
        tmp11 = ats2jspre_JSarray_push(arg0, tmp9);
        // ATStailcalseq_beg
        apy0 = arg0;
        apy1 = tmp10;
        arg0 = apy0;
        arg1 = apy1;
        funlab_js = 1; // __patsflab__ats2jspre_JSarray_loop_3
        // ATStailcalseq_end
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
    if (funlab_js > 0) continue; else return/*_void*/;
  } // endwhile-fun
} // end-of-function


function
_057_Users_057_RyanKing_057_ATS2_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_JSarray_056_sats__JSarray_tabulate_cloref(arg0, arg1)
{
//
// knd = 0
  var tmpret14
  var tmp15
  var tmplab, tmplab_js
//
  // __patsflab_JSarray_tabulate_cloref
  tmp15 = ats2jspre_JSarray_nil();
  _ats2jspre_JSarray_loop_5(arg0, arg1, tmp15, 0);
  tmpret14 = tmp15;
  return tmpret14;
} // end-of-function


function
_ats2jspre_JSarray_loop_5(env0, env1, env2, arg0)
{
//
// knd = 1
  var apy0
  var tmp17
  var tmp18
  var tmp19
  var tmp20
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_JSarray_loop_5
    tmp17 = ats2jspre_lt_int1_int1(arg0, env0);
    if(tmp17) {
      tmp19 = env1[0](env1, arg0);
      tmp18 = ats2jspre_JSarray_push(env2, tmp19);
      tmp20 = ats2jspre_add_int1_int1(arg0, 1);
      // ATStailcalseq_beg
      apy0 = tmp20;
      arg0 = apy0;
      funlab_js = 1; // __patsflab__ats2jspre_JSarray_loop_5
      // ATStailcalseq_end
    } else {
      // ATSINSmove_void
    } // endif
    if (funlab_js > 0) continue; else return/*_void*/;
  } // endwhile-fun
} // end-of-function


/* ****** ****** */

/* end-of-compilation-unit */
/*
**
** The JavaScript code is generated by atscc2js
** The starting compilation time is: 2016-12-25: 17h:42m
**
*/

function
ats2jspre_ref(arg0)
{
//
// knd = 0
  var tmpret0
  var tmplab, tmplab_js
//
  // __patsflab_ref
  tmpret0 = ats2jspre_ref_make_elt(arg0);
  return tmpret0;
} // end-of-function


function
ats2jspre_ref_make_elt(arg0)
{
//
// knd = 0
  var tmpret1
  var tmp2
  var tmplab, tmplab_js
//
  // __patsflab_ref_make_elt
  tmp2 = ats2jspre_JSarray_sing(arg0);
  tmpret1 = tmp2;
  return tmpret1;
} // end-of-function


function
ats2jspre_ref_get_elt(arg0)
{
//
// knd = 0
  var tmpret3
  var tmplab, tmplab_js
//
  // __patsflab_ref_get_elt
  tmpret3 = ats2jspre_JSarray_get_at(arg0, 0);
  return tmpret3;
} // end-of-function


function
ats2jspre_ref_set_elt(arg0, arg1)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_ref_set_elt
  ats2jspre_JSarray_set_at(arg0, 0, arg1);
  return/*_void*/;
} // end-of-function


function
ats2jspre_ref_exch_elt(arg0, arg1)
{
//
// knd = 0
  var tmpret5
  var tmp6
  var tmplab, tmplab_js
//
  // __patsflab_ref_exch_elt
  tmp6 = ats2jspre_JSarray_get_at(arg0, 0);
  ats2jspre_JSarray_set_at(arg0, 0, arg1);
  tmpret5 = tmp6;
  return tmpret5;
} // end-of-function


/* ****** ****** */

/* end-of-compilation-unit */
/*
**
** The JavaScript code is generated by atscc2js
** The starting compilation time is: 2016-12-25: 17h:42m
**
*/

/* ATSextcode_beg() */
//
function
ats2jspre_arrayref_make_elt
  (n, x)
{
  var A, i;
  A = new Array(n);
  for (i = 0; i < n; i += 1) A[i] = x;
  return A;
}
//
/* ATSextcode_end() */

function
_ats2jspre_arrayref_patsfun_8__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_arrayref_patsfun_8(cenv[1], arg0); }, env0];
}


function
ats2jspre_arrayref_exists_cloref(arg0, arg1, arg2)
{
//
// knd = 0
  var tmpret0
  var tmplab, tmplab_js
//
  // __patsflab_arrayref_exists_cloref
  tmpret0 = ats2jspre_int_exists_cloref(arg1, arg2);
  return tmpret0;
} // end-of-function


function
ats2jspre_arrayref_forall_cloref(arg0, arg1, arg2)
{
//
// knd = 0
  var tmpret1
  var tmplab, tmplab_js
//
  // __patsflab_arrayref_forall_cloref
  tmpret1 = ats2jspre_int_forall_cloref(arg1, arg2);
  return tmpret1;
} // end-of-function


function
ats2jspre_arrayref_foreach_cloref(arg0, arg1, arg2)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_arrayref_foreach_cloref
  ats2jspre_int_foreach_cloref(arg1, arg2);
  return/*_void*/;
} // end-of-function


function
ats2jspre_arrszref_make_elt(arg0, arg1)
{
//
// knd = 0
  var tmpret3
  var tmp4
  var tmplab, tmplab_js
//
  // __patsflab_arrszref_make_elt
  tmp4 = ats2jspre_arrayref_make_elt(arg0, arg1);
  tmpret3 = ats2jspre_arrszref_make_arrayref(tmp4, arg0);
  return tmpret3;
} // end-of-function


function
ats2jspre_arrszref_exists_cloref(arg0, arg1)
{
//
// knd = 0
  var tmpret5
  var tmp6
  var tmplab, tmplab_js
//
  // __patsflab_arrszref_exists_cloref
  tmp6 = ats2jspre_arrszref_size(arg0);
  tmpret5 = ats2jspre_int_exists_cloref(tmp6, arg1);
  return tmpret5;
} // end-of-function


function
ats2jspre_arrszref_forall_cloref(arg0, arg1)
{
//
// knd = 0
  var tmpret7
  var tmp8
  var tmplab, tmplab_js
//
  // __patsflab_arrszref_forall_cloref
  tmp8 = ats2jspre_arrszref_size(arg0);
  tmpret7 = ats2jspre_int_forall_cloref(tmp8, arg1);
  return tmpret7;
} // end-of-function


function
ats2jspre_arrszref_foreach_cloref(arg0, arg1)
{
//
// knd = 0
  var tmp10
  var tmplab, tmplab_js
//
  // __patsflab_arrszref_foreach_cloref
  tmp10 = ats2jspre_arrszref_size(arg0);
  ats2jspre_int_foreach_cloref(tmp10, arg1);
  return/*_void*/;
} // end-of-function


function
ats2jspre_arrszref_foreach_method(arg0)
{
//
// knd = 0
  var tmpret11
  var tmplab, tmplab_js
//
  // __patsflab_arrszref_foreach_method
  tmpret11 = _ats2jspre_arrayref_patsfun_8__closurerize(arg0);
  return tmpret11;
} // end-of-function


function
_ats2jspre_arrayref_patsfun_8(env0, arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_arrayref_patsfun_8
  ats2jspre_arrszref_foreach_cloref(env0, arg0);
  return/*_void*/;
} // end-of-function


function
ats2jspre_arrayref_get_at(arg0, arg1)
{
//
// knd = 0
  var tmpret13
  var tmplab, tmplab_js
//
  // __patsflab_arrayref_get_at
  tmpret13 = ats2jspre_JSarray_get_at(arg0, arg1);
  return tmpret13;
} // end-of-function


function
ats2jspre_arrayref_set_at(arg0, arg1, arg2)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_arrayref_set_at
  ats2jspre_JSarray_set_at(arg0, arg1, arg2);
  return/*_void*/;
} // end-of-function


function
ats2jspre_arrszref_make_arrayref(arg0, arg1)
{
//
// knd = 0
  var tmpret15
  var tmplab, tmplab_js
//
  // __patsflab_arrszref_make_arrayref
  tmpret15 = arg0;
  return tmpret15;
} // end-of-function


function
ats2jspre_arrszref_size(arg0)
{
//
// knd = 0
  var tmpret16
  var tmp17
  var tmplab, tmplab_js
//
  // __patsflab_arrszref_size
  tmp17 = ats2jspre_JSarray_length(arg0);
  tmpret16 = tmp17;
  return tmpret16;
} // end-of-function


function
ats2jspre_arrszref_get_at(arg0, arg1)
{
//
// knd = 0
  var tmpret18
  var tmplab, tmplab_js
//
  // __patsflab_arrszref_get_at
  tmpret18 = ats2jspre_JSarray_get_at(arg0, arg1);
  return tmpret18;
} // end-of-function


function
ats2jspre_arrszref_set_at(arg0, arg1, arg2)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_arrszref_set_at
  ats2jspre_JSarray_set_at(arg0, arg1, arg2);
  return/*_void*/;
} // end-of-function


/* ****** ****** */

/* end-of-compilation-unit */
/*
**
** The JavaScript code is generated by atscc2js
** The starting compilation time is: 2016-12-25: 17h:42m
**
*/

/* ATSextcode_beg() */
//
function
ats2jspre_matrixref_make_elt
  (m, n, x)
{
  var A, i, j;
  A = new Array(m*n);
  for (i = 0; i < m; i += 1)
  {
    for (j = 0; j < n; j += 1) A[i*n+j] = x;
  }
  return A;
}
//
/* ATSextcode_end() */

/* ATSextcode_beg() */
//
function
ats2jspre_mtrxszref_make_matrixref
  (M, m, n)
{
  return { matrix: M, nrow: m, ncol: n };
}
//
function
ats2jspre_mtrxszref_get_nrow(MSZ) { return MSZ.nrow; }
function
ats2jspre_mtrxszref_get_ncol(MSZ) { return MSZ.ncol; }
//
function
ats2jspre_mtrxszref_get_at
  (MSZ, i, j)
{
  var nrow = MSZ.nrow;
  var ncol = MSZ.ncol;
  if (i < 0) throw new RangeError("mtrxszref_get_at");
  if (j < 0) throw new RangeError("mtrxszref_get_at");
  if (i >= nrow) throw new RangeError("mtrxszref_get_at");
  if (j >= ncol) throw new RangeError("mtrxszref_get_at");
  return MSZ.matrix[i*ncol+j];
}
//
function
ats2jspre_mtrxszref_set_at
  (MSZ, i, j, x0)
{
  var nrow = MSZ.nrow;
  var ncol = MSZ.ncol;
  if (i < 0) throw new RangeError("mtrxszref_set_at");
  if (j < 0) throw new RangeError("mtrxszref_set_at");
  if (i >= nrow) throw new RangeError("mtrxszref_set_at");
  if (j >= ncol) throw new RangeError("mtrxszref_set_at");
  return (MSZ.matrix[i*ncol+j] = x0);
}
//
/* ATSextcode_end() */

function
_ats2jspre_matrixref_patsfun_7__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_matrixref_patsfun_7(cenv[1], arg0); }, env0];
}


function
_ats2jspre_matrixref_patsfun_9__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_matrixref_patsfun_9(cenv[1], arg0); }, env0];
}


function
_ats2jspre_matrixref_patsfun_12__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_matrixref_patsfun_12(cenv[1], arg0); }, env0];
}


function
ats2jspre_matrixref_exists_cloref(arg0, arg1, arg2, arg3)
{
//
// knd = 0
  var tmpret0
  var tmplab, tmplab_js
//
  // __patsflab_matrixref_exists_cloref
  tmpret0 = ats2jspre_int2_exists_cloref(arg1, arg2, arg3);
  return tmpret0;
} // end-of-function


function
ats2jspre_matrixref_forall_cloref(arg0, arg1, arg2, arg3)
{
//
// knd = 0
  var tmpret1
  var tmplab, tmplab_js
//
  // __patsflab_matrixref_forall_cloref
  tmpret1 = ats2jspre_int2_forall_cloref(arg1, arg2, arg3);
  return tmpret1;
} // end-of-function


function
ats2jspre_matrixref_foreach_cloref(arg0, arg1, arg2, arg3)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_matrixref_foreach_cloref
  ats2jspre_int2_foreach_cloref(arg1, arg2, arg3);
  return/*_void*/;
} // end-of-function


function
ats2jspre_mtrxszref_make_elt(arg0, arg1, arg2)
{
//
// knd = 0
  var tmpret3
  var tmp4
  var tmplab, tmplab_js
//
  // __patsflab_mtrxszref_make_elt
  tmp4 = ats2jspre_matrixref_make_elt(arg0, arg1, arg2);
  tmpret3 = ats2jspre_mtrxszref_make_matrixref(tmp4, arg0, arg1);
  return tmpret3;
} // end-of-function


function
ats2jspre_mtrxszref_exists_cloref(arg0, arg1)
{
//
// knd = 0
  var tmpret5
  var tmp6
  var tmp7
  var tmplab, tmplab_js
//
  // __patsflab_mtrxszref_exists_cloref
  tmp6 = ats2jspre_mtrxszref_get_nrow(arg0);
  tmp7 = ats2jspre_mtrxszref_get_ncol(arg0);
  tmpret5 = ats2jspre_int2_exists_cloref(tmp6, tmp7, arg1);
  return tmpret5;
} // end-of-function


function
ats2jspre_mtrxszref_forall_cloref(arg0, arg1)
{
//
// knd = 0
  var tmpret8
  var tmp9
  var tmp10
  var tmplab, tmplab_js
//
  // __patsflab_mtrxszref_forall_cloref
  tmp9 = ats2jspre_mtrxszref_get_nrow(arg0);
  tmp10 = ats2jspre_mtrxszref_get_ncol(arg0);
  tmpret8 = ats2jspre_int2_forall_cloref(tmp9, tmp10, arg1);
  return tmpret8;
} // end-of-function


function
ats2jspre_mtrxszref_exists_method(arg0)
{
//
// knd = 0
  var tmpret11
  var tmplab, tmplab_js
//
  // __patsflab_mtrxszref_exists_method
  tmpret11 = _ats2jspre_matrixref_patsfun_7__closurerize(arg0);
  return tmpret11;
} // end-of-function


function
_ats2jspre_matrixref_patsfun_7(env0, arg0)
{
//
// knd = 0
  var tmpret12
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_matrixref_patsfun_7
  tmpret12 = ats2jspre_mtrxszref_exists_cloref(env0, arg0);
  return tmpret12;
} // end-of-function


function
ats2jspre_mtrxszref_forall_method(arg0)
{
//
// knd = 0
  var tmpret13
  var tmplab, tmplab_js
//
  // __patsflab_mtrxszref_forall_method
  tmpret13 = _ats2jspre_matrixref_patsfun_9__closurerize(arg0);
  return tmpret13;
} // end-of-function


function
_ats2jspre_matrixref_patsfun_9(env0, arg0)
{
//
// knd = 0
  var tmpret14
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_matrixref_patsfun_9
  tmpret14 = ats2jspre_mtrxszref_forall_cloref(env0, arg0);
  return tmpret14;
} // end-of-function


function
ats2jspre_mtrxszref_foreach_cloref(arg0, arg1)
{
//
// knd = 0
  var tmp16
  var tmp17
  var tmplab, tmplab_js
//
  // __patsflab_mtrxszref_foreach_cloref
  tmp16 = ats2jspre_mtrxszref_get_nrow(arg0);
  tmp17 = ats2jspre_mtrxszref_get_ncol(arg0);
  ats2jspre_int2_foreach_cloref(tmp16, tmp17, arg1);
  return/*_void*/;
} // end-of-function


function
ats2jspre_mtrxszref_foreach_method(arg0)
{
//
// knd = 0
  var tmpret18
  var tmplab, tmplab_js
//
  // __patsflab_mtrxszref_foreach_method
  tmpret18 = _ats2jspre_matrixref_patsfun_12__closurerize(arg0);
  return tmpret18;
} // end-of-function


function
_ats2jspre_matrixref_patsfun_12(env0, arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_matrixref_patsfun_12
  ats2jspre_mtrxszref_foreach_cloref(env0, arg0);
  return/*_void*/;
} // end-of-function


function
ats2jspre_matrixref_get_at(arg0, arg1, arg2, arg3)
{
//
// knd = 0
  var tmpret20
  var tmp21
  var tmp22
  var tmplab, tmplab_js
//
  // __patsflab_matrixref_get_at
  tmp22 = ats2jspre_mul_int1_int1(arg1, arg2);
  tmp21 = ats2jspre_add_int1_int1(tmp22, arg3);
  tmpret20 = ats2jspre_JSarray_get_at(arg0, tmp21);
  return tmpret20;
} // end-of-function


function
ats2jspre_matrixref_set_at(arg0, arg1, arg2, arg3, arg4)
{
//
// knd = 0
  var tmp24
  var tmp25
  var tmplab, tmplab_js
//
  // __patsflab_matrixref_set_at
  tmp25 = ats2jspre_mul_int1_int1(arg1, arg2);
  tmp24 = ats2jspre_add_int1_int1(tmp25, arg3);
  ats2jspre_JSarray_set_at(arg0, tmp24, arg4);
  return/*_void*/;
} // end-of-function


/* ****** ****** */

/* end-of-compilation-unit */
/*
**
** The JavaScript code is generated by atscc2js
** The starting compilation time is: 2016-12-25: 17h:42m
**
*/

// ATSassume(ATSCC2JS_056_gmatrixref__gmatrixref)

function
ats2jspre_gmatrixref_make_matrixref(arg0, arg1, arg2)
{
//
// knd = 0
  var tmpret0
  var tmplab, tmplab_js
//
  // __patsflab_gmatrixref_make_matrixref
  tmpret0 = [arg0, arg1, arg2, 0, 0, arg1, arg2];
  return tmpret0;
} // end-of-function


function
ats2jspre_gmatrixref_make_subregion(arg0, arg1, arg2, arg3, arg4)
{
//
// knd = 0
  var tmpret1
  var tmp2
  var tmp3
  var tmplab, tmplab_js
//
  // __patsflab_gmatrixref_make_subregion
  tmp2 = ats2jspre_add_int1_int1(arg0[3], arg1);
  tmp3 = ats2jspre_add_int1_int1(arg0[4], arg2);
  tmpret1 = [arg0[0], arg0[1], arg0[2], tmp2, tmp3, arg3, arg4];
  return tmpret1;
} // end-of-function


function
ats2jspre_gmatrixref_get_at(arg0, arg1, arg2)
{
//
// knd = 0
  var tmpret4
  var tmp5
  var tmp6
  var tmplab, tmplab_js
//
  // __patsflab_gmatrixref_get_at
  tmp5 = ats2jspre_add_int1_int1(arg0[3], arg1);
  tmp6 = ats2jspre_add_int1_int1(arg0[4], arg2);
  tmpret4 = ats2jspre_matrixref_get_at(arg0[0], tmp5, arg0[2], tmp6);
  return tmpret4;
} // end-of-function


function
ats2jspre_gmatrixref_set_at(arg0, arg1, arg2, arg3)
{
//
// knd = 0
  var tmp8
  var tmp9
  var tmplab, tmplab_js
//
  // __patsflab_gmatrixref_set_at
  tmp8 = ats2jspre_add_int1_int1(arg0[3], arg1);
  tmp9 = ats2jspre_add_int1_int1(arg0[4], arg2);
  ats2jspre_matrixref_set_at(arg0[0], tmp8, arg0[2], tmp9, arg3);
  return/*_void*/;
} // end-of-function


function
ats2jspre_gmatrixref_exists_cloref(arg0, arg1)
{
//
// knd = 0
  var tmpret10
  var tmplab, tmplab_js
//
  // __patsflab_gmatrixref_exists_cloref
  tmpret10 = ats2jspre_int2_exists_cloref(arg0[3], arg0[4], arg1);
  return tmpret10;
} // end-of-function


function
ats2jspre_gmatrixref_forall_cloref(arg0, arg1)
{
//
// knd = 0
  var tmpret11
  var tmplab, tmplab_js
//
  // __patsflab_gmatrixref_forall_cloref
  tmpret11 = ats2jspre_int2_forall_cloref(arg0[3], arg0[4], arg1);
  return tmpret11;
} // end-of-function


function
ats2jspre_gmatrixref_foreach_cloref(arg0, arg1)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_gmatrixref_foreach_cloref
  ats2jspre_int2_foreach_cloref(arg0[3], arg0[4], arg1);
  return/*_void*/;
} // end-of-function


/* ****** ****** */

/* end-of-compilation-unit */
/*
**
** The JavaScript code is generated by atscc2js
** The starting compilation time is: 2016-12-25: 17h:42m
**
*/

// ATSassume(ATSCC2JS_056_qlistref__qlistref_type)

function
ats2jspre_qlistref_make_nil()
{
//
// knd = 0
  var tmpret0
  var tmp1
  var tmp2
  var tmp3
  var tmp4
  var tmplab, tmplab_js
//
  // __patsflab_qlistref_make_nil
  tmp2 = null;
  tmp1 = ats2jspre_ref(tmp2);
  tmp4 = null;
  tmp3 = ats2jspre_ref(tmp4);
  tmpret0 = [tmp1, tmp3];
  return tmpret0;
} // end-of-function


function
ats2jspre_qlistref_length(arg0)
{
//
// knd = 0
  var tmpret5
  var tmp6
  var tmp7
  var tmp8
  var tmp9
  var tmp10
  var tmp11
  var tmplab, tmplab_js
//
  // __patsflab_qlistref_length
  tmp6 = arg0[0];
  tmp7 = arg0[1];
  tmp9 = ats2jspre_ref_get_elt(tmp6);
  tmp8 = ats2jspre_list_length(tmp9);
  tmp11 = ats2jspre_ref_get_elt(tmp7);
  tmp10 = ats2jspre_list_length(tmp11);
  tmpret5 = ats2jspre_add_int1_int1(tmp8, tmp10);
  return tmpret5;
} // end-of-function


function
ats2jspre_qlistref_enqueue(arg0, arg1)
{
//
// knd = 0
  var tmp13
  var tmp14
  var tmp15
  var tmp16
  var tmplab, tmplab_js
//
  // __patsflab_qlistref_enqueue
  tmp13 = arg0[0];
  tmp14 = arg0[1];
  tmp16 = ats2jspre_ref_get_elt(tmp13);
  tmp15 = [arg1, tmp16];
  ats2jspre_ref_set_elt(tmp13, tmp15);
  return/*_void*/;
} // end-of-function


function
ats2jspre_qlistref_dequeue_opt(arg0)
{
//
// knd = 0
  var tmpret17
  var tmp18
  var tmp19
  var tmp20
  var tmp21
  var tmp22
  var tmp23
  var tmp25
  var tmp26
  var tmp27
  var tmplab, tmplab_js
//
  // __patsflab_qlistref_dequeue_opt
  tmp18 = arg0[0];
  tmp19 = arg0[1];
  tmp20 = ats2jspre_ref_get_elt(tmp19);
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab0
      if(ATSCKptriscons(tmp20)) { tmplab_js = 4; break; }
      case 2: // __atstmplab1
      tmp23 = ats2jspre_ref_get_elt(tmp18);
      tmp25 = null;
      ats2jspre_ref_set_elt(tmp18, tmp25);
      // ATScaseofseq_beg
      tmplab_js = 1;
      while(true) {
        tmplab = tmplab_js; tmplab_js = 0;
        switch(tmplab) {
          // ATSbranchseq_beg
          case 1: // __atstmplab4
          if(ATSCKptriscons(tmp23)) { tmplab_js = 4; break; }
          case 2: // __atstmplab5
          tmpret17 = null;
          break;
          // ATSbranchseq_end
          // ATSbranchseq_beg
          case 3: // __atstmplab6
          case 4: // __atstmplab7
          tmp26 = tmp23[0];
          tmp27 = tmp23[1];
          ats2jspre_ref_set_elt(tmp19, tmp27);
          tmpret17 = [tmp26];
          break;
          // ATSbranchseq_end
        } // end-of-switch
        if (tmplab_js === 0) break;
      } // endwhile
      // ATScaseofseq_end
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab2
      case 4: // __atstmplab3
      tmp21 = tmp20[0];
      tmp22 = tmp20[1];
      ats2jspre_ref_set_elt(tmp19, tmp22);
      tmpret17 = [tmp21];
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret17;
} // end-of-function


function
ats2jspre_qlistref_foldleft(arg0, arg1, arg2)
{
//
// knd = 0
  var tmpret30
  var tmp31
  var tmp32
  var tmp41
  var tmp42
  var tmp43
  var tmplab, tmplab_js
//
  // __patsflab_qlistref_foldleft
  tmp31 = arg0[0];
  tmp32 = arg0[1];
  tmp41 = ats2jspre_ref_get_elt(tmp31);
  tmp43 = ats2jspre_ref_get_elt(tmp32);
  tmp42 = _ats2jspre_qlistref_auxl_5(arg2, arg1, tmp43);
  tmpret30 = _ats2jspre_qlistref_auxr_6(arg2, tmp41, tmp42);
  return tmpret30;
} // end-of-function


function
_ats2jspre_qlistref_auxl_5(env0, arg0, arg1)
{
//
// knd = 1
  var apy0
  var apy1
  var tmpret33
  var tmp34
  var tmp35
  var tmp36
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_qlistref_auxl_5
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab8
        if(ATSCKptriscons(arg1)) { tmplab_js = 4; break; }
        case 2: // __atstmplab9
        tmpret33 = arg0;
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab10
        case 4: // __atstmplab11
        tmp34 = arg1[0];
        tmp35 = arg1[1];
        tmp36 = env0[0](env0, arg0, tmp34);
        // ATStailcalseq_beg
        apy0 = tmp36;
        apy1 = tmp35;
        arg0 = apy0;
        arg1 = apy1;
        funlab_js = 1; // __patsflab__ats2jspre_qlistref_auxl_5
        // ATStailcalseq_end
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
    if (funlab_js > 0) continue; else return tmpret33;
  } // endwhile-fun
} // end-of-function


function
_ats2jspre_qlistref_auxr_6(env0, arg0, arg1)
{
//
// knd = 0
  var tmpret37
  var tmp38
  var tmp39
  var tmp40
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_qlistref_auxr_6
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab12
      if(ATSCKptriscons(arg0)) { tmplab_js = 4; break; }
      case 2: // __atstmplab13
      tmpret37 = arg1;
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab14
      case 4: // __atstmplab15
      tmp38 = arg0[0];
      tmp39 = arg0[1];
      tmp40 = _ats2jspre_qlistref_auxr_6(env0, tmp39, arg1);
      tmpret37 = env0[0](env0, tmp40, tmp38);
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret37;
} // end-of-function


function
ats2jspre_qlistref_foldright(arg0, arg1, arg2)
{
//
// knd = 0
  var tmpret44
  var tmp45
  var tmp46
  var tmp55
  var tmp56
  var tmp57
  var tmplab, tmplab_js
//
  // __patsflab_qlistref_foldright
  tmp45 = arg0[0];
  tmp46 = arg0[1];
  tmp55 = ats2jspre_ref_get_elt(tmp46);
  tmp57 = ats2jspre_ref_get_elt(tmp45);
  tmp56 = _ats2jspre_qlistref_auxl_8(arg1, arg2, tmp57);
  tmpret44 = _ats2jspre_qlistref_auxr_9(arg1, tmp55, tmp56);
  return tmpret44;
} // end-of-function


function
_ats2jspre_qlistref_auxl_8(env0, arg0, arg1)
{
//
// knd = 1
  var apy0
  var apy1
  var tmpret47
  var tmp48
  var tmp49
  var tmp50
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_qlistref_auxl_8
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab16
        if(ATSCKptriscons(arg1)) { tmplab_js = 4; break; }
        case 2: // __atstmplab17
        tmpret47 = arg0;
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab18
        case 4: // __atstmplab19
        tmp48 = arg1[0];
        tmp49 = arg1[1];
        tmp50 = env0[0](env0, tmp48, arg0);
        // ATStailcalseq_beg
        apy0 = tmp50;
        apy1 = tmp49;
        arg0 = apy0;
        arg1 = apy1;
        funlab_js = 1; // __patsflab__ats2jspre_qlistref_auxl_8
        // ATStailcalseq_end
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
    if (funlab_js > 0) continue; else return tmpret47;
  } // endwhile-fun
} // end-of-function


function
_ats2jspre_qlistref_auxr_9(env0, arg0, arg1)
{
//
// knd = 0
  var tmpret51
  var tmp52
  var tmp53
  var tmp54
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_qlistref_auxr_9
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab20
      if(ATSCKptriscons(arg0)) { tmplab_js = 4; break; }
      case 2: // __atstmplab21
      tmpret51 = arg1;
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab22
      case 4: // __atstmplab23
      tmp52 = arg0[0];
      tmp53 = arg0[1];
      tmp54 = _ats2jspre_qlistref_auxr_9(env0, tmp53, arg1);
      tmpret51 = env0[0](env0, tmp52, tmp54);
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret51;
} // end-of-function


/* ****** ****** */

/* end-of-compilation-unit */
/*
**
** The JavaScript code is generated by atscc2js
** The starting compilation time is: 2016-12-25: 17h:42m
**
*/

// ATSassume(ATSCC2JS_056_slistref__slistref_type)

function
slistref_make_nil()
{
//
// knd = 0
  var tmpret0
  var tmp1
  var tmplab, tmplab_js
//
  // __patsflab_slistref_make_nil
  tmp1 = null;
  tmpret0 = ats2jspre_ref(tmp1);
  return tmpret0;
} // end-of-function


function
slistref_length(arg0)
{
//
// knd = 0
  var tmpret2
  var tmp3
  var tmplab, tmplab_js
//
  // __patsflab_slistref_length
  tmp3 = ats2jspre_ref_get_elt(arg0);
  tmpret2 = ats2jspre_list_length(tmp3);
  return tmpret2;
} // end-of-function


function
slistref_push(arg0, arg1)
{
//
// knd = 0
  var tmp5
  var tmp6
  var tmplab, tmplab_js
//
  // __patsflab_slistref_push
  tmp6 = ats2jspre_ref_get_elt(arg0);
  tmp5 = [arg1, tmp6];
  ats2jspre_ref_set_elt(arg0, tmp5);
  return/*_void*/;
} // end-of-function


function
slistref_pop_opt(arg0)
{
//
// knd = 0
  var tmpret7
  var tmp8
  var tmp9
  var tmp10
  var tmplab, tmplab_js
//
  // __patsflab_slistref_pop_opt
  tmp8 = ats2jspre_ref_get_elt(arg0);
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab0
      if(ATSCKptriscons(tmp8)) { tmplab_js = 4; break; }
      case 2: // __atstmplab1
      tmpret7 = null;
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab2
      case 4: // __atstmplab3
      tmp9 = tmp8[0];
      tmp10 = tmp8[1];
      ats2jspre_ref_set_elt(arg0, tmp10);
      tmpret7 = [tmp9];
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret7;
} // end-of-function


function
slistref_foldleft(arg0, arg1, arg2)
{
//
// knd = 0
  var tmpret12
  var tmp13
  var tmplab, tmplab_js
//
  // __patsflab_slistref_foldleft
  tmp13 = ats2jspre_ref_get_elt(arg0);
  tmpret12 = ats2jspre_list_foldleft(tmp13, arg1, arg2);
  return tmpret12;
} // end-of-function


function
slistref_foldright(arg0, arg1, arg2)
{
//
// knd = 0
  var tmpret14
  var tmp15
  var tmplab, tmplab_js
//
  // __patsflab_slistref_foldright
  tmp15 = ats2jspre_ref_get_elt(arg0);
  tmpret14 = ats2jspre_list_foldright(tmp15, arg1, arg2);
  return tmpret14;
} // end-of-function


/* ****** ****** */

/* end-of-compilation-unit */
/*
**
** The JavaScript code is generated by atscc2js
** The starting compilation time is: 2016-12-25: 17h:42m
**
*/

function
_ats2jspre_ML_list0_patsfun_26__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_ML_list0_patsfun_26(cenv[1], arg0); }, env0];
}


function
_ats2jspre_ML_list0_patsfun_29__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_ML_list0_patsfun_29(cenv[1], arg0); }, env0];
}


function
_ats2jspre_ML_list0_patsfun_32__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_ML_list0_patsfun_32(cenv[1], arg0); }, env0];
}


function
_ats2jspre_ML_list0_patsfun_35__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_ML_list0_patsfun_35(cenv[1], arg0); }, env0];
}


function
_ats2jspre_ML_list0_patsfun_39__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_ML_list0_patsfun_39(cenv[1], arg0); }, env0];
}


function
_ats2jspre_ML_list0_patsfun_42__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_ML_list0_patsfun_42(cenv[1], arg0); }, env0];
}


function
_ats2jspre_ML_list0_patsfun_45__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_ML_list0_patsfun_45(cenv[1], arg0); }, env0];
}


function
_ats2jspre_ML_list0_patsfun_48__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_ML_list0_patsfun_48(cenv[1], arg0); }, env0];
}


function
_ats2jspre_ML_list0_patsfun_51__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_ML_list0_patsfun_51(cenv[1], arg0); }, env0];
}


function
_ats2jspre_ML_list0_patsfun_59__closurerize(env0, env1)
{
  return [function(cenv, arg0) { return _ats2jspre_ML_list0_patsfun_59(cenv[1], cenv[2], arg0); }, env0, env1];
}


function
ats2jspre_ML_list0_head_opt(arg0)
{
//
// knd = 0
  var tmpret4
  var tmp5
  var tmplab, tmplab_js
//
  // __patsflab_list0_head_opt
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab6
      if(ATSCKptriscons(arg0)) { tmplab_js = 4; break; }
      case 2: // __atstmplab7
      tmpret4 = null;
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab8
      case 4: // __atstmplab9
      tmp5 = arg0[0];
      tmpret4 = [tmp5];
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret4;
} // end-of-function


function
ats2jspre_ML_list0_tail_opt(arg0)
{
//
// knd = 0
  var tmpret7
  var tmp9
  var tmplab, tmplab_js
//
  // __patsflab_list0_tail_opt
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab10
      if(ATSCKptriscons(arg0)) { tmplab_js = 4; break; }
      case 2: // __atstmplab11
      tmpret7 = null;
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab12
      case 4: // __atstmplab13
      tmp9 = arg0[1];
      tmpret7 = [tmp9];
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret7;
} // end-of-function


function
ats2jspre_ML_list0_length(arg0)
{
//
// knd = 0
  var tmpret10
  var tmplab, tmplab_js
//
  // __patsflab_list0_length
  tmpret10 = ats2jspre_list_length(arg0);
  return tmpret10;
} // end-of-function


function
ats2jspre_ML_list0_last_opt(arg0)
{
//
// knd = 0
  var tmpret11
  var tmp15
  var tmp16
  var tmp17
  var tmplab, tmplab_js
//
  // __patsflab_list0_last_opt
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab18
      if(ATSCKptriscons(arg0)) { tmplab_js = 4; break; }
      case 2: // __atstmplab19
      tmpret11 = null;
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab20
      case 4: // __atstmplab21
      tmp15 = arg0[0];
      tmp16 = arg0[1];
      tmp17 = _ats2jspre_ML_list0_loop_7(tmp15, tmp16);
      tmpret11 = [tmp17];
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret11;
} // end-of-function


function
_ats2jspre_ML_list0_loop_7(arg0, arg1)
{
//
// knd = 1
  var apy0
  var apy1
  var tmpret12
  var tmp13
  var tmp14
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_ML_list0_loop_7
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab14
        if(ATSCKptriscons(arg1)) { tmplab_js = 4; break; }
        case 2: // __atstmplab15
        tmpret12 = arg0;
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab16
        case 4: // __atstmplab17
        tmp13 = arg1[0];
        tmp14 = arg1[1];
        // ATStailcalseq_beg
        apy0 = tmp13;
        apy1 = tmp14;
        arg0 = apy0;
        arg1 = apy1;
        funlab_js = 1; // __patsflab__ats2jspre_ML_list0_loop_7
        // ATStailcalseq_end
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
    if (funlab_js > 0) continue; else return tmpret12;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_ML_list0_get_at_opt(arg0, arg1)
{
//
// knd = 1
  var apy0
  var apy1
  var tmpret18
  var tmp19
  var tmp20
  var tmp21
  var tmp22
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab_list0_get_at_opt
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab22
        if(ATSCKptriscons(arg0)) { tmplab_js = 4; break; }
        case 2: // __atstmplab23
        tmpret18 = null;
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab24
        case 4: // __atstmplab25
        tmp19 = arg0[0];
        tmp20 = arg0[1];
        tmp21 = ats2jspre_gt_int1_int1(arg1, 0);
        if(tmp21) {
          tmp22 = ats2jspre_sub_int1_int1(arg1, 1);
          // ATStailcalseq_beg
          apy0 = tmp20;
          apy1 = tmp22;
          arg0 = apy0;
          arg1 = apy1;
          funlab_js = 1; // __patsflab_list0_get_at_opt
          // ATStailcalseq_end
        } else {
          tmpret18 = [tmp19];
        } // endif
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
    if (funlab_js > 0) continue; else return tmpret18;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_ML_list0_make_intrange_2(arg0, arg1)
{
//
// knd = 0
  var tmpret23
  var tmp24
  var tmplab, tmplab_js
//
  // __patsflab_list0_make_intrange_2
  tmp24 = ats2jspre_list_make_intrange_2(arg0, arg1);
  tmpret23 = tmp24;
  return tmpret23;
} // end-of-function


function
ats2jspre_ML_list0_make_intrange_3(arg0, arg1, arg2)
{
//
// knd = 0
  var tmpret25
  var tmp26
  var tmplab, tmplab_js
//
  // __patsflab_list0_make_intrange_3
  tmp26 = ats2jspre_list_make_intrange_3(arg0, arg1, arg2);
  tmpret25 = tmp26;
  return tmpret25;
} // end-of-function


function
ats2jspre_ML_list0_snoc(arg0, arg1)
{
//
// knd = 0
  var tmpret38
  var tmp39
  var tmplab, tmplab_js
//
  // __patsflab_list0_snoc
  tmp39 = ats2jspre_list_snoc(arg0, arg1);
  tmpret38 = tmp39;
  return tmpret38;
} // end-of-function


function
ats2jspre_ML_list0_extend(arg0, arg1)
{
//
// knd = 0
  var tmpret40
  var tmp41
  var tmplab, tmplab_js
//
  // __patsflab_list0_extend
  tmp41 = ats2jspre_list_extend(arg0, arg1);
  tmpret40 = tmp41;
  return tmpret40;
} // end-of-function


function
ats2jspre_ML_list0_append(arg0, arg1)
{
//
// knd = 0
  var tmpret42
  var tmp43
  var tmplab, tmplab_js
//
  // __patsflab_list0_append
  tmp43 = ats2jspre_list_append(arg0, arg1);
  tmpret42 = tmp43;
  return tmpret42;
} // end-of-function


function
ats2jspre_ML_list0_reverse(arg0)
{
//
// knd = 0
  var tmpret44
  var tmp45
  var tmplab, tmplab_js
//
  // __patsflab_list0_reverse
  tmp45 = ats2jspre_list_reverse(arg0);
  tmpret44 = tmp45;
  return tmpret44;
} // end-of-function


function
ats2jspre_ML_list0_reverse_append(arg0, arg1)
{
//
// knd = 0
  var tmpret46
  var tmp47
  var tmplab, tmplab_js
//
  // __patsflab_list0_reverse_append
  tmp47 = ats2jspre_list_reverse_append(arg0, arg1);
  tmpret46 = tmp47;
  return tmpret46;
} // end-of-function


function
ats2jspre_ML_list0_concat(arg0)
{
//
// knd = 0
  var tmpret48
  var tmp49
  var tmplab, tmplab_js
//
  // __patsflab_list0_concat
  tmp49 = ats2jspre_list_concat(arg0);
  tmpret48 = tmp49;
  return tmpret48;
} // end-of-function


function
ats2jspre_ML_list0_remove_at_opt(arg0, arg1)
{
//
// knd = 0
  var tmpret50
  var tmplab, tmplab_js
//
  // __patsflab_list0_remove_at_opt
  tmpret50 = _ats2jspre_ML_list0_aux_23(arg0, 0);
  return tmpret50;
} // end-of-function


function
_ats2jspre_ML_list0_aux_23(arg0, arg1)
{
//
// knd = 0
  var tmpret51
  var tmp52
  var tmp53
  var tmp54
  var tmp55
  var tmp56
  var tmp57
  var tmp58
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_ML_list0_aux_23
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab30
      if(ATSCKptriscons(arg0)) { tmplab_js = 4; break; }
      case 2: // __atstmplab31
      tmpret51 = null;
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab32
      case 4: // __atstmplab33
      tmp52 = arg0[0];
      tmp53 = arg0[1];
      tmp54 = ats2jspre_gt_int1_int1(arg1, 0);
      if(tmp54) {
        tmp56 = ats2jspre_sub_int1_int1(arg1, 1);
        tmp55 = _ats2jspre_ML_list0_aux_23(tmp53, tmp56);
        // ATScaseofseq_beg
        tmplab_js = 1;
        while(true) {
          tmplab = tmplab_js; tmplab_js = 0;
          switch(tmplab) {
            // ATSbranchseq_beg
            case 1: // __atstmplab34
            if(ATSCKptriscons(tmp55)) { tmplab_js = 4; break; }
            case 2: // __atstmplab35
            tmpret51 = null;
            break;
            // ATSbranchseq_end
            // ATSbranchseq_beg
            case 3: // __atstmplab36
            case 4: // __atstmplab37
            tmp57 = tmp55[0];
            tmp58 = [tmp52, tmp57];
            tmpret51 = [tmp58];
            break;
            // ATSbranchseq_end
          } // end-of-switch
          if (tmplab_js === 0) break;
        } // endwhile
        // ATScaseofseq_end
      } else {
        tmpret51 = [tmp53];
      } // endif
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret51;
} // end-of-function


function
ats2jspre_ML_list0_exists(arg0, arg1)
{
//
// knd = 0
  var tmpret59
  var tmplab, tmplab_js
//
  // __patsflab_list0_exists
  tmpret59 = ats2jspre_list_exists(arg0, arg1);
  return tmpret59;
} // end-of-function


function
ats2jspre_ML_list0_exists_method(arg0)
{
//
// knd = 0
  var tmpret60
  var tmplab, tmplab_js
//
  // __patsflab_list0_exists_method
  tmpret60 = _ats2jspre_ML_list0_patsfun_26__closurerize(arg0);
  return tmpret60;
} // end-of-function


function
_ats2jspre_ML_list0_patsfun_26(env0, arg0)
{
//
// knd = 0
  var tmpret61
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_ML_list0_patsfun_26
  tmpret61 = ats2jspre_ML_list0_exists(env0, arg0);
  return tmpret61;
} // end-of-function


function
ats2jspre_ML_list0_iexists(arg0, arg1)
{
//
// knd = 0
  var tmpret62
  var tmplab, tmplab_js
//
  // __patsflab_list0_iexists
  tmpret62 = ats2jspre_list_iexists(arg0, arg1);
  return tmpret62;
} // end-of-function


function
ats2jspre_ML_list0_iexists_method(arg0)
{
//
// knd = 0
  var tmpret63
  var tmplab, tmplab_js
//
  // __patsflab_list0_iexists_method
  tmpret63 = _ats2jspre_ML_list0_patsfun_29__closurerize(arg0);
  return tmpret63;
} // end-of-function


function
_ats2jspre_ML_list0_patsfun_29(env0, arg0)
{
//
// knd = 0
  var tmpret64
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_ML_list0_patsfun_29
  tmpret64 = ats2jspre_ML_list0_iexists(env0, arg0);
  return tmpret64;
} // end-of-function


function
ats2jspre_ML_list0_forall(arg0, arg1)
{
//
// knd = 0
  var tmpret65
  var tmplab, tmplab_js
//
  // __patsflab_list0_forall
  tmpret65 = ats2jspre_list_forall(arg0, arg1);
  return tmpret65;
} // end-of-function


function
ats2jspre_ML_list0_forall_method(arg0)
{
//
// knd = 0
  var tmpret66
  var tmplab, tmplab_js
//
  // __patsflab_list0_forall_method
  tmpret66 = _ats2jspre_ML_list0_patsfun_32__closurerize(arg0);
  return tmpret66;
} // end-of-function


function
_ats2jspre_ML_list0_patsfun_32(env0, arg0)
{
//
// knd = 0
  var tmpret67
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_ML_list0_patsfun_32
  tmpret67 = ats2jspre_ML_list0_forall(env0, arg0);
  return tmpret67;
} // end-of-function


function
ats2jspre_ML_list0_iforall(arg0, arg1)
{
//
// knd = 0
  var tmpret68
  var tmplab, tmplab_js
//
  // __patsflab_list0_iforall
  tmpret68 = ats2jspre_list_iforall(arg0, arg1);
  return tmpret68;
} // end-of-function


function
ats2jspre_ML_list0_iforall_method(arg0)
{
//
// knd = 0
  var tmpret69
  var tmplab, tmplab_js
//
  // __patsflab_list0_iforall_method
  tmpret69 = _ats2jspre_ML_list0_patsfun_35__closurerize(arg0);
  return tmpret69;
} // end-of-function


function
_ats2jspre_ML_list0_patsfun_35(env0, arg0)
{
//
// knd = 0
  var tmpret70
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_ML_list0_patsfun_35
  tmpret70 = ats2jspre_ML_list0_iforall(env0, arg0);
  return tmpret70;
} // end-of-function


function
ats2jspre_ML_list0_app(arg0, arg1)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_list0_app
  ats2jspre_ML_list0_foreach(arg0, arg1);
  return/*_void*/;
} // end-of-function


function
ats2jspre_ML_list0_foreach(arg0, arg1)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_list0_foreach
  ats2jspre_list_foreach(arg0, arg1);
  return/*_void*/;
} // end-of-function


function
ats2jspre_ML_list0_foreach_method(arg0)
{
//
// knd = 0
  var tmpret73
  var tmplab, tmplab_js
//
  // __patsflab_list0_foreach_method
  tmpret73 = _ats2jspre_ML_list0_patsfun_39__closurerize(arg0);
  return tmpret73;
} // end-of-function


function
_ats2jspre_ML_list0_patsfun_39(env0, arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_ML_list0_patsfun_39
  ats2jspre_ML_list0_foreach(env0, arg0);
  return/*_void*/;
} // end-of-function


function
ats2jspre_ML_list0_iforeach(arg0, arg1)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_list0_iforeach
  ats2jspre_list_iforeach(arg0, arg1);
  return/*_void*/;
} // end-of-function


function
ats2jspre_ML_list0_iforeach_method(arg0)
{
//
// knd = 0
  var tmpret76
  var tmplab, tmplab_js
//
  // __patsflab_list0_iforeach_method
  tmpret76 = _ats2jspre_ML_list0_patsfun_42__closurerize(arg0);
  return tmpret76;
} // end-of-function


function
_ats2jspre_ML_list0_patsfun_42(env0, arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_ML_list0_patsfun_42
  ats2jspre_ML_list0_iforeach(env0, arg0);
  return/*_void*/;
} // end-of-function


function
ats2jspre_ML_list0_rforeach(arg0, arg1)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_list0_rforeach
  ats2jspre_list_rforeach(arg0, arg1);
  return/*_void*/;
} // end-of-function


function
ats2jspre_ML_list0_rforeach_method(arg0)
{
//
// knd = 0
  var tmpret79
  var tmplab, tmplab_js
//
  // __patsflab_list0_rforeach_method
  tmpret79 = _ats2jspre_ML_list0_patsfun_45__closurerize(arg0);
  return tmpret79;
} // end-of-function


function
_ats2jspre_ML_list0_patsfun_45(env0, arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_ML_list0_patsfun_45
  ats2jspre_ML_list0_rforeach(env0, arg0);
  return/*_void*/;
} // end-of-function


function
ats2jspre_ML_list0_filter(arg0, arg1)
{
//
// knd = 0
  var tmpret81
  var tmp82
  var tmplab, tmplab_js
//
  // __patsflab_list0_filter
  tmp82 = ats2jspre_list_filter(arg0, arg1);
  tmpret81 = tmp82;
  return tmpret81;
} // end-of-function


function
ats2jspre_ML_list0_filter_method(arg0)
{
//
// knd = 0
  var tmpret83
  var tmplab, tmplab_js
//
  // __patsflab_list0_filter_method
  tmpret83 = _ats2jspre_ML_list0_patsfun_48__closurerize(arg0);
  return tmpret83;
} // end-of-function


function
_ats2jspre_ML_list0_patsfun_48(env0, arg0)
{
//
// knd = 0
  var tmpret84
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_ML_list0_patsfun_48
  tmpret84 = ats2jspre_ML_list0_filter(env0, arg0);
  return tmpret84;
} // end-of-function


function
ats2jspre_ML_list0_map(arg0, arg1)
{
//
// knd = 0
  var tmpret85
  var tmp86
  var tmplab, tmplab_js
//
  // __patsflab_list0_map
  tmp86 = ats2jspre_list_map(arg0, arg1);
  tmpret85 = tmp86;
  return tmpret85;
} // end-of-function


function
ats2jspre_ML_list0_map_method(arg0, arg1)
{
//
// knd = 0
  var tmpret87
  var tmplab, tmplab_js
//
  // __patsflab_list0_map_method
  tmpret87 = _ats2jspre_ML_list0_patsfun_51__closurerize(arg0);
  return tmpret87;
} // end-of-function


function
_ats2jspre_ML_list0_patsfun_51(env0, arg0)
{
//
// knd = 0
  var tmpret88
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_ML_list0_patsfun_51
  tmpret88 = ats2jspre_ML_list0_map(env0, arg0);
  return tmpret88;
} // end-of-function


function
ats2jspre_ML_list0_mapcons(arg0, arg1)
{
//
// knd = 0
  var tmpret89
  var tmp90
  var tmp91
  var tmp92
  var tmp93
  var tmplab, tmplab_js
//
  // __patsflab_list0_mapcons
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab38
      if(ATSCKptriscons(arg1)) { tmplab_js = 4; break; }
      case 2: // __atstmplab39
      tmpret89 = null;
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab40
      case 4: // __atstmplab41
      tmp90 = arg1[0];
      tmp91 = arg1[1];
      tmp92 = [arg0, tmp90];
      tmp93 = ats2jspre_ML_list0_mapcons(arg0, tmp91);
      tmpret89 = [tmp92, tmp93];
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret89;
} // end-of-function


function
ats2jspre_ML_list0_find_opt(arg0, arg1)
{
//
// knd = 1
  var apy0
  var apy1
  var tmpret94
  var tmp95
  var tmp96
  var tmp97
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab_list0_find_opt
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab42
        if(ATSCKptriscons(arg0)) { tmplab_js = 4; break; }
        case 2: // __atstmplab43
        tmpret94 = null;
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab44
        case 4: // __atstmplab45
        tmp95 = arg0[0];
        tmp96 = arg0[1];
        tmp97 = arg1[0](arg1, tmp95);
        if(tmp97) {
          tmpret94 = [tmp95];
        } else {
          // ATStailcalseq_beg
          apy0 = tmp96;
          apy1 = arg1;
          arg0 = apy0;
          arg1 = apy1;
          funlab_js = 1; // __patsflab_list0_find_opt
          // ATStailcalseq_end
        } // endif
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
    if (funlab_js > 0) continue; else return tmpret94;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_ML_list0_zip(arg0, arg1)
{
//
// knd = 0
  var tmpret98
  var tmplab, tmplab_js
//
  // __patsflab_list0_zip
  tmpret98 = _ats2jspre_ML_list0_aux_55(arg0, arg1);
  return tmpret98;
} // end-of-function


function
_ats2jspre_ML_list0_aux_55(arg0, arg1)
{
//
// knd = 0
  var tmpret99
  var tmp100
  var tmp101
  var tmp102
  var tmp103
  var tmp104
  var tmp105
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_ML_list0_aux_55
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab46
      if(ATSCKptriscons(arg0)) { tmplab_js = 4; break; }
      case 2: // __atstmplab47
      tmpret99 = null;
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab48
      case 4: // __atstmplab49
      tmp100 = arg0[0];
      tmp101 = arg0[1];
      // ATScaseofseq_beg
      tmplab_js = 1;
      while(true) {
        tmplab = tmplab_js; tmplab_js = 0;
        switch(tmplab) {
          // ATSbranchseq_beg
          case 1: // __atstmplab50
          if(ATSCKptriscons(arg1)) { tmplab_js = 4; break; }
          case 2: // __atstmplab51
          tmpret99 = null;
          break;
          // ATSbranchseq_end
          // ATSbranchseq_beg
          case 3: // __atstmplab52
          case 4: // __atstmplab53
          tmp102 = arg1[0];
          tmp103 = arg1[1];
          tmp104 = [tmp100, tmp102];
          tmp105 = _ats2jspre_ML_list0_aux_55(tmp101, tmp103);
          tmpret99 = [tmp104, tmp105];
          break;
          // ATSbranchseq_end
        } // end-of-switch
        if (tmplab_js === 0) break;
      } // endwhile
      // ATScaseofseq_end
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret99;
} // end-of-function


function
ats2jspre_ML_list0_zipwith(arg0, arg1, arg2)
{
//
// knd = 0
  var tmpret106
  var tmplab, tmplab_js
//
  // __patsflab_list0_zipwith
  tmpret106 = _ats2jspre_ML_list0_aux_57(arg0, arg1, arg2);
  return tmpret106;
} // end-of-function


function
_ats2jspre_ML_list0_aux_57(arg0, arg1, arg2)
{
//
// knd = 0
  var tmpret107
  var tmp108
  var tmp109
  var tmp110
  var tmp111
  var tmp112
  var tmp113
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_ML_list0_aux_57
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab54
      if(ATSCKptriscons(arg0)) { tmplab_js = 4; break; }
      case 2: // __atstmplab55
      tmpret107 = null;
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab56
      case 4: // __atstmplab57
      tmp108 = arg0[0];
      tmp109 = arg0[1];
      // ATScaseofseq_beg
      tmplab_js = 1;
      while(true) {
        tmplab = tmplab_js; tmplab_js = 0;
        switch(tmplab) {
          // ATSbranchseq_beg
          case 1: // __atstmplab58
          if(ATSCKptriscons(arg1)) { tmplab_js = 4; break; }
          case 2: // __atstmplab59
          tmpret107 = null;
          break;
          // ATSbranchseq_end
          // ATSbranchseq_beg
          case 3: // __atstmplab60
          case 4: // __atstmplab61
          tmp110 = arg1[0];
          tmp111 = arg1[1];
          tmp112 = arg2[0](arg2, tmp108, tmp110);
          tmp113 = _ats2jspre_ML_list0_aux_57(tmp109, tmp111, arg2);
          tmpret107 = [tmp112, tmp113];
          break;
          // ATSbranchseq_end
        } // end-of-switch
        if (tmplab_js === 0) break;
      } // endwhile
      // ATScaseofseq_end
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret107;
} // end-of-function


function
ats2jspre_ML_list0_zipwith_method(arg0, arg1)
{
//
// knd = 0
  var tmpret114
  var tmplab, tmplab_js
//
  // __patsflab_list0_zipwith_method
  tmpret114 = _ats2jspre_ML_list0_patsfun_59__closurerize(arg0, arg1);
  return tmpret114;
} // end-of-function


function
_ats2jspre_ML_list0_patsfun_59(env0, env1, arg0)
{
//
// knd = 0
  var tmpret115
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_ML_list0_patsfun_59
  tmpret115 = ats2jspre_ML_list0_zipwith(env0, env1, arg0);
  return tmpret115;
} // end-of-function


function
ats2jspre_ML_list0_foldleft(arg0, arg1, arg2)
{
//
// knd = 0
  var tmpret116
  var tmplab, tmplab_js
//
  // __patsflab_list0_foldleft
  tmpret116 = _ats2jspre_ML_list0_aux_61(arg2, arg1, arg0);
  return tmpret116;
} // end-of-function


function
_ats2jspre_ML_list0_aux_61(env0, arg0, arg1)
{
//
// knd = 1
  var apy0
  var apy1
  var tmpret117
  var tmp118
  var tmp119
  var tmp120
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_ML_list0_aux_61
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab62
        if(ATSCKptriscons(arg1)) { tmplab_js = 4; break; }
        case 2: // __atstmplab63
        tmpret117 = arg0;
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab64
        case 4: // __atstmplab65
        tmp118 = arg1[0];
        tmp119 = arg1[1];
        tmp120 = env0[0](env0, arg0, tmp118);
        // ATStailcalseq_beg
        apy0 = tmp120;
        apy1 = tmp119;
        arg0 = apy0;
        arg1 = apy1;
        funlab_js = 1; // __patsflab__ats2jspre_ML_list0_aux_61
        // ATStailcalseq_end
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
    if (funlab_js > 0) continue; else return tmpret117;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_ML_list0_foldright(arg0, arg1, arg2)
{
//
// knd = 0
  var tmpret121
  var tmplab, tmplab_js
//
  // __patsflab_list0_foldright
  tmpret121 = _ats2jspre_ML_list0_aux_63(arg1, arg2, arg0, arg2);
  return tmpret121;
} // end-of-function


function
_ats2jspre_ML_list0_aux_63(env0, env1, arg0, arg1)
{
//
// knd = 0
  var tmpret122
  var tmp123
  var tmp124
  var tmp125
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_ML_list0_aux_63
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab66
      if(ATSCKptriscons(arg0)) { tmplab_js = 4; break; }
      case 2: // __atstmplab67
      tmpret122 = arg1;
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab68
      case 4: // __atstmplab69
      tmp123 = arg0[0];
      tmp124 = arg0[1];
      tmp125 = _ats2jspre_ML_list0_aux_63(env0, env1, tmp124, env1);
      tmpret122 = env0[0](env0, tmp123, tmp125);
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret122;
} // end-of-function


function
ats2jspre_ML_list0_sort_2(arg0, arg1)
{
//
// knd = 0
  var tmpret128
  var tmp129
  var tmplab, tmplab_js
//
  // __patsflab_list0_sort_2
  tmp129 = ats2jspre_list_sort_2(arg0, arg1);
  tmpret128 = tmp129;
  return tmpret128;
} // end-of-function


function
ats2jspre_ML_streamize_list0_zip(arg0, arg1)
{
//
// knd = 0
  var tmpret130
  var tmplab, tmplab_js
//
  // __patsflab_streamize_list0_zip
  tmpret130 = ats2jspre_streamize_list_zip(arg0, arg1);
  return tmpret130;
} // end-of-function


function
ats2jspre_ML_streamize_list0_cross(arg0, arg1)
{
//
// knd = 0
  var tmpret131
  var tmplab, tmplab_js
//
  // __patsflab_streamize_list0_cross
  tmpret131 = ats2jspre_streamize_list_cross(arg0, arg1);
  return tmpret131;
} // end-of-function


function
ats2jspre_ML_list0_head_exn(arg0)
{
//
// knd = 0
  var tmpret135
  var tmp136
  var tmplab, tmplab_js
//
  // __patsflab_list0_head_exn
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab70
      if(ATSCKptrisnull(arg0)) { tmplab_js = 4; break; }
      case 2: // __atstmplab71
      tmp136 = arg0[0];
      tmpret135 = tmp136;
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab72
      case 4: // __atstmplab73
      tmpret135 = ats2jspre_ListSubscriptExn_throw();
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret135;
} // end-of-function


function
ats2jspre_ML_list0_tail_exn(arg0)
{
//
// knd = 0
  var tmpret138
  var tmp140
  var tmplab, tmplab_js
//
  // __patsflab_list0_tail_exn
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab74
      if(ATSCKptrisnull(arg0)) { tmplab_js = 4; break; }
      case 2: // __atstmplab75
      tmp140 = arg0[1];
      tmpret138 = tmp140;
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab76
      case 4: // __atstmplab77
      tmpret138 = ats2jspre_ListSubscriptExn_throw();
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret138;
} // end-of-function


function
ats2jspre_ML_list0_get_at_exn(arg0, arg1)
{
//
// knd = 1
  var apy0
  var apy1
  var tmpret141
  var tmp142
  var tmp143
  var tmp144
  var tmp145
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab_list0_get_at_exn
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab78
        if(ATSCKptriscons(arg0)) { tmplab_js = 4; break; }
        case 2: // __atstmplab79
        tmpret141 = ats2jspre_ListSubscriptExn_throw();
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab80
        case 4: // __atstmplab81
        tmp142 = arg0[0];
        tmp143 = arg0[1];
        tmp144 = ats2jspre_gt_int1_int1(arg1, 0);
        if(tmp144) {
          tmp145 = ats2jspre_sub_int1_int1(arg1, 1);
          // ATStailcalseq_beg
          apy0 = tmp143;
          apy1 = tmp145;
          arg0 = apy0;
          arg1 = apy1;
          funlab_js = 1; // __patsflab_list0_get_at_exn
          // ATStailcalseq_end
        } else {
          tmpret141 = tmp142;
        } // endif
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
    if (funlab_js > 0) continue; else return tmpret141;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_ML_list0_insert_at_exn(arg0, arg1, arg2)
{
//
// knd = 0
  var tmpret146
  var tmplab, tmplab_js
//
  // __patsflab_list0_insert_at_exn
  tmpret146 = _ats2jspre_ML_list0_aux_76(arg2, arg0, arg1);
  return tmpret146;
} // end-of-function


function
_ats2jspre_ML_list0_aux_76(env0, arg0, arg1)
{
//
// knd = 0
  var tmpret147
  var tmp148
  var tmp149
  var tmp150
  var tmp151
  var tmp152
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_ML_list0_aux_76
  tmp148 = ats2jspre_gt_int1_int1(arg1, 0);
  if(tmp148) {
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab82
        if(ATSCKptriscons(arg0)) { tmplab_js = 4; break; }
        case 2: // __atstmplab83
        tmpret147 = ats2jspre_ListSubscriptExn_throw();
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab84
        case 4: // __atstmplab85
        tmp149 = arg0[0];
        tmp150 = arg0[1];
        tmp152 = ats2jspre_sub_int1_int1(arg1, 1);
        tmp151 = _ats2jspre_ML_list0_aux_76(env0, tmp150, tmp152);
        tmpret147 = [tmp149, tmp151];
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
  } else {
    tmpret147 = [env0, arg0];
  } // endif
  return tmpret147;
} // end-of-function


function
ats2jspre_ML_list0_remove_at_exn(arg0, arg1)
{
//
// knd = 0
  var tmpret153
  var tmplab, tmplab_js
//
  // __patsflab_list0_remove_at_exn
  tmpret153 = _ats2jspre_ML_list0_aux_78(arg0, arg1);
  return tmpret153;
} // end-of-function


function
_ats2jspre_ML_list0_aux_78(arg0, arg1)
{
//
// knd = 0
  var tmpret154
  var tmp155
  var tmp156
  var tmp157
  var tmp158
  var tmp159
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_ML_list0_aux_78
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab86
      if(ATSCKptriscons(arg0)) { tmplab_js = 4; break; }
      case 2: // __atstmplab87
      tmpret154 = ats2jspre_ListSubscriptExn_throw();
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab88
      case 4: // __atstmplab89
      tmp155 = arg0[0];
      tmp156 = arg0[1];
      tmp157 = ats2jspre_gt_int1_int1(arg1, 0);
      if(tmp157) {
        tmp159 = ats2jspre_sub_int1_int1(arg1, 1);
        tmp158 = _ats2jspre_ML_list0_aux_78(tmp156, tmp159);
        tmpret154 = [tmp155, tmp158];
      } else {
        tmpret154 = tmp156;
      } // endif
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret154;
} // end-of-function


/* ****** ****** */

/* end-of-compilation-unit */
/*
**
** The JavaScript code is generated by atscc2js
** The starting compilation time is: 2016-12-25: 17h:42m
**
*/

// ATSassume(ATSCC2JS_056_basics__array0_vt0ype_type)

function
_ats2jspre_ML_array0_patsfun_7__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_ML_array0_patsfun_7(cenv[1], arg0); }, env0];
}


function
_ats2jspre_ML_array0_patsfun_10__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_ML_array0_patsfun_10(cenv[1], arg0); }, env0];
}


function
_ats2jspre_ML_array0_patsfun_14__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_ML_array0_patsfun_14(cenv[1], arg0); }, env0];
}


function
ats2jspre_ML_array0_make_elt(arg0, arg1)
{
//
// knd = 0
  var tmpret0
  var tmplab, tmplab_js
//
  // __patsflab_array0_make_elt
  tmpret0 = ats2jspre_arrszref_make_elt(arg0, arg1);
  return tmpret0;
} // end-of-function


function
ats2jspre_ML_array0_size(arg0)
{
//
// knd = 0
  var tmpret1
  var tmplab, tmplab_js
//
  // __patsflab_array0_size
  tmpret1 = ats2jspre_arrszref_size(arg0);
  return tmpret1;
} // end-of-function


function
ats2jspre_ML_array0_get_at(arg0, arg1)
{
//
// knd = 0
  var tmpret2
  var tmplab, tmplab_js
//
  // __patsflab_array0_get_at
  tmpret2 = ats2jspre_arrszref_get_at(arg0, arg1);
  return tmpret2;
} // end-of-function


function
ats2jspre_ML_array0_set_at(arg0, arg1, arg2)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_array0_set_at
  ats2jspre_arrszref_set_at(arg0, arg1, arg2);
  return/*_void*/;
} // end-of-function


function
ats2jspre_ML_array0_exch_at(arg0, arg1, arg2)
{
//
// knd = 0
  var tmpret4
  var tmplab, tmplab_js
//
  // __patsflab_array0_exch_at
  tmpret4 = ats2jspre_arrszref_exch_at(arg0, arg1, arg2);
  return tmpret4;
} // end-of-function


function
ats2jspre_ML_array0_exists_cloref(arg0, arg1)
{
//
// knd = 0
  var tmpret5
  var tmplab, tmplab_js
//
  // __patsflab_array0_exists_cloref
  tmpret5 = ats2jspre_arrszref_exists_cloref(arg0, arg1);
  return tmpret5;
} // end-of-function


function
ats2jspre_ML_array0_exists_method(arg0)
{
//
// knd = 0
  var tmpret6
  var tmplab, tmplab_js
//
  // __patsflab_array0_exists_method
  tmpret6 = _ats2jspre_ML_array0_patsfun_7__closurerize(arg0);
  return tmpret6;
} // end-of-function


function
_ats2jspre_ML_array0_patsfun_7(env0, arg0)
{
//
// knd = 0
  var tmpret7
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_ML_array0_patsfun_7
  tmpret7 = ats2jspre_ML_array0_exists_cloref(env0, arg0);
  return tmpret7;
} // end-of-function


function
ats2jspre_ML_array0_forall_cloref(arg0, arg1)
{
//
// knd = 0
  var tmpret8
  var tmplab, tmplab_js
//
  // __patsflab_array0_forall_cloref
  tmpret8 = ats2jspre_arrszref_forall_cloref(arg0, arg1);
  return tmpret8;
} // end-of-function


function
ats2jspre_ML_array0_forall_method(arg0)
{
//
// knd = 0
  var tmpret9
  var tmplab, tmplab_js
//
  // __patsflab_array0_forall_method
  tmpret9 = _ats2jspre_ML_array0_patsfun_10__closurerize(arg0);
  return tmpret9;
} // end-of-function


function
_ats2jspre_ML_array0_patsfun_10(env0, arg0)
{
//
// knd = 0
  var tmpret10
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_ML_array0_patsfun_10
  tmpret10 = ats2jspre_ML_array0_forall_cloref(env0, arg0);
  return tmpret10;
} // end-of-function


function
ats2jspre_ML_array0_app_cloref(arg0, arg1)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_array0_app_cloref
  ats2jspre_ML_array0_foreach_cloref(arg0, arg1);
  return/*_void*/;
} // end-of-function


function
ats2jspre_ML_array0_foreach_cloref(arg0, arg1)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_array0_foreach_cloref
  ats2jspre_arrszref_foreach_cloref(arg0, arg1);
  return/*_void*/;
} // end-of-function


function
ats2jspre_ML_array0_foreach_method(arg0)
{
//
// knd = 0
  var tmpret13
  var tmplab, tmplab_js
//
  // __patsflab_array0_foreach_method
  tmpret13 = _ats2jspre_ML_array0_patsfun_14__closurerize(arg0);
  return tmpret13;
} // end-of-function


function
_ats2jspre_ML_array0_patsfun_14(env0, arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_ML_array0_patsfun_14
  ats2jspre_ML_array0_foreach_cloref(env0, arg0);
  return/*_void*/;
} // end-of-function


/* ****** ****** */

/* end-of-compilation-unit */
-en \n/* ****** ****** */\n
-en \n/* end of [libatscc2js_all.js] */\n
