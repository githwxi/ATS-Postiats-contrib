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
$mycode = $_REQUEST["program_input"];
$mycode_res = patsopt_atscc2js_code_0_($mycode);
$compres = $mycode_res[0]; // 0/1: success/failure
//
?>

<html>
<head>
<title>TUTORATS-patsopt-atscc2js-trial</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script>
function
program_output_eval()
{
  var compres = 
    parseInt(document.getElementById("compres").value);
  if(compres > 0)
  {
    alert("The generated code cannot be evaluated!");
  }
  if(compres===0)
  {
    eval(document.getElementById("program_output").value);
  }
  return;
} /* end of [program_output_eval] */
</script>
<?php
if(compres > 0) echo "<!--\n";
?>
<script
src="http://www.ats-lang.org/LIBRARY/contrib/libatscc/libatscc2js/libatscc2js_all.js"></script>
<?php if(compres > 0) echo "-->\n"; ?>
</head>
<body>

<h1>
Patsopt/Atscc2js as a service
</h1>

<h2>Output Form</h2>
<form>
<?php
echo "<param id=\"compres\" value=\"$compres\">\n";
?>
<table border=0>
<tr bgcolor="#cccccc">
<td>
<br>
The JS code generated from the given ATS source:
<br>
<br>
<TEXTAREA ID="program_output" ROWS="24" COLS="80">
<?php
$i = 0;
foreach ($mycode_res as $file)
{
  if ($i===0) { $i += 1; continue; }
  if ($i >= 2) echo "\n\n"; $i += 1; echo $file;
}
?>
</TEXTAREA>
</td>
</tr>
<tr>
  <td align=left>
    <button type="button" onclick="program_output_eval()">Submit-for-Evaluation(JS)</button>
  <td>
</tr>
</table>
</form>

<hr>

<table>
<tr>
<td style="width: 100%;">
This page is created with
<a href="http://www.ats-lang.org">ATS</a>
by
<a href="http://www.cs.bu.edu/~hwxi/">Hongwei Xi</a>
and also maintained by
<a href="http://www.cs.bu.edu/~hwxi/">Hongwei Xi</a>.
</td>
<td style="width: 0%;"><!--pushed to the right-->
<a href="http://sourceforge.net">
<img
src="http://sflogo.sourceforge.net/sflogo.php?group_id=205722&amp;type=2"
width="120"
height="36"
alt="SourceForge.net Logo"
/>
</a>
</td>
</tr>
</table>

</body>
</html>
