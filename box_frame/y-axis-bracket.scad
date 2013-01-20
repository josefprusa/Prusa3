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

function bracket_width(screw_area) = screw_area * 2 + threaded_rod_diameter;
function bracket_depth(lip_thickness, screw_area) = screw_area * 2 + lip_thickness;
function bracket_height(lip_length) = board_thickness + lip_length;

module beveled_box(size, bevel_size=4) {
    function pythag(a, b) = sqrt(a * a + b * b);
    function bevelradius(x, y, bevel) = pythag(x, y) - bevel * max(x, y) / min(x, y);

    xzbevel = bevelradius(size[0], size[2], bevel_size);
    yzbevel = bevelradius(size[1], size[2], bevel_size);
    intersection() {
        cube(size);
        translate([size[0] / 2, size[1] / 2, size[2] / 2])
            rotate([0, 45, 0])
            cube([xzbevel, size[1], xzbevel], center=true);
        translate([size[0] / 2, size[1] / 2, size[2] / 2])
            rotate([45, 0, 0])
            cube([size[0], yzbevel, yzbevel], center=true);
    }
}

module yrodbracket(screw_area, lip_thickness, lip_length, bevel_size=2.0) {
    inner_radius = threaded_rod_diameter / 2;
    screw_center = screw_area / 2;

    width = bracket_width(screw_area);
    depth = bracket_depth(lip_thickness, screw_area);
    height = bracket_height(lip_length);

    difference() {
        translate([0, 0, -lip_length])
            beveled_box([width, depth, height], bevel_size);
        translate([screw_area, -1, -lip_length - lip_thickness])
            bolt_track(threaded_rod_diameter, depth + 2, lip_length + lip_thickness + inner_radius);

        translate([-1, lip_thickness, -lip_length - 1])
            cube([width + 2, depth, lip_length + 1]);

        // screw holes
        for (x = [screw_center, width - screw_center]) {
            for (y = [lip_thickness + screw_center, screw_area + lip_thickness + screw_center]) {
                translate([x, y, board_thickness])
                    rotate([180, 0, 0])
                    screw();
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
