// PRUSA iteration3
// Z axis
// GNU GPL v3
// Josef Průša <josefprusa@me.com>
// Václav 'ax' Hůla <axtheb@gmail.com>
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>

module zmotorholder(thickness=13){
    difference(){
        union(){
            // Motor holding part
            difference(){
                union(){
                    zrodholder(thickness=thickness, xlen=45, ylen=45);
                    translate([board_to_xz_distance, board_to_xz_distance, 0]) {
                        nema17(places=[0,1,1,1], h=thickness);
                    }
                }

                // motor screw holes
                translate([board_to_xz_distance, board_to_xz_distance, thickness]) {
                    mirror([0,0,1]) translate([0,0,thickness-8])
                        nema17(places=[0,1,1,1], holes=true, h=thickness, shadow=5);
                }
            }
        }
    }
}


module zrodholder(thickness=13, ylen=40, xlen=34){
    difference(){
        union(){
            difference(){
                union(){
                    //piece along the flat side of a board
                    cube_fillet([14, ylen, thickness], vertical=[3,3,0,0]);
                    //hole for Z axis is thru this
                    cube_fillet([xlen, 14, thickness], vertical=[0,0,0,3] );
                    //piece along cut side of the board
                    translate([-board_thickness,0,0]) cube_fillet([board_thickness*2, 5, thickness], radius=2);
                }
                //smooth rod hole
                translate([board_to_xz_distance,5+(smooth_bar_diameter/2),-1]) cylinder(h=board_thickness+2, r=(smooth_bar_diameter/2));
                //inside rouned corner
                translate([0,5,-1]) cylinder(r=1.2, h=thickness+2, $fn=8);
                //side screw
                translate([-board_thickness/2, 0, thickness/2-1.5]) rotate([-90, 0, 0]) screw(h=30, r_head=4);
                //front screw
                translate([14+7, board_to_xz_distance +2.4, thickness/2+2.1]) rotate([0, -90, 0]) {
                    #screw(head_drop=12, h=122, r_head=4);
                    translate([0,0,-20]) cylinder(r=3, h=20, center=true);
                }
            }
        }
    }
}

module bearing_insert(r1=4, r2=2.4, h=7, $fn=3){
    difference(){
        cylinder(r=r1, h=h, $fn=$fn);
        translate([0,0,-0.1]) cylinder(r=r2, h=h+0.2, $fn=$fn);
    }
}

translate([0, -2, 0]) mirror([0,1,0]) zmotorholder();
translate([0,2,0]) zmotorholder();

translate([21,-59,0]) zrodholder(bearing_constraint=z_rod_constraint);
translate([20,59,0]) mirror([0,1,0]) zrodholder(bearing_constraint=z_rod_constraint);

