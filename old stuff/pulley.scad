// Belt pulley is http://www.thingiverse.com/thing:3104 by GilesBathgate

// PRUSA Mendel  
// Bushings
// GNU GPL v3
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel


include <configuration.scad>


/**
 * @id pulley
 * @name Pulley
 * @category Printed
 * @using 1 m3nut
 * @using 1 m3x10xhex
 */
module pulley()
{


	module spur()
	{
		linear_extrude(height=20) polygon([[-1,-1],[-1,1],[0.7,0.7],[0.7,-0.7]],[[0,1,2,3,0]]);
	}
	
 difference()
 {	 
 	union()
 	{
 		//base
 		rotate_extrude($fn=30)
 		{
 				square([9,8]);
 				square([10,7]);
 				translate([9,7]) circle(1);
 		}
    	
    	//shaft
    	cylinder(r=motor_shaft-0.2,h=20, $fn=8);
    	
    	//spurs
    	for(i=[1:8]) rotate([0,0,i*(360/8)])
    	translate([5.6,0,0])spur();
   }
   
   //shaft hole
    translate([0,0,-1])polyhole(motor_shaft+0.1,22);
    		
 //captive nut and grub holes
    for(j=[1:1]) rotate([0,0,j*(360/3)])
	translate([0,20,4])rotate([90,0,0])
	union()
	{
		//entrance
		translate([0,-3,15]) cube([m3_nut_diameter+0.5,5,3],center=true);
		//nut
		translate([0,0,13.6]) rotate([0,0,30]) nut(m3_nut_diameter+0.5, 3, false);
		//grub hole
		translate([0,0,9]) cylinder(r=m3_diameter/2,h=10, $fn=15);
	}

 }

   
}

pulley();
