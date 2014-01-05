// PRUSA iteration3
// Bearing guide
// GNU GPL v3
// Josef Průša <josefprusa@me.com>
// Václav 'ax' Hůla <axtheb@gmail.com>
// Original design by Greg Frost
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/josefprusa/Prusa3

// ThingDoc entry
/**
 * @description Helps to hold belt aligned on the bearing.
 * @id bearing-guide
 * @name Bearing guide
 * @category Printed
 */

include <../configuration.scad>
include <functions.scad>

//guiding_wall_thickness of guiding wall
guiding_wall_thickness=layer_height * 4;


height = max(belt_width, idler_bearing[1]) + guiding_wall_thickness;
//How much the guiding wall overlaps the bearing wall (to the center)
wall_descent = 1;

module bearing_guide_inner(){
    //inner (smaller) part of the guide
    difference(){
        cylinder(r=idler_bearing[0] / 2 + single_wall_width * 3, h=height - (max( idler_bearing[1], belt_width) - idler_bearing[1]) / 2);
        translate([0, 0, -1])
            cylinder(r=idler_bearing[0] / 2, h=height + 2);
    }

    difference(){
        union() {
            cylinder(r=idler_assy_r_outer(idler_bearing), h=guiding_wall_thickness);  //guide wall
            cylinder(r=idler_bearing[0] / 2, h=guiding_wall_thickness + (belt_width - idler_bearing[1])/2);  //this centers the guide on bearing
        }
        translate([0,0,-1])
            cylinder(r=idler_bearing[0] / 2 - wall_descent, h=guiding_wall_thickness + 10);
    }
}

module bearing_guide_outer(){
    difference(){
        cylinder(r=idler_bearing[0] / 2 + 6 * single_wall_width + 0.2, h=height);
        translate([0,0,-1])
            cylinder(r=idler_bearing[0] / 2 + single_wall_width * 3, h=height + 2);
    }

    difference(){
        union(){
            cylinder(r=idler_assy_r_outer(idler_bearing), h=guiding_wall_thickness);
            cylinder(r=idler_bearing[0] / 2, h=guiding_wall_thickness + (belt_width - idler_bearing[1])/2);
        }
        translate([0,0,-1])
cylinder(r=idler_bearing[0]/2-wall_descent, h=height + 5);
    }
}

module bearing_assy(){

    bearing_guide_inner();
    translate([idler_assy_r_outer(idler_bearing) * 2 + 2, 0, 0])
        bearing_guide_outer();
}

bearing_assy();
