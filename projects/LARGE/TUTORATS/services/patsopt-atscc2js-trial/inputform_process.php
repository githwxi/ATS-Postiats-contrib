<!DOCTYPE html>
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
require './libtutorats0/PHP/CATS/basics_cats.php';
//
require './DATS_PHP/inputform_process_dats.php';
//
putenv("PATSHOME=/home/project-web/ats-lang/ATS-Postiats");
putenv("PATSHOMERELOC=/home/project-web/ats-lang/ATS-Postiats-contrib");
//
?>

<?php
//
$mycode = $_REQUEST["program_content"];
$mycode_res = patsopt_atscc2js_code_0_($mycode);
//
?>

<html>
<head>
<title>TUTORATS-patsopt-trial</title>
<?php
if($mycode_res[0] > 0) echo "<!--\n";
?>
<script
 src="http://www.ats-lang.org/LIBRARY/contrib/libatscc2js/CATS/basics_cats.js"></script>
<script
 src="http://www.ats-lang.org/LIBRARY/contrib/libatscc2js/CATS/integer_cats.js"></script>
<script
 src="http://www.ats-lang.org/LIBRARY/contrib/libatscc2js/CATS/float_cats.js"></script>
<script
 src="http://www.ats-lang.org/LIBRARY/contrib/libatscc2js/CATS/string_cats.js"></script>
<script
 src="http://www.ats-lang.org/LIBRARY/contrib/libatscc2js/CATS/JSarray_cats.js"></script>
<script src="http://www.ats-lang.org/LIBRARY/contrib/libatscc2js/DATS/list_dats.js"></script>
<?php
if($mycode_res[0] > 0) echo "-->\n";
?>
</head>

<body>

<?php
if($mycode_res[0]===0)
{
  echo "<script>\n";
  echo $mycode_res[1];
  echo "</script>\n";
}
?>

<pre>
<?php
//
$i = 0;
{
  echo "<pre>\n";
  foreach ($mycode_res as $file)
  {
    if ($i===0) { $i += 1; continue; }
    if ($i >= 2) echo "\n\n"; $i += 1; echo $file;
  }
  echo "</pre>\n";
}
//
?>
</pre>

</body>

</html>
