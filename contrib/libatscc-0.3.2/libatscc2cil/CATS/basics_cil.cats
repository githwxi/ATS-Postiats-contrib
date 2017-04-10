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
* beg of [basics_cil.cats]
******
*/

/* ****** ****** */

// typedefs (see $ATSHOME/ccomp/runtime/pats_ccomp_typedefs.h)

/* ****** ****** */

#define atstype_void void
#define atsvoid_t0ype void
#define atstype_int int32
#define atstype_uint unsigned int32
#define atstype_lint int64
// atstype_ulint,llint,ullint
#define atstype_sint int16
#define atstype_usint unsigned int16
// atstype_ssize, atstype_size
#define atstype_bool int8
#define atstype_byte int8
#define atstype_char char
// atstype_schar, uchar
#define atstype_string string
#define atstype_stropt string
#define atstype_strptr [mscorlib]System.StringBuilder
#define atstype_float float32
#define atstype_double float64
#define atstype_ldouble decimal
//
// atstype_ptr, atstype_ptrk
// atstype_ref
#define atstype_boxed object
// atstype_datconptr
// atstype_datcontyp
// atstype_exncon
// atstype_exnconptr
// atstype_arrptr
// atstype_arrpsz
#define atstype_funptr [mscorlib]System.Delegate
#define atstype_cloptr [mscorlib]System.Delegate
// TODO: type variables need to be taken care of
// atstype_var
#define atstyvar_type(a) object // a type variable for type of undeterminate size
// atstybox_type(hit)
// atstyclo_top, atstyclo_type(flab)
// atsrefarg0_type(hit), atsrefarg1_type(hit)

/* ****** ****** */
//
// instrset (see $ATSHOME/ccomp/runtime/pats_ccomp_instrset.h
//
/* ****** ****** */

#define atsbool_true 1
#define atsbool_false 0

#define ATSCKpat_int int32 ats2cilpre::atsckpat_int(int32, int32)
#define ATSCKpat_bool int32 ats2cilpre:atsckpat_bool(int32, int32)
#define ATSCKpat_char int32 ats2cilpre::atsckpat_char(char, char)
#define ATSCKpat_float int32 ats2cilpre::atsckpat_float(float32, float32)
#define ATSCKpat_string int32 ats2cilpre::atsckpat_string(string, string)
#define ATSCKpat_con0 int32 ats2cilpre::atsckpat_con0(object, int32)

/* ****** ****** */

.class
public
auto
ansi
sealed
ats2enum
extends [mscorlib]System.Enum {
  .field public specialname rtspecialname int32 value__
}

/* ****** ****** */

.class
ats2cilpre {
//
// basics
//
  .method static public int32 atsckpat_int(int32 x, int32 y) {
    ldarg x
    ldarg y
    ceq
    ret
  }
  .method static public int32 atsckpat_bool(int32 x, int32 y) {
    ldarg x
    ldarg y
    ceq
    ret
  }
  .method static public int32 atsckpat_char(char x, char y) {
    ldarg x
    ldarg y
    ceq
    ret
  }
  .method static public int32 atsckpat_float(float32 x, float32 y) {
    ldarg x
    ldarg y
    ceq
    ret
  }
  .method static public int32 atsckpat_string(string x, string y) {
    ldarg x
    ldarg y
    call int32 [mscorlib]System.String::Equals(string, string)
    ret
  }
  .method static public int32 atsckpat_con0(object x, int32 y) {
    ldarg x
    unbox ats2enum
    ldfld int32 ats2enum::value__
    ldarg y
    ceq
    ret
  }
//
// integer
//
  .method static public int32 abs_int0(int32 x) {
    ldarg x
    ldc.i4.0
    bgt L1
    ldarg x
    neg
    ret
  L1:
    ldarg x
    ret
  }
  .method static public int32 add_int0_int0(int32 x, int32 y) {
    ldarg x
    ldarg y
    add
    ret
  }
  .method static public int32 sub_int0_int0(int32 x, int32 y) {
    .maxstack 2
    ldarg x
    ldarg y
    sub
    ret
  }
  .method static public int32 mul_int0_int0(int32 x, int32 y) {
    .maxstack 2
    ldarg x
    ldarg y
    mul
    ret
  }
  .method static public int32 div_int0_int0(int32 x, int32 y) {
    .maxstack 2
    ldarg.0
    ldarg.1
    div
    ret
  }
  .method static public int32 lt_int0_int0(int32 x, int32 y) {
    ldarg x
    ldarg y
    blt IL1
    ldc.i4.0
    ret
    IL1:
    ldc.i4.1
    ret
  }
  .method static public int32 lte_int0_int0(int32 x, int32 y) {
    ldarg x
    ldarg y
    ble IL1
    ldc.i4.0
    ret
    IL1:
    ldc.i4.1
    ret
  }
  .method static public int32 gt_int0_int0(int32 x, int32 y) {
    ldarg x
    ldarg y
    bgt IL1
    ldc.i4.0
    ret
    IL1:
    ldc.i4.1
    ret
  }
  .method static public int32 gte_int0_int0(int32 x, int32 y) {
    ldarg x
    ldarg y
    bge IL1
    ldc.i4.0
    ret
    IL1:
    ldc.i4.1
    ret
  }
  .method static public int32 eq_int0_int0(int32 x, int32 y) {
    .maxstack 2
    ldarg x
    ldarg y
    ceq
    ret
  }
  .method static public int32 neq_int0_int0(int32 x, int32 y) {
    .maxstack 2
    ldarg.0
    ldarg.1
    bne.un IL1
    ldc.i4.0
    ret
    IL1:
    ldc.i4.1
    ret
  }
//
// float
//
  .method static public float64 add_double_double(float64 x, float64 y) {
    ldarg x
    ldarg y
    add
    ret
  }
  .method static public float64 sub_double_double(float64 x, float64 y) {
    .maxstack 2
    ldarg x
    ldarg y
    sub
    ret
  }
  .method static public float64 mul_double_double(float64 x, float64 y) {
    .maxstack 2
    ldarg x
    ldarg y
    mul
    ret
  }
  .method static public int32 lt_double_double(float64 x, float64 y) {
    ldarg x
    ldarg y
    blt IL1
    ldc.i4.0
    ret
    IL1:
    ldc.i4.1
    ret
  }
  .method static public int32 lte_double_double(float64 x, float64 y) {
    ldarg x
    ldarg y
    ble IL1
    ldc.i4.0
    ret
    IL1:
    ldc.i4.1
    ret
  }
  .method static public int32 gt_double_double(float64 x, float64 y) {
    ldarg x
    ldarg y
    bgt IL1
    ldc.i4.0
    ret
    IL1:
    ldc.i4.1
    ret
  }
  .method static public int32 gte_double_double(float64 x, float64 y) {
    ldarg x
    ldarg y
    bge IL1
    ldc.i4.0
    ret
    IL1:
    ldc.i4.1
    ret
  }
  .method static public int32 eq_double_double(float64 x, float64 y) {
    .maxstack 2
    ldarg x
    ldarg y
    ceq
    ret
  }
}

/* ****** ****** */

#define ats2cilpre_print_int void [mscorlib]System.Console::Write(int32)
#define ats2cilpre_print_bool void [mscorlib]System.Console::Write(bool)
#define ats2cilpre_print_string void [mscorlib]System.Console::Write(string)
#define ats2cilpre_print_newline void [mscorlib]System.Console::WriteLine()

/* ****** ****** */

/* end of [basics_cil.cats] */
