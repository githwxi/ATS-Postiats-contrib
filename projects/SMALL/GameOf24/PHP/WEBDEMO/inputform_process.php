<html>
<head>
<title>Hongwei's Game-of-24 - Order Results</title>
</head>
<body>

<!--
<h1>PHP Info</h1>
<?php phpinfo() ?>
-->

<?php
//
include './DATS_PHP/GameOf24_php_dats.php';
//
require './libatscc2php/CATS/basics_cats.php';
require './libatscc2php/CATS/integer_cats.php';
//
require './libatscc2php/CATS/float_cats.php';
require './libatscc2php/CATS/string_cats.php';
require './libatscc2php/CATS/filebas_cats.php';
//
require './libatscc2php/CATS/PHParref_cats.php';
//
require './libatscc2php/DATS/list_dats.php';
//
?>

<h1>Game-of-24</h1>

<h2>Solutions for the input</h2>

<?php
//
$n1 = intval($_REQUEST["card1_val"]);
$n2 = intval($_REQUEST["card2_val"]);
$n3 = intval($_REQUEST["card3_val"]);
$n4 = intval($_REQUEST["card4_val"]);
//
echo "<p>\n";
echo "Solutions for the quad";
echo "(", $n1, ", ", $n2, ", ", $n3, ", ", $n4, ")";
echo " are listed as follows:";
echo "<br>\n";
echo "<br>\n";
//
echo "<pre>\n";
GameOf24_play2($n1, $n2, $n3, $n4);
echo "</pre>\n";
//
echo "</p>\n";
?>

<hr>

<?php
echo "<p>\n";
echo "The input is processed at "; echo date ("H:i, F jS, Y");
echo "</p>\n";
?>

</body>
</html>
