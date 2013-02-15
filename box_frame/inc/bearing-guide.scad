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

include <../configuration.scad>

//thickness of guiding wall
thickness=1;

belt_width = 7;
height = belt_width + thickness;
//height of the guiding wall, from beraring surface
wall_ascent = 4.5;
//guiding wall extends to sides of bearing too
wall_descent = 1;

module bearing_guide_inner()
{
    difference(){
        cylinder(r=idler_bearing[0] / 2 + single_wall_width * 2, h=height - (belt_width - idler_bearing[1])/2);
        translate([0,0,-1])
            cylinder(r=idler_bearing[0]/2,h=height+2);
    }

    difference(){
        union() {
            cylinder(r=idler_bearing[0] / 2 + wall_ascent, h=thickness);
            cylinder(r=idler_bearing[0] / 2, h=thickness + (belt_width - idler_bearing[1])/2);
        }
        translate([0,0,-1])
            cylinder(r=idler_bearing[0]/2-wall_descent,h=thickness+10);
    }
}

module bearing_guide_outer()
{
    difference(){
        cylinder(r=idler_bearing[0]/2+2*single_wall_width*2+0.2,h=height);
        translate([0,0,-1])
            cylinder(r=idler_bearing[0]/2+single_wall_width*2+0.2,h=height+2);
    }

    difference(){
        union(){
            cylinder(r=idler_bearing[0]/2+wall_ascent,h=thickness);
            cylinder(r=idler_bearing[0] / 2, h=thickness + (belt_width - idler_bearing[1])/2);
        }
        translate([0,0,-1])
            cylinder(r=idler_bearing[0]/2-wall_descent,h=thickness+2);
    }
}

if (idler_bearing[3] == 1) {

    translate([0,idler_bearing[0]+2*wall_ascent+2,0]){
        bearing_guide_inner();
        translate([idler_bearing[0]+2*wall_ascent+2,0,0])
            bearing_guide_outer();

    }
} else {
    cube([0.1,0.1,0.1]);
    echo ("None");
}
