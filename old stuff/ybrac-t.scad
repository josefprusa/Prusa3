// PRUSA Mendel  
// Y motor bracket by Spacexula!!
// GNU GPL v3
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>

/**
 * @id y-motor-bracket
 * @name Y motor bracket
 * @id y-motor-bracket
 * @category Printed
 * @using 3 m3washer
 * @using 4 m8washer
 * @using 4 m8nut
 * @using 2 m3x10xhex
 * @using 1 m3x10xflat
 */

module ybract(){
difference(){
rotate(a=[0,0,-2])translate([7,4.5])rotate([0,0,90])mirror()linear_extrude(file="ybrac-t.dxf",height=10);
rotate(a=[0,0,-2]){
translate([3.4,30.05,-10])polyhole(m8_diameter, 30);
translate([-26,-21,-10])polyhole(m8_diameter, 30);

translate([33.5,-20.5,10])cylinder(h=30,r=4.4/2, center=true);
translate([4.5,-10,10])cylinder(h=30,r=4.4/2, center=true);
translate([15,19.2,10])cylinder(h=30,r=4.4/2, center=true);

translate([33.5,-20.5,12])cylinder(h=10,r=7.5/2, center=true);
translate([4.5,-10,12])cylinder(h=10,r=7.5/2, center=true);
translate([15,19.2,12])cylinder(h=10,r=7.5/2, center=true);
}
translate([-13,-27,10])scale([0.7,0.7,1]) linear_extrude(file = "this-way-up.dxf", layer = "0",
  height = 2, center = true, convexity = 10, twist = -fanrot);

translate([15,-26,10])scale([2,2,1]) mirror() linear_extrude(file = "this-way-up.dxf", layer = "f",
  height = 2, center = true, convexity = 10, twist = -fanrot);

translate([10,-26,0])scale([2,2,1]) linear_extrude(file = "this-way-up.dxf", layer = "f",
  height = 2, center = true, convexity = 10, twist = -fanrot);

translate([-13,-27,0])scale([0.7,0.7,1]) linear_extrude(file = "this-way-up.dxf", layer = "0",
  height = 2, center = true, convexity = 10, twist = -fanrot);
}
}
mirror()ybract();
