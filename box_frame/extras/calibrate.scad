// PRUSA iteration3
// Calibrating object
// GNU GPL v3
// Václav 'ax' Hůla <axtheb@gmail.com>

include <../configuration.scad>
use <../bushing.scad>

use <../x-end.scad>

intersection() {
    difference() {
        union(){
            //central cube
            translate([-10, -10, 0]) cube_fillet([20, 20, 20], top=[3, 0, 3, 0]);
            //xy bearing. If the bearing is hard to put inside you are probably extruding too much fabric.
            mirror([1, 0, 0]) translate([20, 0, 0]) linear_bearing();
            //z smooth rod. See note above. You can adjust it in inc/conf_bushing.scad, but the problem is likely to be in machine.
            translate([-12, 7, 0]) cube_fillet([24, 13, 4.5], vertical=[3, 3, 0, 0]);
            translate([0, 18, 0]) cylinder(h=2.5, r=(bushing_z[0] + 5 * single_wall_width));
            //z wall
            translate([-11, -36, 0]) cube_fillet([5, 31, 20], top=[0, 0, 5, 7]);
            //belt holder. Belt thickness is in configuration.scad
            translate([14 + belt_thickness, -1, 10]) cube_fillet([8, 14, 20], center = true, vertical = [2,0,2,2], fn=8);
            translate([5, 3, 0]) cube ([10, 3, 20]);

        }

        //xy bearing hole
        mirror([1, 0, 0]) translate([20, 0, 0]) linear_bearing_negative();
        //x smooth rod
        translate([0, -11, 5 + bushing_xy[0]]) rotate([-90, 0, 0]) pushfit_rod(bushing_xy[0] * 2 + 0.2, 50);
        //z smooth rod
        translate([0, 18, -1]) cylinder(h=20, r=bushing_z[0] + single_wall_width / 4);

        //screw
        translate([0, -20, 10]) rotate([0, -90, 0]) screw(head_drop=7, h=122, r_head=4.5);
        //x carriage nut. Too bad its not parametrised (todo)
        translate([-7,-29, 10]) rotate([90, 0, 0]) {
            rotate([0, 90, 0]) cylinder(r=3.4, h=5, $fn=6, center=true);
            rotate([0, 90, 0]) cylinder(r=1.8, h=22, center=true);

        }
        //belt
        translate([10, -2, 0]) belt(25);
        #translate([10, -2, 0]) belt(25);


    }
    //Cut top to save plastic
    translate([-50, -50, 0]) cube([100, 100, 20]);
}
