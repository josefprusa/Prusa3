include <configuration.scad>

module bolt_track(width, length, height) {
    hwidth = width / 2;
    hdiff = hwidth - height;
    union() {
        difference() {
            rotate([90, 0, 0])
                translate([hwidth, height, -length])
                cylinder(h=length, r=hwidth, $fn=$fn);

            if (height < hwidth) {
                translate([0, -1, height - hwidth - 1])
                    cube([width, length + 2, hdiff + 1]);
            }
        }
        cube([width, length, height]);
    }
}

function bracket_width(screw_area) = screw_area * 2 + y_threaded_rod_long_r * 2;
function bracket_depth(lip_thickness, screw_area) = screw_area * 2 + lip_thickness;
function bracket_height(lip_length=0) = y_threaded_rod_long_r * 2 + 6 * layer_height  + lip_length;

module yrodbracket(screw_area, lip_thickness, lip_length, bevel_size=2.0) {
    inner_radius = threaded_rod_diameter / 2;
    screw_center = screw_area / 2;

    width = bracket_width(screw_area);
    depth = bracket_depth(lip_thickness, screw_area);
    height = bracket_height(lip_length);

    difference() {
        translate([0, 0, -lip_length])
            cube_fillet([width, depth, height], bevel_size, top=[2, 2, 2, 2]);
        translate([screw_area, -1, -lip_length - lip_thickness])
            bolt_track(y_threaded_rod_long_r * 2, depth + 2, lip_length + lip_thickness + inner_radius);

        translate([-1, lip_thickness, -lip_length - 1])
            cube([width + 2, depth, lip_length + 1]);

        // screw holes
        for (x = [screw_center, width - screw_center]) {
            for (y = [lip_thickness + screw_center, screw_area + lip_thickness + screw_center]) {
                translate([x, y, bracket_height() + 0.1])
                    rotate([180, 0, 0])
                    screw(head_drop=3, r_head=4.5);
            }
        }
    }
}

rotate([90, 0, 0]) {
    for (x = [0, bracket_width(12) + 5]) {
        for (y = [0, bracket_height(3) + 5]) {
            translate([x, 0, y])
                yrodbracket(12, 3, 3);
        }
    }
}
