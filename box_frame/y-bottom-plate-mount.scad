// PRUSA iteration3
// GNU GPL v3
// Josef Průša
// josefprusa@me.com
// prusadjs.cz


include <configuration.scad>


module rodclamp(){ 
    block_height = y_threaded_rod_long_r * 2 + 6 * layer_height;
    rotate([0, 90, 0]) 
    difference(){
        translate([block_height / 2, 0, 0])  cube([block_height, 30, 10], center=true);
        translate([y_threaded_rod_long_r - 0.4, 0, 0])
            cylinder(r= y_threaded_rod_long_r - 0.3 , h=20, center=true);
        cube(size=[y_threaded_rod_long_r * 2, y_threaded_rod_long_r * 2 - 1, 50], center=true);
        translate([block_height + 0.2, 10, 0]) rotate([0, -90, 0]) screw(head_drop=5);
        translate([block_height + 0.2, -10, 0]) rotate([0, -90, 0]) screw(head_drop=5);
    }
}


rodclamp();

