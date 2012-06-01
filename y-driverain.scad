// PRUSA Mendel  
// Y drivetrain (except bed parts)
// GNU GPL v3
// Josef Prusa
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

use <inc/functions.scad>
include <configuration.scad>

module motorholder(thickness=10){
    difference(){
        union(){
            // Motor holding part
            translate(v = [29,-21+50,0])
            {
                //#cube(size = [42,42,2], center=true);
                difference(){
                    union(){
                        translate(v = [-21+4.5,0,5]) cube(size = [9,31,thickness], center=true);
                        nema([0,1,1,0], thickness=thickness);
                        // Parts joining part
                        translate(v = [-29,-21,0]) cube(size = [14,30,thickness]);
                    }
                    // Motor mounting holes
                    translate([0,0,thickness]) mirror([0,0,1]) nema([0,1,1,0], thickness=thickness, holes=true);
                }
            }

            // Front holding part
            translate(v = [0,10,0]) cylinder(h = thickness, r=8);
            translate(v = [0,20,5])cube(size = [16,20,thickness], center=true);
            translate(v = [0,30,0])cylinder(h = thickness, r=8);
        }
        translate(v = [0,10,-1]) cylinder(h = 12, r=4.5);
        translate(v = [0,30,-1])cylinder(h = 12, r=4.5);
    }
}


module idlermount(support=false){
    difference(){
        union(){
            translate(v = [8,8,0]) cylinder(h = 19, r=8);
            translate(v = [8,33,0]) cylinder(h = 19, r=8);
            translate(v = [0,7,0]) cube([16,27,19]);
        }
        translate(v = [8,8,-1]) cylinder(h = 120, r=idler_size_inner_r);
        translate(v = [8,33,-1])cylinder(h = 25, r=4.5);

        translate(v = [8,8,4])cylinder(h = 11, r=(idler_size/2)+8);
    }
    if (support) {
        translate([0,-2,15]) cube([16,16,0.4]);
        translate([0,-2,0]) cube([16,1.3,15]);
    }

}

motorholder();
translate([25,0,0])  idlermount(true);

