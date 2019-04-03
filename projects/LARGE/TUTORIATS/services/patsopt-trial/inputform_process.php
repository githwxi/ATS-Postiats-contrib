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
require './libtutoriats0/PHP/CATS/basics_cats.php';
//
require './DATS_PHP/inputform_process_dats.php';
//
putenv("PATSHOME=/home/project-web/ats-lang/ATS-Postiats");
putenv("PATSHOMERELOC=/home/project-web/ats-lang/ATS-Postiats-contrib");
//
?>

<?php
/*
$mycode = 'implement main0 () = ()';
*/
$mycode = $_REQUEST["program_input"];
$mycode_res = patsopt_code_0_($mycode);
$mycode_res = json_encode ($mycode_res);
$mycode_res2 = preg_replace("!\\\\!", "\\\\\\\\", $mycode_res);
//
?>

<html>
<head>
<title>TUTORIATS-patsopt-trial</title>
</head>

<body>

<script>
//
var mycode_res2 =
  '<?php echo $mycode_res2 ?>'
//
var mycode_arr2 = JSON.parse(mycode_res2);
//
alert(mycode_arr2.toSource());
//
</script>

<pre>
<?php
//
$mycode_arr = json_decode ($mycode_res);
//
$i = 0;
foreach ($mycode_arr as $element)
{
  if ($i > 0) echo "\n\n"; $i += 1; echo $element;
}
//
?>
</pre>

</body>

</html>

