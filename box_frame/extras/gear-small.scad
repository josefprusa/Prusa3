// Herringbone extruder gears
// GNU GPL v3
// Václav 'ax' Hůla <axtheb@gmail.com>
// Josef Průša <josefprusa@me.com>

include <../configuration.scad>
use <inc/parametric_involute_gear_v5.0.scad>

small();
%translate([40, 0, 0]) rotate([0, 180, 180]) big(); //this should touch, teeth should mesh

gear_width=14;
teeth_small=13;
teeth_big=37;
teeth_twist=320;
circular_pitch=288;

module small(){
    difference() {
        union() {
            mirror([ 0, 0, 1 ]) gear (number_of_teeth=teeth_small,
                    circular_pitch=circular_pitch,
                    gear_thickness = gear_width/2,
                    rim_thickness = gear_width/2,
                    hub_thickness = 0,
                    hub_diameter = 18,
                    bore_diameter = 5.25,
                    circles=0,
                    twist = teeth_twist/teeth_small);
            gear (number_of_teeth=teeth_small,
                    circular_pitch=circular_pitch,
                    gear_thickness = gear_width/2,
                    rim_thickness = gear_width/2,
                    hub_thickness = 0,
                    hub_diameter = 18,
                    bore_diameter = 5.25,
                    circles=0,
                    twist = teeth_twist/teeth_small);
            //hub. Two part to make it thicker
            translate([0, 0, gear_width / 2]) {
                cylinder(r1=8.5, r2=11, h=3);
            }
            translate([0, 0, gear_width / 2 + 3]) {
                cylinder(r=11, h=6);
            }
        }
        //bore
        translate([0, 0, -gear_width / 2 + 0.1]) cylinder(r=5.25 / 2, h=gear_width + 9.2);

        translate([0, 0, gear_width / 2 + 4.5]) rotate([0, 90, 0]) {
            cylinder(r=m3_diameter / 2, h=20);
            translate([0, 0, 5]) nut(m3_nut_diameter, 2.5, false);
            translate([-10, -m3_nut_diameter / 2, 5]) cube([10, m3_nut_diameter, 2.5]);
        }
    }
}

hole_size=6.6;

module big(){
    difference() {
        union(){
            mirror([0, 0, 1]) gear (number_of_teeth=teeth_big,
                    circular_pitch=circular_pitch,
                    gear_thickness = gear_width/2,
                    rim_thickness = gear_width/2,
                    hub_thickness = 0,
                    hub_diameter = 18,
                    bore_diameter = 18,
                    circles=0,
                    twist = teeth_twist/teeth_big);
            gear (number_of_teeth=teeth_big,
                    circular_pitch=circular_pitch,
                    gear_thickness = 0,
                    rim_thickness = gear_width/2,
                    hub_thickness = 0,
                    hub_diameter = 18,
                    bore_diameter = 18,
                    circles=0,
                    twist = teeth_twist/teeth_big);
        }
        //reduce mass
        translate([0, 0, layer_height * 9 - gear_width / 2]) rotate([0, 0, 90]) cylinder(r1=23.4, r2=23.4, h=gear_width - layer_height * 9 + 1, $fn=18);
        //bore
        translate([0, 0, -gear_width / 2 - 0.1]) cylinder(r=m8_diameter / 2, h=gear_width + 9.2);
        for (hole=[0:5]) {
            rotate([0, 0, 360 / 6 * hole + 30]) translate([17,0,-10]) rotate(12) {
                cylinder(r=hole_size, h=20);
                cube([hole_size, hole_size, 20]);
            }
        }

    }
    //threaded bolt trap
    difference(){
        translate([0, 0, -gear_width / 2]) cylinder(r=10, h=4 + layer_height * 9);
        translate([0, 0, -gear_width / 2 + layer_height * 6]) nut(13.3, h=10);
        translate([0, 0, -gear_width / 2 - 0.1]) cylinder(r=m8_diameter / 2, h=gear_width + 9.2);
    }

}
