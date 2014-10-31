/*
******
*
* AS-2014-09:
* for IL code
* translated from ATS
*
******
*/

/*
******
* beg of [basics_cats.il]
******
*/

/* ****** ****** */
// typedefs (see $ATSHOME/ccomp/runtime/pats_ccomp_typedefs.h)

#define atstype_void System.Void
#define atsvoid_t0ype System.Void
#define atstype_int System.Int32
#define atstype_uint System.UInt32
#define atstype_lint System.Int64
// atstype_ulint,llint,ullint
#define atstype_sint System.Int16
#define atstype_usint System.UInt16
// atstype_ssize, atstype_size
#define atstype_bool System.Boolean
#define atstype_byte System.Byte
#define atstype_char System.Char
// atstype_schar, uchar
#define atstype_string System.String
#define atstype_stropt System.String
#define atstype_strptr System.StringBuilder
#define atstype_float System.Single
#define atstype_double System.Double
#define atstype_ldouble System.Decimal
//
// atstype_ptr, atstype_ptrk
// atstype_ref
// atstype_boxed
// atstype_datconptr
// atstype_datcontyp
// atstype_exncon
// atstype_exnconptr
// atstype_arrptr
// atstype_arrpsz
// atstype_funptr
// atstype_cloptr
// atstype_var
// atstyvar_type
// atstybox_type(hit)
// atstyclo_top, atstyclo_type(flab)
// atsrefarg0_type(hit), atsrefarg1_type(hit)

/* ****** ****** */
// instrset (see $ATSHOME/ccomp/runtime/pats_ccomp_instrset.h

#define atsbool_true 1
#define atsbool_false 0

#define ATSCKpat_int System.Boolean [mscorlib]System.Integer::Equals(System.Integer, System.Integer)
#define ATSCKpat_bool System.Boolean [mscorlib]System.Boolean::Equals(System.Boolean, System.Boolean)
#define ATSCKpat_char System.Boolean [mscorlib]System.Char::Equals(System.Char, System.Char)
#define ATSCKpat_float System.Boolean [mscorlib]System.Single::Equals(System.Single, System.Single)
#define ATSCKpat_string System.Boolean [mscorlib]System.String::Equals(System.String, System.String)

/* ****** ****** */

/* end of [basics_cats.il] */
