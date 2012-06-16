// PRUSA iteration3
// Complete printer visualisation
// GNU GPL v3
// Greg Frost
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <../configuration.scad>
use <../y-driverain.scad>
use <../y-axis-corner.scad>

module nutwasher(){
difference(){
union(){
color("silver")cylinder(r=15/2,h=7,$fn=6);
translate([0,0,7.5])color("silver")cylinder(r=8.5,h=1);
}
translate([0,0,-1])cylinder(r=8/2,h=12);

}
}

//motor and idler holding parts
translate([56,10,0]) rotate([0,90,0]) rotate([0,0,90]) motorholder();
translate([70, 367, 22]) rotate([0,-90,0]) idlermount();
yrodseparation=100;
// corners
leftfront();
translate([yrodseparation,0,0]) mirror([1,0,0]) leftfront();
translate([0,410,0]) mirror([0,1,0]){
    leftfront();
    translate([yrodseparation,0,0]) mirror([1,0,0]) leftfront();
    // back bottom threaded rod
    color("Aqua")
        translate([-20,10,10]) rotate([0,90,0]) cylinder(h = 140, r=4);
	translate([80,10,10])rotate([0,90,0])nutwasher();
	translate([20.5,10,10])rotate([0,90,180])nutwasher();
	translate([-20,10,10])rotate([0,90,0])nutwasher();
	translate([120,10,10])rotate([0,90,180])nutwasher();


    // back top threaded rod
    color("Aqua")
        translate([-20,10,30]) rotate([0,90,0]) cylinder(h = 140, r=4);
	translate([41.5,10,30])rotate([0,90,0])nutwasher();
	translate([79.5,10,30])rotate([0,90,180])nutwasher();
	translate([80,10,30])rotate([0,90,0])nutwasher();
	translate([20.5,10,30])rotate([0,90,180])nutwasher();
	translate([-20,10,30])rotate([0,90,0])nutwasher();
	translate([120,10,30])rotate([0,90,180])nutwasher();

}

// front bottom threaded rod
color("Aqua")
translate([-20,10,10]) rotate([0,90,0]) cylinder(h = 140, r=4);
translate([46.5,10,10])rotate([0,90,0])nutwasher();
translate([75.5,10,10])rotate([0,90,180])nutwasher();
translate([80,10,10])rotate([0,90,0])nutwasher();
translate([20.5,10,10])rotate([0,90,180])nutwasher();
	translate([-20,10,10])rotate([0,90,0])nutwasher();
	translate([120,10,10])rotate([0,90,180])nutwasher();

// front top threaded rod
color("Aqua")
translate([-20,10,30]) rotate([0,90,0]) cylinder(h = 140, r=4);
translate([46.5,10,30])rotate([0,90,0])nutwasher();
translate([75.5,10,30])rotate([0,90,180])nutwasher();
translate([80,10,30])rotate([0,90,0])nutwasher();
translate([20.5,10,30])rotate([0,90,180])nutwasher();
	translate([-20,10,30])rotate([0,90,0])nutwasher();
	translate([120,10,30])rotate([0,90,180])nutwasher();

// left top rod
color("MediumBlue")
translate([0,2.2,45]) rotate([0,90,90]) cylinder(h = 405, r=4);
//left bottom rod
color("Aqua")
translate([0,-10,20]) rotate([0,90,90]) cylinder(h = 430, r=4);
translate([0,150,20])rotate([0,90,90])nutwasher();
translate([0,250,20])rotate([0,90,-90])nutwasher();
translate([0,380-0.5,20])rotate([0,90,90])nutwasher();
translate([0,420-0.5,20])rotate([0,90,-90])nutwasher();
translate([0,-10+0.5,20])rotate([0,90,90])nutwasher();
translate([0,30+0.5,20])rotate([0,90,-90])nutwasher();

translate([yrodseparation,0,0]){
// right top rod
color("MediumBlue")
translate([0,2.2,45]) rotate([0,90,90]) cylinder(h = 405, r=4);
//right bottom rod
color("Aqua")
translate([0,-10,20]) rotate([0,90,90]) cylinder(h = 430, r=4);
translate([0,150,20])rotate([0,90,90])nutwasher();
translate([0,250,20])rotate([0,90,-90])nutwasher();
translate([0,380-0.5,20])rotate([0,90,90])nutwasher();
translate([0,420-0.5,20])rotate([0,90,-90])nutwasher();
translate([0,-10+0.5,20])rotate([0,90,90])nutwasher();
translate([0,30+0.5,20])rotate([0,90,-90])nutwasher();

}

//heat bed
color("Lime")
translate([125/2,330,58]) cube([225,225,6], center=true);
