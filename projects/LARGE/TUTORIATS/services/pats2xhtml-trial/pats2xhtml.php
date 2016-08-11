<?php
//
require './libatscc2php/CATS/basics_cats.php';
require './libatscc2php/CATS/integer_cats.php';
//
require './libatscc2php/CATS/float_cats.php';
require './libatscc2php/CATS/string_cats.php';
require './libatscc2php/CATS/filebas_cats.php';
//
require './libatscc2php/CATS/PHPref_cats.php';
require './libatscc2php/CATS/PHParray_cats.php';
require './libatscc2php/CATS/PHParref_cats.php';
//
require './libatscc2php/DATS/list_dats.php';
require './libatscc2php/DATS/reference_dats.php';
//
require './libtutoriats0/PHP/CATS/basics_cats.php';
//
require './DATS_PHP/inputform_process_php_dats.php';
//
putenv("PATSHOME=/home/project-web/ats-lang/ATS-Postiats");
putenv("PATSHOMERELOC=/home/project-web/ats-lang/ATS-Postiats-contrib");
//
$mycode =
rawurldecode($_REQUEST["program_input"]);
$mycode_res = pats2xhtml_code_0_(1, $mycode);
echo rawurldecode(json_encode($mycode_res));
//
?>
