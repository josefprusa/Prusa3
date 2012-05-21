// PRUSA Mendel  
// Rod clamp
// GNU GPL v3
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel


include <configuration.scad>

/**
 * @id rod-clamp
 * @name Rod clamp
 * @category Printed
 */

module rodclamp(){ 
translate([-5,0,5]) rotate([0,-270,0]) translate([0,0,5]) difference(){
cube([10,25,10],center=true);
translate([-5,0,0]) cylinder(r=4.1,h=20,center=true);
translate([0,7,0]) rotate([0,90,0]) cylinder(r=m3_diameter/2,h=20,center=true);translate([0,-7,0]) rotate([0,90,0]) cylinder(r=m3_diameter/2,h=20,center=true);}
}

 rodclamp();
//cube([100,100,0.01],center=true);


