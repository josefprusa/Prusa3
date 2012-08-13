difference(){cube([13,25,20]);

//rotate([0, -90, 0])
translate([0,0,1]){
translate([2, -1, 8]) cube([9,60,5.2]);
translate([-1, 5, 5]) cube([15,2.5,7]);
translate([-1, 5, 0]) cube([15,2.5,2]);

translate([-1, 15, 5]) cube([15,2.5,7]);
translate([-1, 15, 0]) cube([15,2.5,2]);
translate([6.5, -1, 8]) rotate([-90, 0, 0]) rotate([0, 0, 30])  cylinder(h=70, r=5.2, $fn=6);
translate([6.5, -3, 8]) rotate([-90, 0, 0])  cylinder(h=70, r=4, $fn=30);
}}