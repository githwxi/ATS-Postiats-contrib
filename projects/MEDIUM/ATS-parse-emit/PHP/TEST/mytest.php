<?php
//
include './fact_dats.php';
include './fact2_dats.php';
include './fibats_dats.php';
include './acker_dats.php';
include './isevn_dats.php';
include './twice_dats.php';
include './rtfind_dats.php';
include './rtfind2_dats.php';
require './libatscc2php/CATS/basics_cats.php';
require './libatscc2php/CATS/integer_cats.php';
require './libatscc2php/CATS/string_cats.php';
//
echo "fact(10) = "; echo fact(10); echo "\n"; flush();
echo "fact2(10) = "; echo fact2(10); echo "\n"; flush();
echo "fibats(20) = "; echo fibats(20); echo "\n"; flush();
echo "acker(3, 3) = "; echo acker(3, 3); echo "\n"; flush();
echo "isevn(1000) = "; echo isevn(1000); echo "\n"; flush();
echo "isodd(1001) = "; echo isodd(1001); echo "\n"; flush();
//
twice_test();
rtfind_test();
rtfind2_test();
//
?>
