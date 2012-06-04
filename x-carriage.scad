// PRUSA iteration3
// X carriage
// GNU GPL v3
// Josef Průša <josefprusa@me.com>
// Václav 'ax' Hůla <axtheb@gmail.com>
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>
use <bushing.scad>

carriage_l = 70;

//upper (long) bearing
translate([0,0,0])  rotate([0,0,180]) {
    if (bearing_choice == 2) {
        linear_bearing(carriage_l, fillet = true);
        %linear_bushing(carriage_l);
    } else {
        linear_bushing(carriage_l);
        %linear_bearing(carriage_l);
    }
}

//lower bearing
translate([45,0,0]) {
    if (bearing_choice == 2) {
        linear_bearing(30);
        %linear_bushing(25);
    } else {
        linear_bushing(25);
        %linear_bearing(30);
    }
}

// main plate
difference(){
    translate([7,-9,0]) cube_fillet([45-18+4,5,carriage_l], radius=2);
    #translate([55,-17.5, 67]) rotate([0,70,0]) cube([80,60,60], center = true);
}

/*
// mounting plate
difference(){
    translate([2.5-13.8/2, -17.5,35]) cube([5,35,carriage_l], center = true);
    translate([2.5-13.8/2, -17.5,35]) cube([7,25,25], center = true);
    translate([0,-17.5, 35-25]) rotate([0,-90,0]) cylinder(h = 80, r=2.5, $fn=30);
    translate([0,-17.5, 35+25]) rotate([0,-90,0]) cylinder(h = 80, r=2.5, $fn=30);
}
*/

translate([45/2,0,0]){

    // belt dummy
    %translate([0,0,carriage_l/2]) cube([20,6,carriage_l], center = true);

    //belt flat side
    translate([-11,0,carriage_l/2]) cube_fillet([2,14,carriage_l], vertical = [3,0,0,0], center = true);

    difference(){
        translate([-5.5,0,carriage_l/2]) cube_fillet([7,14,carriage_l], vertical = [2,2,0,0], center = true);
        translate([-5.5,0,carriage_l/2]) cube([9,10,40], center = true);

        intersection() {
            for (i = [0 : carriage_l/belt_tooth_distance])
            {
                translate([-8.5, 0, 1+i*belt_tooth_distance]) cube([2, 10, belt_tooth_distance*belt_tooth_stride], center = true);
            }
            translate([0, 0, carriage_l/2]) cube([20, 10, carriage_l], center = true);
        }
    }

}
