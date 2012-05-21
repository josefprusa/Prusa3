// PRUSA Mendel  
// Belt clamp nut holder
// GNU GPL v3
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>

/**
 * @id belt-clamp
 * @name Belt clamp
 * @category Printed
 */ 

module beltclamp(){
difference(){
	union(0){
translate(v = [0,0,1.5]) cube([18,10,3], center=true);
		translate(v = [-9, 0, 0]) cylinder(r=7,h=3, $fn=6);
		translate(v = [9, 0, 0]) cylinder(r=7,h=3, $fn=6);
}

translate(v = [9,0, 0.5]) nut(m3_nut_diameter,9);
translate(v = [-9,0, 0.5]) nut(m3_nut_diameter,9);
translate(v = [-9, 0, -1])polyhole(m3_diameter, 12);
translate(v = [9, 0, -1]) polyhole(m3_diameter, 12);
}
}
beltclamp();