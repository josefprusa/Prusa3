// PRUSA Mendel
// Y frame corner
// GNU GPL v3
// Greg Frost
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

use <functions.scad>
include <configuration.scad>
use <y-driverain.scad>

module nutrod(){
    rotate([0,90,0]){
        //translate(v = [0,0,-0.1]) nut(m8_nut_diameter,6.7,false);
        translate(v = [-7.5/2,0,7/2-1.5]) cube(size = [7.5,15,7], center=true);
        translate(v = [0,0,-1.5]) cylinder(h = 7, r=7.5);
        cylinder(h = 270, r=4.4, $fn=30);
    }
}

/*
   20 mm betwenn the front threaded rods
   25 mm between the side threaded and smooth rod
 */
module leftfront(thru = true){
    // translate so the rod is on x = 0
    translate(v = [-11,0,0])

        difference(){
            cube_fillet([22,22,50.5], vertical=[4,4,4,4], top=[4,4,4,4], fn=8);

            translate(v = [0,11,10]) rotate([0,0,0]) nutrod();
            translate(v = [0,11,30]) rotate([0,0,0]) nutrod();

            translate(v = [14,0,20]) rotate([0,0,90]) rotate([00,0,0]) nutrod();

            if(thru==false){
                translate(v = [11,17,45+2.05]) rotate([0,0,0]) #cube(size = [8.2,30,3.1], center=true);
                translate(v = [11,2,45]) #rotate([0,90,90]) cylinder(h = 270, r=4.1);
            }else{
                translate(v = [11,17-5,45+2.05]) rotate([0,0,0]) #cube(size = [8.2,30,4.1], center=true);
                translate(v = [11,2-5,45]) #rotate([0,90,90]) cylinder(h = 270, r=4.1);
            }

        }
}

//leftfront positioned for printing
module leftfrontprint(){
    rotate([0,0,0])leftfront();
}


print = 1;
if(print==1){
    leftfrontprint();
    translate(v = [25,0,0]) mirror([1,0,0]) leftfrontprint();
    translate(v = [12,2,28]) rotate([0,0,0]) cube(size = [10,4,1], center=true);

    translate(v = [0,25,0]) {
        leftfrontprint();
        translate(v = [25,0,0]) mirror([1,0,0]) leftfrontprint();
        translate(v = [12,2,28]) rotate([0,0,0]) cube(size = [10,4,1], center=true);
    }

}
if(print==2){
    //motor and idler holding parts
    translate([100,10,0]) rotate([0,90,0]) rotate([0,0,90]) motorholder();
    translate([114, 312, 22])  rotate([0,-90,0]) idlermount();
    // drawing corners
    leftfront();
    translate(v = [160,0,0]) mirror([1,0,0]) leftfront();
    translate(v = [0,350,0]) mirror([0,1,0]){
        leftfront();
        translate(v = [160,0,0]) mirror([1,0,0]) leftfront();
        // back bottom threaded rod
        translate(v = [0,10,10]) rotate([0,90,0]) cylinder(h = 160, r=4);

        // back top threaded rod
        translate(v = [0,10,30]) rotate([0,90,0]) cylinder(h = 160, r=4);
    }

    // front bottom threaded rod
    translate(v = [0,10,10]) rotate([0,90,0]) cylinder(h = 160, r=4);

    // front top threaded rod
    translate(v = [0,10,30]) rotate([0,90,0]) cylinder(h = 160, r=4);

    // left top rod
    translate(v = [0,0,45]) rotate([0,90,90]) cylinder(h = 350, r=4);
    //left bottom rod
    translate(v = [3,0,20]) rotate([0,90,90]) cylinder(h = 350, r=4);

    // right top rod
    translate(v = [160,0,45]) rotate([0,90,90]) cylinder(h = 350, r=4);
    //right bottom rod
    translate(v = [160-3,0,20]) rotate([0,90,90]) cylinder(h = 350, r=4);
}
