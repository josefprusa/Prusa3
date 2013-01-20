// PRUSA iteration3
// Bearing guide
// GNU GPL v3
// Josef Průša <josefprusa@me.com>
// Václav 'ax' Hůla <axtheb@gmail.com>
// Original design by Greg Frost
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel


/**
 * Helps to hold belt aligned on the bearing.
 * @id bearing-guide
 * @name Bearing guide
 * @category Printed
 */

include <configuration.scad>

thickness=1;
height=7+thickness;
wall_ascent=5;
wall_descent=0.5;

module inner()
{
    difference()
    {
        cylinder(r=idler_size/2+single_wall_width*2,h=height);
        translate([0,0,-1])
            cylinder(r=idler_size/2,h=height+2);
    }

    difference()
    {
        cylinder(r=idler_size/2+wall_ascent,h=thickness);
        translate([0,0,-1])
            cylinder(r=idler_size/2-wall_descent,h=thickness+2);
    }
}

module outer()
{
    difference()
    {
        cylinder(r=idler_size/2+2*single_wall_width*2+0.2,h=height);
        translate([0,0,-1])
            cylinder(r=idler_size/2+single_wall_width*2+0.2,h=height+2);
    }

    difference()
    {
        cylinder(r=idler_size/2+wall_ascent,h=thickness);
        translate([0,0,-1])
            cylinder(r=idler_size/2-wall_descent,h=thickness+2);
    }
}

inner();
translate([idler_size+2*wall_ascent+2,0,0])
    outer();

translate([0,idler_size+2*wall_ascent+2,0]){
inner();
translate([idler_size+2*wall_ascent+2,0,0])
    outer();
}
