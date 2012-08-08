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
carriage_hole_to_side = 5;
carriage_hole_height = 4;


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
                translate([14,-10,0]) cube_fillet([xaxis_rod_distance - 19,6,carriage_l], radius=2);
                translate([5.5,-10,0]) cube_fillet([xaxis_rod_distance - 11,6,28], radius=2);

                //translate([55,-17.5, 67]) rotate([0,70,0]) cube([80,60,60], center = true);
                //}

                //reduce springiness

                translate([6,5,20]) cube([xaxis_rod_distance - 13,5,8]);


            translate([20,0,carriage_hole_to_side]) {
                rotate([90,0,0]) cylinder(r=(carriage_hole_to_side > 5 ? 5 : carriage_hole_to_side), h=12, center=true);
                }
            translate([20,0,carriage_l - carriage_hole_to_side]) {
               rotate([90,0,0]) cylinder(r=(carriage_hole_to_side > 5 ? 5 : carriage_hole_to_side), h=12, center=true);
                }

                translate([45/2,0,0]){

                    //belt flat side
*                    difference() {
                    translate([-13.5,0,carriage_l/2]) cube_fillet([7,14,carriage_l], vertical = [3,3,0,0], center = true);
                    translate([-45/2,0,0]) bushing_negative();
                    }

                    difference(){
                        translate([-3.0,0,carriage_l/2]) cube_fillet([11,14,carriage_l], vertical = [2,2,0,0], center = true);
                        #translate([-3.5,0,(carriage_l+28)/2]) cube([13,10,20], center = true);
                        translate([-8.5, 0, 0]) cube([2, 10, 28*2+1], center = true);
                    }

                }
            }
            #translate([20,-2,carriage_hole_to_side]) {
                rotate([90,0,0]) cylinder(r=2.2, h=22, center=true);
                translate([0,3,0]) rotate([90,90,0]) cylinder(r=9/2, h=carriage_hole_height, $fn=6, center=true);
                translate([0,3,-3]) cube([8,carriage_hole_height,8], center=true);
            }
            #translate([20,-2,carriage_l-carriage_hole_to_side]) {
                rotate([90,0,0]) cylinder(r=2.2, h=22, center=true);
                translate([0,3,0]) rotate([90,90,0]) cylinder(r=9/2, h=carriage_hole_height, $fn=6, center=true);
                translate([0,3,3]) cube([8,carriage_hole_height,8], center=true);
            }
#            translate([20,-10,(carriage_l+28)/2]) {
                translate([0,0,m3_nut_diameter/-2]) cube([2,m3_nut_diameter_bigger,m3_nut_diameter]);
                translate([0,m3_nut_diameter_bigger/2,0]){
                    rotate([0, 90,0]) cylinder(r=3.2/2,h=10);
                    rotate([0,-90,0]) cylinder(r=3.2/2,h=30);
                }
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

module x_beltclamp(){
    translate([2,0,0]) difference(){
        cube_fillet([carriage_l-32,17,7]);
        translate([carriage_l-32,m3_nut_diameter_bigger,0]/2){
            cylinder(r=3.2/2,h=30);
            translate([0,0,7]) mirror([0,0,1]) screw(slant=false,r=1.7,head_drop=3);
        }
        translate([0,17/2+1.5,0]){
            for(i=[2:(carriage_l-32)/belt_tooth_distance])
                translate([(i-0.5)*belt_tooth_distance,0,0])
                    translate([belt_tooth_distance*belt_tooth_stride,10,2]/-2)
                    cube([belt_tooth_distance*belt_tooth_stride,30,2]);
        }
    }
}

x_carriage();
translate([carriage_l/-2-10,12,0]) x_beltclamp();
%translate([-13,-10,carriage_l]) rotate([90,90,90]) x_beltclamp();
//holding_plate();
