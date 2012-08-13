difference(){
	translate([-10,-10,0])cube([20,20,30]);
translate([16,16,0]) rotate([0,0,45])translate([-20,-20,-1]) cube([40,40,40]);
translate([-23,-23,0]) rotate([0,0,45])translate([-20,-20,-1]) cube([40,40,40]);
translate([0,-20,5]) rotate([0,90,90]) cylinder(h = 50, r=2, $fn=20);
translate([0,-20,25]) rotate([0,90,90]) cylinder(h = 50, r=2, $fn=20);
translate([-20,0,5]) rotate([0,90,0]) cylinder(h = 50, r=2, $fn=20);
translate([-20,0,25]) rotate([0,90,0]) cylinder(h = 50, r=2, $fn=20);

translate([0,-5,5]) rotate([0,90,90]) cylinder(h = 50, r=4, $fn=20);
translate([0,-5,25]) rotate([0,90,90]) cylinder(h = 50, r=4, $fn=20);
translate([-5,0,5]) rotate([0,90,0]) cylinder(h = 50, r=4, $fn=20);
translate([-5,0,25]) rotate([0,90,0]) cylinder(h = 50, r=4, $fn=20);
}
