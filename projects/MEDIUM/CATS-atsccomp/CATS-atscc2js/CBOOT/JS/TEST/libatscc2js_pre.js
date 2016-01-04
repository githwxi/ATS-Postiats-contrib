/*
** For using libatscc2js
*/

/* ****** ****** */

var
the_libatscc2js_stdout_store = [];
var
the_libatscc2js_stderr_store = [];

/* ****** ****** */
//
function
libatscc2js_fprint_stdout(x)
  { the_libatscc2js_stdout_store.push(String(x)); return; }
function
libatscc2js_fprint_stderr(x)
  { the_libatscc2js_stderr_store.push(String(x)); return; }
//
/* ****** ****** */

function
libatscc2js_stdout_store_join()
{
//
  var res =
  the_libatscc2js_stdout_store.join("\n");
//
  the_libatscc2js_stdout_store = []; return res;
//
} /* end of [the_libatscc2js_stdout_store_join] */

function
libatscc2js_stderr_store_join()
{
//
  var res =
  the_libatscc2js_stderr_store.join("\n");
//
  the_libatscc2js_stderr_store = []; return res;
//
} /* end of [the_libatscc2js_stdout_store_join] */

/* ****** ****** */
//
function
libatscc2js_stdout_store_clear()
  { the_libatscc2js_stdout_store = []; return; }
function
libatscc2js_stderr_store_clear()
  { the_libatscc2js_stderr_store = []; return; }
//
/* ****** ****** */
//
if
(!Module)
{
  Module = {};
}
//
if
(!Module['preRun'])
{
  Module['preRun'] = [];
}
//
if
(!Module['postRun'])
{
  Module['postRun'] = [];
}
//
/* ****** ****** */

Module['print'] = libatscc2js_fprint_stdout;
Module['printErr'] = libatscc2js_fprint_stderr;

/* ****** ****** */

/*
Module['preRun'].push
(
function()
{
  ENV.PATSHOME = '/PATSHOME';
  ENV.PATSHOMERELOC = '/PATSHOME';
}
);
*/

/* ****** ****** */

/*
Module['preRun'].push
(
  function(){return the_libatscc2js_preRun();}
);
Module['postRun'].push
(
  function(){return the_libatscc2js_postRun();}
);
*/

/* ****** ****** */
//
Module['_main'] =
function()
{
  return the_libatscc2js_main();
};
//
/* ****** ****** */

/*
Module['noInitialRun'] = true;
*/

/* ****** ****** */

Module['noExitRuntime'] = true;

/* ****** ****** */

/*
//
// set [ALLOW_MEMORY_GROWTH] to 1
//
Module['TOTAL_MEMORY'] = 256*1024*1024;
//
*/

/* ****** ****** */

/* end of [libatscc2js_pre.js] */
