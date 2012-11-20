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

carriage_l = 86;
carriage_hole_to_side = 3;
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
                translate([14,-10.5,0]) cube_fillet([xaxis_rod_distance - 22,6.5,carriage_l], radius=2);
                translate([6.5,-10.5,0]) cube_fillet([11,6.5,29], radius=2);

                //translate([55,-17.5, 67]) rotate([0,70,0]) cube([80,60,60], center = true);
                //}

                //reduce springiness

                translate([6.5,5,20]) cube([xaxis_rod_distance - 13,5,8]);


            translate([20,0,carriage_hole_to_side]) {
                rotate([90,0,0]) cylinder(r=(carriage_hole_to_side > 5 ? 5 : carriage_hole_to_side), h=12, center=true);
                }
            translate([20,0,carriage_l - carriage_hole_to_side]) {
               rotate([90,0,0]) cylinder(r=(carriage_hole_to_side > 5 ? 5 : carriage_hole_to_side), h=12, center=true);
                }

                translate([45/2,0,0]){

                    // belt dummy
                    %translate([0,0,carriage_l/2]) cube([20,6,carriage_l], center = true);

                    //belt flat side
*                   difference() {
                    translate([-13.5,0,carriage_l/2]) cube_fillet([7,14,carriage_l], vertical = [3,3,0,0], center = true);
                    translate([-45/2,0,0]) bushing_negative();
                    }

                    difference(){
                        translate([-3.0,0,carriage_l/2]) cube_fillet([11,14,carriage_l], vertical = [2,2,0,0], center = true);
                        translate([-3.5,0,(carriage_l+38)/2]) cube([13,10,8], center = true);
                        translate([-8.5, 0, 0]) cube([2, 10, 28*2+1], center = true);
                        translate([0,0,28]) intersection() {
                            for (i = [0 : (carriage_l-28)/belt_tooth_distance])
                            {
                                translate([-8.5, 0, 1+i*belt_tooth_distance]) cube([2, 10, belt_tooth_distance*belt_tooth_ratio], center = true);
                            }
                            translate([0, 0, carriage_l/2]) cube([20, 10, carriage_l], center = true);
                        }
                    }

                }
            }
            // extruder mounts
            
            translate([20,-2,carriage_hole_to_side]) {
                rotate([90,0,0]) cylinder(r=1.8, h=22, center=true);
                translate([0,9,0]) rotate([90,60,0]) cylinder(r=3.6, h=5, $fn=6, center=true);
            }
            translate([20,-2,carriage_hole_to_side+30]) {
                rotate([90,0,0]) cylinder(r=1.8, h=22, center=true);
                translate([0,9,0]) rotate([90,60,0]) cylinder(r=3.6, h=5, $fn=6, center=true);
            }
            translate([20,-2,carriage_hole_to_side+30+20]) {
                rotate([90,0,0]) cylinder(r=1.8, h=22, center=true);
                translate([0,9,0]) rotate([90,60,0]) cylinder(r=3.6, h=5, $fn=6, center=true);
            }
            translate([20,-2,carriage_hole_to_side+30+20+30]) {
                rotate([90,0,0]) cylinder(r=1.8, h=22, center=true);
                translate([0,9,0]) rotate([90,60,0]) cylinder(r=3.6, h=5, $fn=6, center=true);
            }

            
            // belt clamp mounts
            translate([20,-10.5,carriage_l-14]) belt_clamp_nut();
            translate([20,-10.5,carriage_l-44]) belt_clamp_nut();

            
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

module belt_clamp_nut() {
    #translate([0,0,m3_nut_diameter/-2]) cube([2.5,m3_nut_diameter_bigger,m3_nut_diameter+0.3]);
    translate([0,m3_nut_diameter_bigger/2,0]){
        #rotate([0, 90,0]) cylinder(r=3.5/2,h=10,$fn=32);
        rotate([0,-90,0]) cylinder(r=3.5/2,h=30,$fn=32);
    }
}
module x_beltclamp(){
    translate([2,0,0]) difference(){
        cube_fillet([carriage_l-32-30,17,7]);
        translate([carriage_l-32-30,m3_nut_diameter_bigger,0]/2){
            cylinder(r=3.4/2,h=30);
            translate([0,0,7]) mirror([0,0,1]) screw(slant=false,r=1.7,head_drop=3);

        }
    }
}

module lme8uu(){
    difference(){
        cylinder(r=8,h=25);
        translate([0,0,-0.1]) cylinder(r=4, h=25.2);
    
    }

}

//#translate([0,0,2]) lme8uu();
//#translate([-xaxis_rod_distance,0,2]) lme8uu();
//translate([0,0,-10]) cylinder(r=4,h=100);
//translate([-xaxis_rod_distance,0,-10]) cylinder(r=4,h=100);


x_carriage();
translate([carriage_l/-2-10,12,0]) x_beltclamp();
translate([carriage_l/-2+17,12,0]) x_beltclamp();

%translate([-13,-10,carriage_l]) rotate([90,90,90]) x_beltclamp();
%translate([-13,-10,carriage_l-30]) rotate([90,90,90]) x_beltclamp();

//holding_plate();
