// PRUSA Mendel
// Endstop holder extra adapter rotator
// Used to rotate endstops for Prusa i2/i3 endstop holders
// GNU GPL v3
// Ethan Sherman
// ethan@blackguest.net

include <../configuration.scad>

/**
 * This endstop adapter has 3 holes for endstops with either 10mm or 20mm spacing.
 * It is designed to fit on the original endstop-holder to rotate a mechanical endstop 90 degrees.
 *
 * @id endstop-holder-extra
 * @name Endstop holder extra
 * @category Printed
 */
module endstop_extra(shaft_radius){
    screw_hole_spacing = 20;
    screw_hole_spacing2 = 10;

    segments=64;

    difference(){
	    union(){
            // for reference, here is the main endstop arm
		    //translate([-30, 0, 0]) cube([40, 4, 10]);

            // endstop arm mount
            translate([-20, -35.99, -5]) cube([10, 35, 5]);
            // main sliding endstop mount slider plate
            translate([-30, -5, -5]) cube([30, 5, 15]);
            // extra overhang support (may not be easy to print in this orientation)
            //#translate([-30, -0, -5]) cube([30, 6, 5]);

            // extra curved arm support (optional)
            difference(){
                translate([-30, -15, -5]) cube([30, 11, 5]);
                translate([-10, -10, -10]) rotate([0, 0, 90])
                    translate([-5, -10, -1]) rotate([0, 0, 0]) cylinder(h =20, r = 10, $fn = segments);
                translate([-40, -10, -10]) rotate([0, 0, 90])
                    translate([-5, -10, -1]) rotate([0, 0, 0]) cylinder(h =20, r = 10, $fn = segments);
            }
	    }

        // main slot
        for (z = [0:20]){
            translate([-(5+screw_hole_spacing) + z, 7, 5]) rotate([90, 0, 0]) cylinder(h =20, r = m3_diameter/2, $fn = segments);
        }

        // small m2 holes
        translate([-25, -8, -10]) rotate([0, 0, 90]){
            translate([-5, -10, -1]) rotate([0, 0, 0]) cylinder(h =20, r = m2_diameter/2, $fn = segments);
            translate([-(5+screw_hole_spacing), -10, -1]) rotate([0, 0, 0]) cylinder(h =20, r = m2_diameter/2, $fn = segments);
            translate([-(5+screw_hole_spacing2), -10, -1]) rotate([0, 0, 0]) cylinder(h =20, r = m2_diameter/2, $fn = segments);
        }
    }
}

rotate([-90, 0, 0]) endstop_extra(bushing_xy[0]);
