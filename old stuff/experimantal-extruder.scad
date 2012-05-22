// PRUSA Mendel  
// Experimental extruder
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
drive_pulley_dia = 8; //mm
idler_dia = 22; //mm
pushed_dia = 2; //mm
axes_distance = drive_pulley_dia/2 + idler_dia/2 + pushed_dia;

//layer height - for bridge hack
layer_height = 0.35;

difference(){
	// main rounded block
	intersection(){
		union(){
		translate([0-2,0,3]) cube([42+4,42,6], center=true);
		translate([-10.5-2,0,7+6]) cube([21+4,42,14], center=true);
		}
		translate([0,0,3]) rotate([0,0,45]) cube([52,52,60], center=true);
	}
	//motor mounting holes - screws
	translate([15.5,15.5,-3])cylinder(r=3.5/2,h=15);
	translate([15.5,-15.5,-3])cylinder(r=3.5/2,h=15);
	translate([-15.5,15.5,-3])cylinder(r=3.5/2,h=15);
	translate([-15.5,-15.5,-3])cylinder(r=3.5/2,h=15);
	
	//motor mounting holes - screws head recess
	translate([-15.5,15.5,6])cylinder(r=6.5/2,h=15);
	translate([-15.5,-15.5,6])cylinder(r=6.5/2,h=15);
	
	//shaft	cutout
	translate([0,0,3+layer_height])cylinder(r=(drive_pulley_dia+0.5)/2,h=20);
	
	//idler cutout
	translate([-axes_distance,0,6+3.5])cylinder(r=(idler_dia+0.5)/2,h=7);
	translate([-axes_distance-idler_dia/2,0,3.5+6+3.5]) cube([idler_dia, idler_dia, 7], center=true);
	translate([0,0,7+6+0.5]) cube([drive_pulley_dia+0.5, idler_dia, 14+1], center=true);
	
	//idler axis
	translate([-axes_distance,0,0]) cylinder(r=(8+0.5)/2,h=6+3.5+2);
	translate([-axes_distance,0,6+7+3.5+layer_height]) cylinder(r=(8+0.5)/2,h=22);
	
	//filament
	translate([-drive_pulley_dia/2-pushed_dia/2,0,6+7]) rotate([90,0,0]) cylinder(r=4/2,h=50, center=true);

translate([0,0,-0.1])cylinder(r=23/2,h=3);

}