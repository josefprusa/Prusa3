// PRUSA iteration3
// GNU GPL v3
// Josef Průša
// josefprusa@me.com
// prusadjs.cz


include <configuration.scad>


module rodclamp(){ 
	rotate([0,-270,0]) difference(){
		cube([14,30,10],center=true);
		translate([-3,0,0]) cylinder(r=4.1,h=20,center=true,$fn=32);
		translate([-5,0,0]) cube(size=[4.1,8.2,10], center=true);
		
		translate([7,10,0]) rotate([0,-90,0]) screw(head_drop=5);
		translate([7,-10,0]) rotate([0,-90,0]) screw(head_drop=5);
	}
}


rodclamp();

