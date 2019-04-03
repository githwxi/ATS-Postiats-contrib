/* ****** ****** */
/*
Let's draw a bit more
*/
/* ****** ****** */

difference()
{
  cube(30, center=true);
  sphere(20);
}

translate([0, 0, -15])
{
  cylinder(h=30, r=10);
}

/* ****** ****** */

/* end of [test02.scad] */
