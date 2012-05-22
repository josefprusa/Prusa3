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
 * @id printable-bushing
 * @name Printable Bushing
 * @category Printed
 */ 

rodsize = bushing_rodsize;
outerDiameter = bushing_outerDiameter;
lenght = bushing_lenght;
type = bushing_type;


module printable_bushing(){
	translate(v = [0,0,0.5]){ 
		
		cube(size = [22,10,0.5], center=true);
		translate(v = [0,0,0.5]) cube(size = [20,2,0.5], center=true);
		translate(v = [0,4,0.5]) cube(size = [20,2,0.5], center=true);
		translate(v = [0,-4,0.5]) cube(size = [20,2,0.5], center=true);
	}
}
printable_bushing();