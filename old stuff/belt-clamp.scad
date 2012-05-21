// PRUSA Mendel  
// Belt clamp
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
translate(v = [0,0,3.5]) cube([18,10,7], center=true);
		translate(v = [-9, 0, 0]) cylinder(r=5,h=7);
		translate(v = [9, 0, 0]) cylinder(r=5,h=7);
}
translate(v = [-9, 0, -1])polyhole(m3_diameter, 12);
translate(v = [9, 0, -1]) polyhole(m3_diameter, 12);
translate(v = [0,0,6.5]){
translate(v = [0,0,5])cube(size = [7, 1.8, 10], center = true);
translate(v = [0,2.5,5])cube(size = [7, 1.8, 10], center = true);
translate(v = [0,5,5])cube(size = [7, 1.8, 10], center = true);
translate(v = [0,-2.5,5])cube(size = [7, 1.8, 10], center = true);
translate(v = [0,-5,5])cube(size = [7, 1.8, 10], center = true);
}
}
}
beltclamp();