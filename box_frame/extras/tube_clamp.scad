//makes tube clamping part. Useful for strenghtening Z axis tubing or as holder for Z axis endstop.
// GNU GPL v3
// Václav 'ax' Hůla <axtheb@gmail.com>
include <../configuration.scad>;

module tube_clamp(tube_r, wall_width=3, screw=false) {
    //wall_width is in single_wall_widths, 
    difference() {
        intersection() {
            union(){
                cylinder(r=tube_r + wall_width * single_wall_width, h=10);
                translate([-4.5, 0, 0]) cube([9, 20, 10]);
            }
            cylinder(r=tube_r + 5 + wall_width * single_wall_width, h=10);
        }
        translate([0, 0, -0.5]) cylinder(r=tube_r, h=11);
        translate([-0.5, 0, -0.5]) cube([1, 15, 11]);

        #translate([-7, max (6, tube_r + wall_width * single_wall_width + 0.5) , 5]) {
            rotate([0, 90, 0]) screw(r=1.7, r_head=m3_washer_diameter/2, head_drop=3, slant=false);
            translate([11, 0, 0]) rotate([0, 90, 0]) cylinder(r=m3_nut_diameter_horizontal/2, $fn=6, h=2);
        }

    }
}

tube_clamp(3.5);
