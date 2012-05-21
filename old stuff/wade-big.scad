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

WadesL(); //this module call will make the large gear

/**
 * @id large-gear
 * @name Large extruder gear
 * @category Printed
 */

/**
 * @id large-gear-assembly
 * @name Large extruder gear assembly
 * @using 1 hobbed-bolt
 * @using 1 large-gear
 * @step Insert hobbed bolt into main hole.
 * @step Add some M8 washers from other side, later with their count you adjust position of hobbed part in filament path.
 */


/**
 * @name M8 hobbed bolt
 * @category Nuts&bolts
 * @id hobbed-bolt
 * @step Use thread cutting bit in electric screwdriver ...
 */

module WadesL(){
	num_holes=6;
	hole_size=7.3;
	hole_offset=18.5;
	gear_thickness=5;
	nut_trap_depth=3;
	nut_trap_thickness=6;

	difference(){
		gear (number_of_teeth=43,
			circular_pitch=268,
			gear_thickness =gear_thickness,
			rim_thickness = 5,
			rim_width = 3,
			hub_thickness = nut_trap_thickness+nut_trap_depth,
			hub_diameter = 22,
			bore_diameter = smooth_bar_diameter+0.5,
			circles=0);

		translate([0,0,nut_trap_thickness])
		rotate(30)
		//cylinder($fn=6,r=m8_nut_diameter/2-0.5,h=nut_trap_depth+1);
		nut(13.3, nut_trap_depth+1);

color([0,0,1])
		for (hole=[0:num_holes-1])
		{
			rotate([0,0,360/num_holes*hole])
			translate([hole_offset,0,0])
			rotate(10)
			translate([0,0,-1])
			{
				cylinder(r=hole_size,h=gear_thickness+2);
				cube([hole_size,hole_size,gear_thickness+2]);
			}
		}
	}
}

