// PRUSA Mendel  
// Bushings
// GNU GPL v3
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>

module igus_adapter(){
difference(){
	cylinder(h = 23, r=15.5/2, $fn=20);
	translate(v=[0,0,-1]) polyhole(10.1, 25);
	translate(v=[5+7,0,13]) cube(size = [10,0.1,27], center=true);
	translate(v=[-5-7,0,13]) cube(size = [10,0.1,27], center=true);
	translate(v=[0,5+7,13]) cube(size = [0.1,10,27], center=true);
	translate(v=[0,-5-7,13]) cube(size = [0.1,10,27], center=true);
}
}
igus_adapter();