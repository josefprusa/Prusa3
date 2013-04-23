//Part that fixes bearings to alu Y plate. For us ziptie haters;)
/// use with M3x20 countersunk screws
// GNU GPL v3
// Václav 'ax' Hůla <axtheb@gmail.com>
include <../configuration.scad>;

module bearingholdersingleplate(){
difference(){
    translate([0, -25/2, 0]) cube([10, 25, 9]);
    translate([-1, 0, 0]) rotate([0,90,0]) cylinder(r=7.7, h=21);
    mirror([0, 0, 1]) translate([5, -19/2, -9]) screw();
    mirror([0, 0, 1]) translate([5, 19/2, -9]) screw();
}
}


mirror([0, 0, 1]) bearingholdersingleplate();
