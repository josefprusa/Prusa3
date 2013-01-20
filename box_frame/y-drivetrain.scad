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


module idlermount(support=false){
    difference(){
        union(){
            //translate([8,8,0]) cylinder(h = 19, r=8);
            //translate([8,33,0]) cylinder(h = 19, r=8);
            translate([0,0,0]) cube_fillet([16,41,10+idler_width], vertical = [0,0,0,0], top = [3,0,3,0], bottom = [3,0,3,0]);
        }
        translate([8,8,-1]) cylinder(h = 120, r=idler_size_inner_r);
        translate([8,33,-1]) cylinder(h = 25, r=4.5);

        translate([8,8,4]) {
            %translate([0,0,1]) cylinder(h = idler_width, r=(idler_size/2)+2*single_wall_width);
            cylinder(h = idler_width+2, r=(idler_size/2)+8);
        }
    }
    if (support) {
        translate([0,-2,15]) cube([16,16,0.4]);
        translate([0,-2,0]) cube([16,1.3,15]);
    }

}

motorholder();
translate([25,0,16]) rotate([0,90,0]) idlermount();

