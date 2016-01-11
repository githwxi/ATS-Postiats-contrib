absvt@ype
HTMLprint = @{
  tags= ptr
, state= ptr
, out= ptr
, tagname= ptr
, do_indent= bool
, indent= int
} (* end of [HTMLprint] *)

fun
htmlprint_prolog (hp: &HTMLprint): void
fun
htmlprint_combeg (hp: &HTMLprint): void
fun
htmlprint_comend (hp: &HTMLprint): void

fun
htmlprint_tagname (hp: &HTMLprint, tagname: string): void
fun
htmlprint_tagend (hp: &HTMLprint, tagname: string): void

fun
htmlprint_attrib (hp: &HTMLprint, attname: string): void

fun
htmlprint_chardata (hp: &HTMLprint): void

fun
htmlprint_unsafe_inject (hp: &HTMLprint, s: string): void

fun
htmlprint_alloc (out: FILEref, do_indent: bool, res: &HTMLprint? >> HTMLprint): void
fun
htmlprint_free (res: &HTMLprint >> _?): void

typedef
htmlprint_type(a: t0p) = (&HTMLprint, a) -> void
typedef
htmlprint_vtype(a: vt0p) = (&HTMLprint, !a) -> void

fun htmlprint_bool : htmlprint_type (bool)
overload htmlprint with htmlprint_bool

fun htmlprint_char : htmlprint_type (char)
// fun htmlprint_schar : htmlprint_type (schar)
// fun htmlprint_uchar : htmlprint_type (uchar)
overload htmlprint with htmlprint_char
// overload htmlprint with htmlprint_schar
// overload htmlprint with htmlprint_uchar
//
fun htmlprint_float : htmlprint_type (float)
fun htmlprint_double : htmlprint_type (double)
fun htmlprint_ldouble : htmlprint_type (ldouble)
overload htmlprint with htmlprint_float
overload htmlprint with htmlprint_double
overload htmlprint with htmlprint_ldouble
//
fun htmlprint_int : htmlprint_type (int)
fun htmlprint_lint : htmlprint_type (lint)
fun htmlprint_llint : htmlprint_type (llint)
fun htmlprint_ssize : htmlprint_type (ssize_t)
fun htmlprint_uint : htmlprint_type (uint)
fun htmlprint_ulint : htmlprint_type (ulint)
fun htmlprint_ullint : htmlprint_type (ullint)
fun htmlprint_size : htmlprint_type (size_t)
overload htmlprint with htmlprint_int
overload htmlprint with htmlprint_lint
overload htmlprint with htmlprint_llint
overload htmlprint with htmlprint_ssize
overload htmlprint with htmlprint_uint
overload htmlprint with htmlprint_ulint
overload htmlprint with htmlprint_ullint
overload htmlprint with htmlprint_size

fun htmlprint_string : htmlprint_type (string)
fun htmlprint_stropt : htmlprint_type (Stropt0)
fun htmlprint_strptr : htmlprint_vtype (Strptr0)
overload htmlprint with htmlprint_string of 0
overload htmlprint with htmlprint_stropt of 0
overload htmlprint with htmlprint_strptr

fun
htmlprint_strbuf {m,n:int}
  (out: &HTMLprint, buf: &strbuf (m, n)): void


local

macrodef
rec
auxlist
  (out, xs, y) =
(
//
if iscons! (xs) then
  `(htmlprint (,(out), ,(car! xs)); ,(auxlist (out, cdr! xs, y)))
else y // end of [if]
//
) // end of [auxlist]

in (* in of [local] *)

macdef
htmlprint_mac(out, x) =
,(
  if islist! (x)
    then auxlist (out, x, `()) else `(htmlprint (,(out), ,(x)))
  // end of [if]
) // end of [htmlprint_mac]

end // end of [local]
