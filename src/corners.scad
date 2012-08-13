// PRUSA iteration3
// Y frame corners
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz>
// Contributors Kliment, AxTheB, vlnofka and others.
// http://www.reprap.org/wiki/Prusa3
// http://prusamendel.org

include <configuration.scad>
use <y-drivetrain.scad>

module nutrod(){
    rotate([0,90,0]){
        //translate([0,0,-0.1]) nut(m8_nut_diameter,6.7,false);
        //this is pretty but annoying
        //translate([-7.5/2,0,7/2-1.5]) cube([7.5,15,7], center=true);
        //translate([0,0,-1.5]) cylinder(h = 7, r=7.5);
        translate([0,0,-5]) cylinder(h = 270, r=4.4, $fn=30);
    }
}

/*
   20 mm betwenn the front threaded rods
   25 mm between the side threaded and smooth rod
 */

module corner_base(){	
 translate([-11,-11,0])cube([22,22,47]);
}

module corner_holes(){
 translate([-11,-11,0]){
  translate([0,11,10]) rotate([0,0,0]) nutrod();
  translate([0,11,30]) rotate([0,0,0]) nutrod();
  translate([11,0,20]) rotate([0,0,90]) rotate([00,0,0]) nutrod();
  translate([11,-2,49.5]) rotate([0,90,90]) cylinder(h = 270, r=5, $fn=30); // entry cutout
  translate([11,2,45]) rotate([0,90,90]) cylinder(h = 270, r=4.2, $fn=30); // cutout for rod insert
  translate([11-1,-2,38]) cube([2,25,8]); // flex allowing cutout
  translate([-1,11-0.05,41]) cube([25,0.1,8]); // microcutout to make top sturdier
 }
}

module corner_fancy(){
 // corner cutouts
  translate([-9,9,0]) rotate([0,0,45]) translate([-15,0,-1]) cube([30,30,51]);
  translate([9,9,0]) rotate([0,0,-45]) translate([-15,0,-1]) cube([30,30,51]);
  translate([-9,-9,0]) rotate([0,0,-45-180]) translate([-15,0,-1]) cube([30,30,51]);
  translate([9,-9,0]) rotate([0,0,45-180]) translate([-15,0,-1]) cube([30,30,51]);
 // top cutouts
  translate([9,0,49-2]) rotate([0,45,0]) translate([-15,-15,0]) cube([30,30,30]);
  translate([-9,0,49-2]) rotate([0,-45,0]) translate([-15,-15,0]) cube([30,30,30]);
  rotate([0,0,90]){
   translate([9,0,49-2]) rotate([0,45,0]) translate([-15,-15,0]) cube([30,30,30]);
   translate([-9,0,49-2]) rotate([0,-45,0]) translate([-15,-15,0]) cube([30,30,30]);
  }
}


// final corner assembly
module corner(){
 difference(){
  corner_base();
  corner_holes();
  corner_fancy();
 }
}

corner();
translate([25,0,0]) mirror([1,0,0]) corner();
translate([0,25,0]) {
 //corner();
 //translate([25,0,0]) mirror([1,0,0]) corner();
}

