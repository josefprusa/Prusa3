// PRUSA iteration3
// X carriage
// GNU GPL v3
// Josef Průša <josefprusa@me.com>
// Václav 'ax' Hůla <axtheb@gmail.com>
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>
use <bushing.scad>
// mounting plate
use <extras/groovemount.scad>

carriage_l = 74;
hole_to_side = 5;
hole_height = 4;


module x_carriage(){
    mirror([1,0,0]) {
        difference() {
            union() {
                //upper bearing
                rotate([0,0,180]) {
                    if (bearing_choice == 2) {
                        linear_bearing(fillet = true);
                    } else {
                        linear_bushing(27);
                    }
                }

                //lower bearing
                translate([xaxis_rod_distance,0,0]) {
                    if (bearing_choice == 2) {
                        linear_bearing(carriage_l, fillet = true);
                    } else {
                        linear_bushing(carriage_l);
                    }
                }

                // main plate
                //difference(){
                translate([5.5,-10,0]) cube_fillet([xaxis_rod_distance - 11,5,carriage_l], radius=2);
                //translate([55,-17.5, 67]) rotate([0,70,0]) cube([80,60,60], center = true);
                //}

                //reduce springiness

                translate([6,5,20]) cube([xaxis_rod_distance - 13,5,8]);


            translate([20,0,hole_to_side]) {
                rotate([90,0,0]) cylinder(r=(hole_to_side > 5 ? 5 : hole_to_side), h=12, center=true);
                }
            translate([20,0,carriage_l - hole_to_side]) {
               rotate([90,0,0]) cylinder(r=(hole_to_side > 5 ? 5 : hole_to_side), h=12, center=true);
                }

                translate([45/2,0,0]){

                    // belt dummy
                    %translate([0,0,carriage_l/2]) cube([20,6,carriage_l], center = true);

                    //belt flat side
                    difference() {
                    translate([-13.5,0,carriage_l/2]) cube_fillet([7,14,carriage_l], vertical = [3,3,0,0], center = true);
                    translate([-45/2,0,0]) bushing_negative();
                    }

                    difference(){
                        translate([-3.5,0,carriage_l/2]) cube_fillet([11,14,carriage_l], vertical = [2,2,0,0], center = true);
#translate([-3.5,0,carriage_l/2]) cube([13,10,40], center = true);

                        intersection() {
                            for (i = [0 : carriage_l/belt_tooth_distance])
                            {
                                translate([-8.5, 0, 1+i*belt_tooth_distance]) cube([2, 10, belt_tooth_distance*belt_tooth_stride], center = true);
                            }
                            translate([0, 0, carriage_l/2]) cube([20, 10, carriage_l], center = true);
                        }
                    }

                }
            }
            #translate([20,-2,hole_to_side]) {
                rotate([90,0,0]) cylinder(r=2.2, h=22, center=true);
                translate([0,3,0]) rotate([90,90,0]) cylinder(r=9/2, h=hole_height, $fn=6, center=true);
                translate([0,3,-3]) cube([8,hole_height,8], center=true);
            }
            #translate([20,-2,carriage_l-hole_to_side]) {
                rotate([90,0,0]) cylinder(r=2.2, h=22, center=true);
                translate([0,3,0]) rotate([90,90,0]) cylinder(r=9/2, h=hole_height, $fn=6, center=true);
                translate([0,3,3]) cube([8,hole_height,8], center=true);
            }

        }
    }

    module holding_plate(){
        translate([13,-10,0]){
            difference(){
                translate([2.5-13.8/2, -17.5,35]) cube([5,35,carriage_l], center = true);
                translate([2.5-13.8/2, -17.5,35]) cube([7,25,25], center = true);
                translate([0,-17.5, 35-25]) rotate([0,-90,0]) cylinder(h = 80, r=2.5, $fn=30);
                translate([0,-17.5, 35+25]) rotate([0,-90,0]) cylinder(h = 80, r=2.5, $fn=30);
            }

            %translate([-7, -18 ,carriage_l/2]) rotate([-90,0,90]) groovemount();
        }
    }
}

x_carriage();
//holding_plate();
