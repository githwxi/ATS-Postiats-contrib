<?php

/*
******
*
* HX-2014-08:
* for PHP code
* translated from ATS
*
******
*/

/*
******
* beg of [PHParray_cats.php]
******
*/

/* ****** ****** */
//
function
PHParray_nil() { return array(); }
//
function
PHParray_sing($x) { return array($x); }
//
function
PHParray_pair($x1, $x2) { return array($x1, $x2); }
//
/* ****** ****** */

function
PHParray_copy
(
  $A
) {
  $A2 = array();
  foreach ($A as $k => $v) { $A2[$k] = $v; }; return A2;
} // end of [PHParray_copy]

/* ****** ****** */

/* end of [PHParray_cats.php] */

?>
