// PRUSA iteration3
// Y frame corners
// GNU GPL v3
// Josef Průša <josefprusa@me.com>
// Václav 'ax' Hůla <axtheb@gmail.com>
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>
use <y-drivetrain.scad>

module nutrod(r=4.4){
    //threared rods
    rotate([0,90,0]){
        translate([0,0,-5]) cylinder(h = 270, r=r, $fn=30);
    }
}

/*
   20 mm betwenn the front threaded rods
   25 mm between the side threaded and smooth rod
 */

module leftfront(thru = false){
    y_end_plug=2;
    // translate so the rod is on x = 0
    translate([-11,-y_end_plug,0])

        difference(){
            if (thru == false) {
                translate([0,0,12-board_thickness]) cube_fillet([22, 22, 40 + board_thickness + xy_delta], vertical=[4,4,4,4], top=[2,6,6,6], fn=8);
            } else {
                translate([0,0,12-board_thickness]) cube_fillet([22, 22, 41.5 + board_thickness + xy_delta], vertical=[4,4,4,4], top=[2,4,9,4], fn=8);
            }

            //threaded rods across (short)
            translate([0,11,10]) rotate([0,0,0]) nutrod();
            translate([0,11,30]) rotate([0,0,0]) nutrod();
            //threaded rod along (long, M10)
            translate([11, 0, 14.6 + y_threaded_rod_long_r]) rotate([0,0,90]) nutrod(r=y_threaded_rod_long_r);

            if(thru==false){
                //Leave space on part top thru which the rod is inserted, but not too big so it still snaps in
                translate([11, 15 + y_end_plug, 48 + bushing_xy[0] * 0.75 + xy_delta]) cube([bushing_xy[0] * 2.05, 30, 4], center=true);
                //Actual smoooth rod
                translate([11, y_end_plug, 48 + xy_delta]) rotate([0, 90, 90]) cylinder(h = 270, r=bushing_xy[0]);
            }else{
                translate([11, 17-5, 48 + 2.05 + xy_delta]) cube([8.2, 30, 4.1], center=true);
                translate([11, -3, 48 + xy_delta]) rotate([0, 90, 90]) cylinder(h = 270, r=4.0);
            }

        }
}

leftfront();
translate([40,0,0]) mirror([1,0,0]) leftfront();
//translate([12,2,28]) rotate([0,0,0]) cube([10,4,1], center=true);

translate([0,40,0]) {
    leftfront();
    translate([40,0,0]) mirror([1,0,0]) leftfront();
    //translate([12,2,28]) rotate([0,0,0]) cube([10,4,1], center=true);
}
