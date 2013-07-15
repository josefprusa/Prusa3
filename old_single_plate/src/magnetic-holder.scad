difference(){
translate([-12,0.7,0])cube([24,8,10]);
translate([0,0,-1]) cylinder(r=4.1, h=20, $fn=25);
translate([8.5,10,5]) rotate([90,0,0]) rotate([0,0,30])  cylinder(r=1.8, h=20);
translate([-8.5,10,5]) rotate([90,0,0]) rotate([0,0,30])  cylinder(r=1.8, h=20);
}