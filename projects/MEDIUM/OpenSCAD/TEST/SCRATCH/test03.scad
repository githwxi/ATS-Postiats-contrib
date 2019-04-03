/* ****** ****** */
/*
Let's draw a bit more
*/
/* ****** ****** */

width=40;
height=60;
bottom_thickness=2;
wall_thickness=5;

difference()
{
  intersection()
  {
    cube([width,width,height], center=true);
    scale([1,1,height/width]) // so that Z=1 is now...
    sphere(width/2 * sqrt(2)); // close to the cuboid edges
  }
  translate([0,0,-height/2+bottom_thickness])
  cylinder(r=width/2-wall_thickness,h=height+0.1);
}

/* ****** ****** */

/* end of [test03.scad] */
