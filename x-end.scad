// PRUSA iteration3
// X ends
// GNU GPL v3
// Josef Průša <josefprusa@me.com>
// Václav 'ax' Hůla <axtheb@gmail.com>
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>
use <bushing.scad>
rod_distance = 45;

module x_end_motor(){

    x_end_idler([3,3,0,0], thru=false);
    /// motor dummy
    //%translate([21-5,-21-11,25]) cube([42,42,42], center = true);


    difference(){
        union(){
            translate([-13.5,-16,26]) cube_fillet([17,14,52], center = true, vertical=[0,0,3,3], top=[0,3,6,3]);
            translate([-10,-34,9]) intersection(){
                cube_fillet([10,37,18], center = true, vertical=[0,0,0,0], top=[0,3,5,3]);
                translate([-10/2,10,-26]) rotate([45,0,0]) cube_fillet([10,60,60], radius=2);
            }
            translate([-15, -32, 30.25]) rotate([90, 0, 0])  rotate([0, 90, 0]) nema17(places=[1,0,1,1], h=10);
        }

        // motor screw holes
        translate([21-5,-21-11,30.25]){
            // belt hole
            translate([-30,11,0]) cube([10,26,20], center = true);
            //motor mounting holes
            translate([-29, 0, 0]) rotate([0, 0, 0])  rotate([0, 90, 0]) nema17(places=[1,1,0,1], holes=true, shadow=5, $fn=7, h=8);
        }
    }
    //smooth rod caps
    translate([-22, -10.5, 0]) cube([17, 2, 15]);
    translate([-22, -10.5, 45]) cube([17, 2, 10]);
}


module x_end_idler(vfillet=[3,3,3,3], thru=true){
    difference(){
        union(){
            difference(){
                translate([-4.5-10+2-1,17.5-10+2,30]) cube_fillet([15+2,35+5,60], center = true, vertical=vfillet, top=[5,3,5,3]);
                //#translate([0,0,26]) cube_fillet([17,13.8,80], center = true);
                //#cylinder(r=5.1, h=80);
                bushing_negative(60);
            }
            //rotate([0,0,0]) translate([0,-9.5,0]) 
            if (bearing_choice == 1) {
                linear_bushing(60);
            } else {
                linear_bearing(65);
            }
            // Nut trap
            difference(){
                if ((bearing_choice != 1) || (bushing_type == 2)) {
                translate([-2,17.5,4]) cube_fillet([16,18,8], center = true, vertical=[3,0,0,0]);
                } else {
                translate([-2,17.5,4]) cube_fillet([16,18,8], center = true, vertical=[3,0,0,3]);
                }

                //bottom hole
                translate([0,17,-1]) cylinder(h = 4, r=2.45);
                //nut slid in
                translate([5,17,4]) cube([21,9.5,4.1], center = true);

                translate([0,17,6.5]) cylinder(h = 4, r=2.45);
            }
        }

        // belt hole
        translate([-5.5-10+1.5,22-10,30]) cube([10,46,32], center = true);

        if(thru == true){
            translate([-14,-11,6]) rotate([-90,0,0]) pushfit_rod(8,50);
            translate([-14,-11,rod_distance+6]) rotate([-90,0,0]) pushfit_rod(8,50);
        } else {
            translate([-14,-7,6]) rotate([-90,0,0]) pushfit_rod(8,50);
            translate([-14,-7,rod_distance+6]) rotate([-90,0,0]) pushfit_rod(8,50);
        }

        // idler hole
        translate([0,17+7,30.25]) rotate([0,-90,0]) cylinder(h = 80, r=2.2, $fn=30);

    }

    //threaded rod
    translate([0,17,0]) %cylinder(h = 70, r=2.5);

}
mirror([0,0,0]) x_end_idler(thru=true);
// translate([40,40,0]) x_end_idler(thru=false);
translate([40,0,0]) mirror([0,1,0]) x_end_motor();

module pushfit_rod(diameter,length){
    cylinder(h = length, r=diameter/2, $fn=30);
    translate([0,-diameter/4,length/2]) cube([diameter,diameter/2,length], center = true);

    translate([0,-diameter/2-1.2,length/2]) cube([diameter,1,length], center = true);
}
