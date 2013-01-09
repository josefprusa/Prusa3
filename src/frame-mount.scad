// PRUSA iteration3
// triangular mount to connect frame and leg
// GNU GPL v3
// Peppe Porsia <syskrack@gmail.com>

// total height
height = 38;
// length of the short sides
lenght = 15;
// vertical distance between lower bores (center point) from base
hole_h = 7;
// holes diameter (for screws)
dia = 3;
// vertical distance between lower and upper bores (center points)
holes_distance = 20;
// horizontal distance between corner and holes on frame
holes_frame = 9;
// horizontal distance between corner and holes on leg
holes_plate = 10;
// nut traps (0 = disabled; 1 = enabled)
nut_trap=1;

include <inc/roundCornersCube.scad>;
include <inc/nuts_and_bolts.scad>;

// triangular body
module body(){
	difference (){
		roundCornersCube(lenght,lenght,height,1.5);
		rotate(a=45, v=[0,0,1]) {
			translate(v = [lenght+1.5,0,0]) cube (size = [lenght*2,lenght*2,height+2], center = true);
		}
	}
}

// holes
module holes(){
	translate(v = [holes_frame-lenght/2,0,-height/2+hole_h+holes_distance]) {
		rotate ([90,0,0]) cylinder (h = 100, r=dia/2, center = true, $fn=100);		
		translate(v = [0,-lenght/2+lenght-holes_frame+2.2,0]) {
			rotate ([90,0,0]) {
				cylinder (h = 1*(dia+5), r=dia/2+2.5, center = true, $fn=100);
				if(nut_trap==1)
					translate(v = [0,0,3]) nutHole(dia);
			}
		}
	}
	translate(v = [holes_frame-lenght/2,0,-height/2+hole_h]) {
		rotate ([90,0,0]) cylinder (h = 100, r=dia/2, center = true, $fn=100);
		translate(v = [0,-lenght/2+lenght-holes_frame+2.2,0]) {
			rotate ([90,0,0]) {
				cylinder (h = 1*(dia+5), r=dia/2+2.58, center = true, $fn=100);
				if(nut_trap==1)
					translate(v = [0,0,3]) nutHole(dia);
			}
		}
	}
	translate(v = [0,holes_plate-lenght/2,-height/2+hole_h+holes_distance]) {
		rotate ([0,90,0]) cylinder (h = 100, r=dia/2, center = true, $fn=100);
		translate(v = [-lenght/2+lenght-holes_plate+2.2,0,0]) {
			rotate ([0,90,0]) { 
				cylinder (h = 1*(dia+5), r=dia/2+2.5, center = true, $fn=100);
				if(nut_trap==1)
					translate(v = [0,0,-5.5]) nutHole(dia);
			}
		}
	}
	translate(v = [0,holes_plate-lenght/2,-height/2+hole_h]) {
		rotate ([0,90,0]) cylinder (h = 100, r=dia/2, center = true, $fn=100);
		translate(v = [-lenght/2+lenght-holes_plate+2.2,0,0]) {
			rotate ([0,90,0]) {
				cylinder (h = 1*(dia+5), r=dia/2+2.5, center = true, $fn=100);
				if(nut_trap==1)
					translate(v = [0,0,-5.5]) nutHole(dia);
			}
		}
	}
}


module final() {
	difference () {
		body();
		holes();
	}
}

final();