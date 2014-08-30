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
* beg of [basics_cats.php]
******
*/

/* ****** ****** */

function
ATSCKiseqz($x) { return ($x == 0); }
function
ATSCKisneqz($x) { return ($x != 0); }

/* ****** ****** */

function
ATSCKptrisnil($xs) { return (xs == NULL) ; }
function
ATSCKptriscons($xs) { return (xs != NULL) ; }

/* ****** ****** */

function
ATSCKpat_int($tmp, $given) { return ($tmp==$given) ; }
function
ATSCKpat_bool($tmp, $given) { return ($tmp==$given) ; }
function
ATSCKpat_char($tmp, $given) { return ($tmp==$given) ; }
function
ATSCKpat_float($tmp, $given) { return ($tmp==$given) ; }

/* ****** ****** */

function
ats2phppre_print_newline() { print("\n"); flush(); return; }

/* ****** ****** */

/* end of [basics_cats.php] */

?>
