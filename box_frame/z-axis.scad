// PRUSA iteration3
// Z axis
// GNU GPL v3
// Josef Průša <josefprusa@me.com>
// Václav 'ax' Hůla <axtheb@gmail.com>
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>

module zmotorholder(thickness=(i_am_box == 0 ? 38 : 23), bottom_thickness=5){
    difference(){
        union(){
            // Motor holding part
            difference(){
                union(){
                    zrodholder(thickness=thickness, xlen=45, ylen=44, zdelta=((i_want_to_use_single_plate_dxf_and_make_my_z_weaker == 0) ? 0 : 5));
                    translate([board_to_xz_distance, board_to_xz_distance, 0]) {
                        nema17(places=[0, 1, 1, 1], h=bottom_thickness + layer_height, $fn=23, shadow=layer_height + 2);
                    }
                }

                // motor screw holes
                translate([board_to_xz_distance, board_to_xz_distance, thickness]) {
                    mirror([0, 0, 1]) translate([0, 0, thickness-8])
                        nema17(places=[0, 1, 1, 1], holes=true, h=bottom_thickness + 1, $fn=small_hole_segments);
                        //shadow=-6 + layer_height);
                }
            }
        }
    }
}


module zrodholder(thickness=(i_am_box == 0 ? 14 : 15), bottom_thickness=5, ylen=44, xlen=34, zdelta=0){
    holder_inner_r = 9;
    holder_inner_r2 = 2;
    difference(){
        union(){
            difference(){
                union(){
                    //piece along the flat side of a board
                    cube_fillet([14, ylen, bottom_thickness], vertical=[8, 3, 0, 0]);
                    cube_fillet([5, ylen, thickness], vertical=[3, 3, 0, 0], top = [thickness / 1.7, 0, 0, 5]);
                    //hole for Z axis is thru this
                    cube_fillet([xlen, 14, bottom_thickness], vertical=[3, 0, 0, 3]);
                    translate([14, 14, 0]) {
                        //large fillet that makes it stiffer by lot. Thanks to Marcus Wolschon
                        difference(){
                            cube([holder_inner_r, holder_inner_r, bottom_thickness]);
                            translate([holder_inner_r, holder_inner_r, -0.5])
                                cylinder(r=holder_inner_r, h=bottom_thickness + 1);
                        }
                    }
                    translate([5, 5, 0]) {
                        difference(){
                            cube([holder_inner_r2, holder_inner_r2, thickness - 5.5]);
                            translate([holder_inner_r2, holder_inner_r2, -0.5])
                                cylinder(r=holder_inner_r2, h=thickness + 1, $fn=20);
                        }
                    }
                    //piece along cut side of the board
                    if (i_am_box == 1) {
                        translate([-board_thickness, 0, 0])
                            cube_fillet([board_thickness + board_to_xz_distance + bushing_z[0], 5, thickness], radius=2, top = [0, 0, 0, thickness], $fn=99);
                    } else {
                        translate([-board_thickness/2, 0, 0])
                            cube_fillet([board_thickness/2 + board_to_xz_distance + bushing_z[0], 5, thickness], radius=2, top = [0, 0, 0, thickness], $fn=99);
                    }
                    //smooth rod insert
                    translate([board_to_xz_distance - z_delta, 9, 0])
                        cylinder(h=bottom_thickness / 2, r=(bushing_z[0] + 5 * single_wall_width));
                }
                //smooth rod hole
                translate([board_to_xz_distance - z_delta, 9, -1]) cylinder(h=board_thickness+20, r=bushing_z[0] + single_wall_width / 4);
                //inside rouned corner
                translate([0, 5, -1]) cylinder(r=0.8, h=100, $fn=8);
                //side screw
                //translate([-board_thickness/2, 0, thickness/2-1.5]) rotate([-90, 0, 0]) screw(h=30, r_head=4);
                //front screws
                if (i_am_box != 1) {
                    //single plate has both screws on front
                    translate([16, 35, bottom_thickness + 4.5 + zdelta]) rotate([0, -90, 0]) {
                        plate_screw();
                    }
                    translate([16, 15, bottom_thickness + 4.5 + zdelta]) rotate([0, -90, 0]) {
                        plate_screw();
                    }
                    //motor mount has third screw
                    translate([16, 25, bottom_thickness + 4.5 + zdelta + 20]) rotate([0, -90, 0]) {
                        plate_screw();
                    }
                } else {
                    translate([16, 30, bottom_thickness+4]) rotate([0, -90, 0]) {
                        plate_screw();
                    }
                    //side screw
                    translate([-board_thickness/2, -11, thickness/2]) rotate([-90, 0, 0]) plate_screw();
                }
            }
        }
    }
}
translate([10, -50, 0]) zmotorholder();
translate([0, 50, 0]) mirror([0, 1, 0]) zmotorholder();
translate([67, 14, 0]) rotate([0,0,90]) zrodholder();
translate([77, -14, 0]) rotate([0, 0, -90]) mirror([0, 1, 0]) zrodholder();
