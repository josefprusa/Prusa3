// Thanks for this one to Triffid Hunter!!

// PRUSA Mendel  
// Printable LM8UU bushing
// GNU GPL v3
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

lm8uu_od = 15;
lm8uu_l = 24;
lm8uu_id = 7.8;

clearance_ratio = 1.05;

contact_length = 4;

cutout_width = lm8uu_id / sqrt(2);

%translate([0, 0, -lm8uu_l]) cylinder(r = lm8uu_id / 2, h=lm8uu_l * 3, $fn=256);
difference() {
	cylinder(r=lm8uu_od / 2, h=lm8uu_l, $fn=128);
	// corner cutouts
	translate([-cutout_width / 2, -lm8uu_id * clearance_ratio / 2, -1])
		cube([cutout_width, lm8uu_id * clearance_ratio, lm8uu_l + 2]);
	translate([-lm8uu_id * clearance_ratio / 2, -cutout_width / 2, -1])
		cube([lm8uu_id * clearance_ratio, cutout_width, lm8uu_l + 2]);
	// negative cylindrical shuttle for contact area
	intersection() {
		translate([-lm8uu_id * clearance_ratio /  2, -lm8uu_id * clearance_ratio / 2, -1]) cube([lm8uu_id * clearance_ratio, lm8uu_id * clearance_ratio, lm8uu_l + 2]);
		union() {
			cylinder(r1 = 0, r2 = lm8uu_id * sqrt(sqrt(2)) / 2, h = lm8uu_id * sqrt(sqrt(2)) / 2, $fn=64);
			translate([0, 0, lm8uu_id * sqrt(sqrt(2)) / 2])
				cylinder(r = lm8uu_id * sqrt(sqrt(2)) / 2, h = lm8uu_l - (lm8uu_id * sqrt(sqrt(2))), $fn=64);
			translate([0, 0, lm8uu_id * sqrt(sqrt(2)) / 2 + lm8uu_l - (lm8uu_id * sqrt(sqrt(2)))])
				cylinder(r1 = lm8uu_id * sqrt(sqrt(2)) / 2, r2 = 0, h = lm8uu_id * sqrt(sqrt(2)) / 2, $fn=64);
		}
	}
	// cutout for viewing internal structure
	//translate([0, 0, -1]) cube([20, 20, 30]);
}
