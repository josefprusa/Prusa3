// PRUSA iteration3
// Y drivetrain (idler and stepper holders)
// GNU GPL v3
// Josef Průša <josefprusa@me.com>
// Václav 'ax' Hůla <axtheb@gmail.com>
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>

module motorholder(thickness=10){
    difference(){
        union(){
            // Motor holding part
            translate([29,-21+50,0])
            {
                //#cube([42,42,2], center=true);
                difference(){
                    union(){
                        translate([-21+4.5,0,5]) cube([9,31,thickness], center=true);
                        nema17([0,1,1,0], thickness=thickness, shadow=false);
                        mirror([0,0,1])translate([0,0,-10])nema17([0,1,1,0], thickness=thickness, shadow=7);
                        // Parts joining part
                        translate([-29,-21,0]) cube([14,30,thickness]);
                    }
                    // Motor mounting holes
                    translate([0,0,thickness]) mirror([0,0,1]) nema17([0,1,1,0], thickness=thickness, holes=true);
                }
            }

            // Front holding part
            translate([0,10,0]) cylinder(h = thickness, r=8);
            translate([0,20,5]) cube([16,20,thickness], center=true);
            translate([0,30,0]) cylinder(h = thickness, r=8);
        }
        translate([0,10,-1]) cylinder(h = 12, r=4.5);
        translate([0,30,-1]) cylinder(h = 12, r=4.5);
    }
}

module oval(r=4,l=15,h=2){
translate([l/2,0,0])cylinder(r=r,h=h,$fn=4);
translate([-l/2,0,0])cylinder(r=r,h=h,$fn=4);
translate([0,0,h/2])cube([l,r*2,h],center=true);
}


module idlermount(){
    difference(){
        union(){
            translate([0, idler_bearing[2]/2 - 6, 0] ) cube_fillet([16,40 + idler_bearing[2], 10 + idler_width], vertical = [0,0,0,0], top = [3,0,3,0], bottom = [3,0,3,0], center=true);
        }
//        translate([0,12,-1]) cylinder(h = 120, r=idler_bearing[2]/2 + 1, $fn=7, center=true);
        translate([0,-10,-12]) rotate([0,0,90]) oval(r=4.5,l=12,h=25);
	translate([0,-20,0]) rotate([90,60,0]) cylinder(r=3.4, h=5, $fn=6, center=true);
	translate([0,-20,0]) rotate([90,0,0]) cylinder(r=3.2/2, h=15, $fn=10, center=true);

//        translate([0,12,0]) {
//            %cylinder(h = idler_width, r=(idler_bearing[0] / 2) + 2 * single_wall_width, center=true);
//            cylinder(h = idler_width + 1, r=(idler_bearing[0] / 2) + 8, center=true);
//        }
            translate([0,12,0]) {
                idler_assy(idler_bearing);
                translate([0, 10, 0]) cube([20, 20, idler_width + 1], center=true);
            }

    }
}


motorholder();
translate([32,20,8]) rotate([0,90,0]) idlermount();

