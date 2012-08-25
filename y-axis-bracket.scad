include <configuration.scad>

module boltTrack(width, length, height) {
	hwidth = width / 2;
	hdiff = hwidth - height;
	union() {
		difference() {
			rotate([90, 0, 0])
				translate([hwidth, height, -length])
					cylinder(h=length, r=hwidth, $fn=12);
			
			if (height < hwidth) {
				translate([0, -1, height - hwidth - 1])
					cube([width, length + 2, hdiff + 1]);
			}
		}
		cube([width, length, height]);
	}
}


module yrodbracket(lip_thickness, lip_length) {
	innerRadius = threaded_rod_diameter / 2;
	outerRadius = innerRadius + lip_thickness;
	r_head = 3.5; // FIXME: stolen from screw() in inc/functions.scad
	r_screw = 2;
	screw_margin = r_head + 2;
	holeOuterDiameter = r_screw + screw_margin * 2;
	holeCenter = holeOuterDiameter / 2;
	width = threaded_rod_diameter + holeOuterDiameter * 2;
	middle = width / 2;
	height = outerRadius + innerRadius;

	depth = holeOuterDiameter * 2 + lip_thickness;

	function pythag(a, b) = sqrt(a * a + b * b);
	function bevelradius(x, y, bevel) = pythag(x, y) - bevel * max(x, y) / min(x, y);

	xzbevel = bevelradius(width, board_thickness, 2.0);
	yzbevel = bevelradius(depth, board_thickness, 2.0);
	difference() {
		union() {
			intersection() {
				cube([width, depth, board_thickness]);
				translate([width / 2, depth / 2, board_thickness / 2])
					rotate([0, 45, 0])
						cube([xzbevel, depth, xzbevel], center=true);
				translate([width / 2, depth / 2, board_thickness / 2])
					rotate([45, 0, 0])
						cube([width, yzbevel, yzbevel], center=true);
						
			}
			translate([0, 0, -lip_length])
				cube([width, lip_thickness, lip_length + lip_thickness]);
		}
		translate([holeOuterDiameter, -1, -lip_length - lip_thickness])
			boltTrack(threaded_rod_diameter, depth + 2, lip_length + lip_thickness + innerRadius);

		// screw holes
		for (x = [holeCenter, width - holeCenter]) {
			for (y = [lip_thickness + holeCenter, holeOuterDiameter + lip_thickness + holeCenter]) {
				translate([x, y, board_thickness])
					rotate([180, 0, 0])
						screw();
			}
		}
	}
}

module yrodbracket2(lip_thickness, lip_length) {
	innerRadius = threaded_rod_diameter / 2;
	outerRadius = innerRadius + lip_thickness;
	r_head = 3.5; // FIXME: stolen from screw() in inc/functions.scad
	r_screw = 2;
	screw_margin = r_head + 2;
	holeOuterDiameter = r_screw + screw_margin * 2;
	holeCenter = holeOuterDiameter / 2;
	width = threaded_rod_diameter + holeOuterDiameter * 2;
	middle = width / 2;
	height = outerRadius + innerRadius;

	depth = holeOuterDiameter * 2 + lip_thickness;

	function pythag(a, b) = sqrt(a * a + b * b);
	function bevelradius(x, y, bevel) = pythag(x, y) - bevel * max(x, y) / min(x, y);

	xzbevel = bevelradius(width, board_thickness + lip_length, 2.0);
	yzbevel = bevelradius(depth, board_thickness + lip_length, 2.0);
	bracket_thickness = board_thickness + lip_length;
	difference() {
		union() {
			intersection() {
				translate([0, 0, -lip_length])
					cube([width, depth, bracket_thickness]);
				translate([width / 2, depth / 2, bracket_thickness / 2 - lip_length])
					rotate([0, 45, 0])
						cube([xzbevel, depth, xzbevel], center=true);
				translate([width / 2, depth / 2, bracket_thickness / 2 - lip_length])
					rotate([45, 0, 0])
						cube([width, yzbevel, yzbevel], center=true);
			}
		}
		translate([holeOuterDiameter, -1, -lip_length - lip_thickness])
			boltTrack(threaded_rod_diameter, depth + 2, lip_length + lip_thickness + innerRadius);

		translate([-1, lip_thickness, -lip_length - 1])
			cube([width + 2, depth, lip_length + 1]);

		// screw holes
		for (x = [holeCenter, width - holeCenter]) {
			for (y = [lip_thickness + holeCenter, holeOuterDiameter + lip_thickness + holeCenter]) {
				translate([x, y, board_thickness])
					rotate([180, 0, 0])
						screw();
			}
		}
	}
}

translate([-10, 0, 0])
	color("blue")
		cube([1, 1, board_thickness]); // xxx: ruler
translate([-9, 0, 0])
	color("Red")
		cube([1, 1, threaded_rod_diameter]); // xxx: ruler

yrodbracket2(3, 3);
//rotate([90, 0, 0])
	//translate([3.5 + 6 + 3 + threaded_rod_diameter / 2, threaded_rod_diameter / 2, -50])
		//# cylinder(r=threaded_rod_diameter / 2, h=100);
