/* ****** ****** */
//
// HX-2015-01-31:
// For C code generated from ATS source
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

#ifndef COMPCERT_PATS_CCOMP_H
#define COMPCERT_PATS_CCOMP_H

/* ****** ****** */
//
#include \
"kernelats/pats_ccomp.h"
//
/* ****** ****** */
//
#define ATSdynload()
//
#define ATSdynloadflag_sta(flag)
#define ATSdynloadflag_ext(flag) ATSextern() int flag
//
#define ATSdynloadflag_init(flag) int flag = 0
//
#define ATSdynloadset(flag) flag = 1
#define ATSdynloadfcall(dynloadfun) dynloadfun()
//
/* ****** ****** */
//
#define \
ATSmainats_void_0(err) mainats_void_0()
#define \
ATSmainats_argc_argv_0(argc, argv, err) mainats_argc_argv_0(argc, argv)
#define \
ATSmainats_argc_argv_envp_0(argc, argv, envp, err) mainats_argc_argv_envp_0(argc, argv, envp)
//
#define \
ATSmainats_void_int(err) err = mainats_void_int()
#define \
ATSmainats_argc_argv_int(argc, argv, err) err = mainats_argc_argv_int(argc, argv)
#define \
ATSmainats_argc_argv_envp_int(argc, argv, envp, err) err = mainats_argc_argv_envp_int(argc, argv, envp)
//
/* ****** ****** */
//
#include \
"kernelats/prelude/CATS/integer.cats"
#include \
"kernelats/prelude/CATS/pointer.cats"
//
#include "kernelats/prelude/CATS/bool.cats"
#include "kernelats/prelude/CATS/char.cats"
#include "kernelats/prelude/CATS/string.cats"
//
#include "kernelats/prelude/CATS/array.cats"
#include "kernelats/prelude/CATS/arrayptr.cats"
#include "kernelats/prelude/CATS/arrayref.cats"
//
/* ****** ****** */
/*
#include <stdint.h>
#include "kernelats/prelude/CATS/integer_fixed.cats"
*/
/* ****** ****** */

#endif // end of [COMPCERT_PATS_CCOMP_H]

/* ****** ****** */

/* end of [pats_ccomp.h] */
