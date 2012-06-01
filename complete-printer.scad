// PRUSA Mendel
// Y frame corner
// GNU GPL v3
// Greg Frost
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

use <inc/functions.scad>
include <configuration.scad>
use <y-driverain.scad>
use <y-axis-corner.scad>

//motor and idler holding parts
translate([70,10,0]) rotate([0,90,0]) rotate([0,0,90]) motorholder();
translate([84, 367, 22])  rotate([0,-90,0]) idlermount();
// corners
leftfront();
translate(v = [125,0,0]) mirror([1,0,0]) leftfront();
translate(v = [0,410,0]) mirror([0,1,0]){
    leftfront();
    translate(v = [125,0,0]) mirror([1,0,0]) leftfront();
    // back bottom threaded rod
    color("Aqua")
    translate(v = [-10,10,10]) rotate([0,90,0]) cylinder(h = 125, r=4);

    // back top threaded rod
    color("Aqua")
    translate(v = [0,10,30]) rotate([0,90,0]) cylinder(h = 125, r=4);
}

// front bottom threaded rod
color("Aqua")
translate(v = [0,10,10]) rotate([0,90,0]) cylinder(h = 125, r=4);

// front top threaded rod
color("Aqua")
translate(v = [0,10,30]) rotate([0,90,0]) cylinder(h = 125, r=4);

// left top rod
color("MediumBlue")
translate(v = [0,2.2,45]) rotate([0,90,90]) cylinder(h = 405, r=4);
//left bottom rod
color("Aqua")
translate(v = [3,0,20]) rotate([0,90,90]) cylinder(h = 420, r=4);

// right top rod
color("MediumBlue")
translate(v = [125,2.2,45]) rotate([0,90,90]) cylinder(h = 405, r=4);
//right bottom rod
color("Aqua")
translate(v = [125-3,0,20]) rotate([0,90,90]) cylinder(h = 420, r=4);


//heat bed
color("Lime")
translate([125/2,330,58]) cube([225,225,6], center=true);
