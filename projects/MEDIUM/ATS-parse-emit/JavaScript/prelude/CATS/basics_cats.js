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

function
ATSCKiseqz(x) { return (x === 0); }
function
ATSCKisneqz(x) { return (x !== 0); }

/* ****** ****** */

function
ATSCKptrisnil(xs) { return (xs === null) ; }
function
ATSCKptriscons(xs) { return (xs !== null) ; }

/* ****** ****** */

function
ATSCKpat_int(tmp, given) { return (tmp===given) ; }
function
ATSCKpat_bool(tmp, given) { return (tmp===given) ; }
function
ATSCKpat_char(tmp, given) { return (tmp===given) ; }
function
ATSCKpat_float(tmp, given) { return (tmp===given) ; }

/* ****** ****** */

function
ats2jspre_print_obj(obj)
{
  process.stdout.write(x.toString()) ; return ;
}

/* ****** ****** */
//
function
ats2jspre_print_newline()
  { process.stdout.write('\n') ; return ; }
function
ats2jspre_prerr_newline()
  { process.stderr.write('\n') ; return ; }
//
/* ****** ****** */

/* end of [basics_cats.js] */
