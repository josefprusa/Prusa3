//makes tube clamping part. Useful for strenghtening Z axis tubing or as holder for Z axis endstop.
// GNU GPL v3
// Václav 'ax' Hůla <axtheb@gmail.com>
include <../configuration.scad>;
$fn=64;

module tube_clamp(tube_r, wall_width=3, endstop=false, h=10) {
    //wall_width is in single_wall_widths
    difference() {
        union(){
        intersection() {
            union(){
                cylinder(r=tube_r + wall_width * single_wall_width, h=h);
                translate([-4.5, 0, 0]) cube([9, 20, h]);
            }
            cylinder(r=tube_r + 5 + wall_width * single_wall_width, h=h);
        }
            if (endstop) {
                translate([-4.5, 5 + tube_r, 0]) cube([4.5, 30, h]);
            }
        }
        translate([0, 0, -0.5]) cylinder(r=tube_r, h=h + 1);
        translate([-0.5, 0, -0.5]) cube([1, 45, h + 1]);

        translate([-7, max (6, tube_r + wall_width * single_wall_width + 0.5) , h / 2]) {
            rotate([0, 90, 0]) screw(r=1.7, r_head=m3_washer_diameter/2, head_drop=3, slant=false);
            translate([10, 0, 0]) rotate([0, 90, 0]) cylinder(r=m3_nut_diameter_horizontal/2, $fn=6, h=2);
        }
        if (endstop) {
            translate([-7, 10 + tube_r, h / 2]) rotate([0, 90, 0]) {
                cylinder(r = 1.2, h=10);
                translate([0, 10, 0])
                cylinder(r = 1.2, h=10);
                translate([0, 20, 0])
                cylinder(r = 1.2, h=10);
            }
        }

    }
}

tube_clamp(3.5);
translate([15, 0, 0]) tube_clamp(3.5);
translate([0, 20, 0]) {
    tube_clamp(bushing_xy[0], endstop=true, h=12);
    translate([20, 0, 0]) tube_clamp(bushing_xy[0], endstop=true, h=12);
    translate([-20, 0, 0]) tube_clamp(bushing_z[0], endstop=true, h=12);
}
