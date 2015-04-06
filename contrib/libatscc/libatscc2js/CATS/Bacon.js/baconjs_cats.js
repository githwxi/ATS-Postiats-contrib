/*
******
*
* HX-2015-04:
* for JavaScript code
* translated from ATS
*
******
*/

/*
******
* beg of [baconjs_cats.js]
******
*/

/* ****** ****** */

function
ats2js_bacon_EStream_map(xs, f)
{
  return xs.map(function(x){return ats2jspre_cloref1_app(f, x);});
}

/* ****** ****** */

function
ats2js_bacon_EStream_scan(xs, ini, f)
{
  return
  xs.scan(ini, function(y, x){return ats2jspre_cloref2_app(f, y, x);});
}

/* ****** ****** */
//
function
ats2js_bacon_EStream_merge2(xs1, xs2) { return Bacon.mergeAll(xs1, xs2); }
//
/* ****** ****** */
//
function
ats2js_bacon_EStream_toProperty(xs, ini) { return xs.toProperty(ini); }
//
/* ****** ****** */

/* end of [baconjs_cats.js] */
