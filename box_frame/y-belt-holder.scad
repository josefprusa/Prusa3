// PRUSA iteration3
// Y belt holder
// GNU GPL v3
// Josef Průša <josefprusa@me.com>
// Václav 'ax' Hůla <axtheb@gmail.com>
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>
translate([28.5, 0, 0]){

    %translate([0, 0, 35/2]) cube([20, 6, 35], center = true);
    translate([-21 - belt_thickness, -7, 0]) cube_fillet([13 + xy_delta, 14, 35], vertical=[3,0,0,0], fn=8 );
    translate([-9, -5.5, 17.5]) cube_fillet([12 + 2 * xy_delta, 3, 35], vertical=[3, 0, 0, 0], center = true);

    difference(){
        union(){

            translate([-37.5+13, 0, 5]) cube_fillet([8.5, 35, 10], center = true, radius=1, $fn=8);
            translate([-37.5+13, 0, 22.5]) cube([8.5, 14, 45], center = true);
            translate([-4.0 + xy_delta, 0, 17.5]) cube_fillet([8, 14, 35], center = true, vertical = [2,2,0,2]);

        }
        translate([-4.5 + xy_delta, 0, 17.5]) cube([10, 10, 10], center = true);
        translate([-20, -12, 5]) rotate([0, -90, 0]) screw();
        translate([-20, 12, 5]) rotate([0, -90, 0]) screw();

        translate([-20, 0, 40]) rotate([0, -90, 0]) screw();
        #translate([-8 + xy_delta, 0, 0]) mirror([1, 0, 0]) belt(35);
    }
}
