// Greg's Wade Gears

// PRUSA Mendel 
// GNU GPL v3
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>
use <inc/parametric_involute_gear_v5.0.scad>

translate([15,60,0]) 
WadesS(); //this module call will make the small gear


/**
 * @id small-gear
 * @name Small extruder gear
 * @category Printed
 * @using 1 m3nut
 * @using 1 m3xgrubscrew
 * @step Insert nut into cavity in printed gear.
 * @step Tighten the grub screw a bit, just to hold in place.
 */

module WadesS(){
	difference(){
translate([0,0,18]) mirror([ 0, 0, 1 ]) gear (number_of_teeth=10,
			circular_pitch=268,
			gear_thickness = 9,
			rim_thickness = 9,
			hub_thickness = 18,
			hub_diameter = 18,
			bore_diameter = 5.25,
			circles=0);
		translate([0,20,4])rotate([90,0,0])
	union()
	{
		//entrance
		translate([0,-3,15]) cube([5.5,5,3],center=true);
		//nut
		translate([0,0,13.6]) rotate([0,0,30]) nut(5.5, 3, false);
		//grub hole
		translate([0,0,9]) cylinder(r=m3_diameter/2,h=10, $fn=15);
	}
	}
}

