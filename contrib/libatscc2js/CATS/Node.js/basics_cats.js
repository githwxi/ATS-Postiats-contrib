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
** This part is based on Node.js
*/

/* ****** ****** */
//
function
ats2nodejs_print_newline()
  { process.stdout.write('\n'); return; }
function
ats2nodejs_prerr_newline()
  { process.stderr.write('\n'); return; }
//
function
ats2nodejs_fprint_newline(out) { out.write('\n'); return; }
//
/* ****** ****** */

function
ats2nodejs_print_obj(x)
{
  process.stdout.write(x.toString()); return;
}
function
ats2nodejs_prerr_obj(x)
{
  process.stderr.write(x.toString()); return;
}

/* ****** ****** */
//
function
ats2nodejs_print_int(x)
{
  process.stdout.write(x.toString()); return;
}
function
ats2nodejs_prerr_int(x)
{
  process.stderr.write(x.toString()); return;
}
function
ats2nodejs_fprint_int(out, x) { out.write(x.toString()); return; }
//
/* ****** ****** */
//
function
ats2nodejs_print_string(x)
  { process.stdout.write(x); return; }
function
ats2nodejs_prerr_string(x)
  { process.stderr.write(x); return; }
function
ats2nodejs_fprint_string(out, x) { out.write(x); return; }
//
/* ****** ****** */
//
function
ats2nodejs_assert_bool0(tfv)
  { if (!tfv) process.exit(1); return; }
function
ats2nodejs_assert_bool1(tfv)
  { if (!tfv) process.exit(1); return; }
//
function
ats2nodejs_assert_errmsg_bool0(tfv, errmsg)
{
  if (!tfv) { process.stderr.write(errmsg); process.exit(1); }; return;
}
function
ats2nodejs_assert_errmsg_bool1(tfv, errmsg)
{
  if (!tfv) { process.stderr.write(errmsg); process.exit(1); }; return;
}
//
/* ****** ****** */

/* end of [basics_cats.js] */
