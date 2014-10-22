/* ****** ****** */
//
// HX-2014-10-22:
// For C code generate from ATS source
//
/* ****** ****** */

/*
** Permission to use, copy, modify, and distribute this software for any
** purpose with or without fee is hereby granted, provided that the above
** copyright notice and this permission notice appear in all copies.
** 
** THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
** WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
** MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
** ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
** WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
** ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
** OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
*/

/* ****** ****** */

#ifndef LINUX_PATS_CCOMP_H
#define LINUX_PATS_CCOMP_H

/* ****** ****** */

#define ATSextern() extern
#define ATSstatic() static

/* ****** ****** */

#define ATSdyncst_mac(d2c)
#define ATSdyncst_castfn(d2c)
#define ATSdyncst_extfun(d2c, targs, tres) ATSextern() tres d2c targs
#define ATSdyncst_stafun(d2c, targs, tres) ATSstatic() tres d2c targs

/* ****** ****** */

typedef
int atstype_int ;
typedef
unsigned int atstype_uint ;

/* ****** ****** */

typedef
int atstype_bool ;

/* ****** ****** */

typedef
char atstype_char ;
typedef
unsigned char atstype_uchar ;

/* ****** ****** */

typedef
char *atstype_string ;

/* ****** ****** */

typedef
void atsvoid_t0ype ;

/* ****** ****** */

typedef void *atstype_ptr ;
typedef void *atstype_ptrk ;

/* ****** ****** */

#define atstkind_type(tk) tk
#define atstkind_t0ype(tk) tk

/* ****** ****** */
//
// HX: boolean values
//
#define atsbool_true 1
#define atsbool_false 0
//
/* ****** ****** */

#define ATStysum() struct{ int contag; }
#define ATStyexn() struct{ int exntag; char *exnmsg; }
#define ATStylist(tyelt) struct{ tyelt head; void *tail; }
#define ATStyclo() struct{ void *cfun; }

/* ****** ****** */
//
// HX: for supporting lazy-evaluation
//
#define \
ATStylazy(tyval) \
  struct{ int flag; union{ void* thunk; tyval saved; } lazy; }
//
/* ****** ****** */

#define ATSempty()

/* ****** ****** */

#define ATSif(x) if(x)
#define ATSthen()
#define ATSelse() else

/* ****** ****** */

#define ATSifthen(x) if(x)
#define ATSifnthen(x) if(!(x))

/* ****** ****** */

#define ATSdo() do
#define ATSwhile(x) while(x)
#define ATSbreak() break
#define ATScontinue() continue

/* ****** ****** */
//
// HX: handling for/while loops
//
#define \
ATSloop_open(init, fini, cont) \
  do { init:
#define \
ATSloop_close(init, fini, cont) \
  goto init ; fini: break ; } while(0)
//
#define ATSbreak2(fini) goto fini
#define ATScontinue2(cont) goto cont
//
/* ****** ****** */

#define ATSreturn(x) return(x)
#define ATSreturn_void(x) return

/* ****** ****** */

#define ATSextcode_beg()
#define ATSextcode_end()

/* ****** ****** */

#define ATSfunbody_beg()
#define ATSfunbody_end()

/* ****** ****** */

#define ATSPMVint(i) i
#define ATSPMVintrep(rep) (rep)

#define ATSPMVbool_true() atsbool_true
#define ATSPMVbool_false() atsbool_false
#define ATSPMVchar(c) (c)
#define ATSPMVfloat(rep) (rep)
#define ATSPMVstring(str) (str)

#define ATSPMVi0nt(tok) (tok)
#define ATSPMVf0loat(tok) (tok)

/* ****** ****** */

#define ATSCSTSPmyfil(info) info
#define ATSCSTSPmyloc(info) info

/* ****** ****** */
//
#define ATSextfcall(fun, funarg) fun funarg
//
/* ****** ****** */
//
#define ATStmpdec(tmp, hit) hit tmp
#define ATSstatmpdec(tmp, hit) static hit tmp
//
/* ****** ****** */
//
#define ATSINSlab(lab) lab
#define ATSINSgoto(lab) goto lab
//
#define ATSINSflab(flab) flab
#define ATSINSfgoto(flab) goto flab
//
/* ****** ****** */

#define ATSINSmove(tmp, val) (tmp = val)
#define ATSINSpmove(tmp, hit, val) (*(hit*)tmp = val)

/* ****** ****** */
/*
** HX-2013-01-20:
** Do not have parentheses around [command]
*/
#define ATSINSmove_void(tmp, command) command
#define ATSINSpmove_void(tmp, hit, command) command

/* ****** ****** */

#endif // end of [LINUX_PATS_CCOMP_H]

/* ****** ****** */

/* end of [pats_ccomp.h] */
