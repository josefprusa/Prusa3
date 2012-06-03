include <configuration.scad>
translate([10+16, 0, 0]){

    %translate([0, 0, 35/2]) cube(size = [20, 6, 35], center = true);
    translate([-24.5+6.5, 0, 17.5]) cube_fillet(size = [16, 14, 35], center = true, vertical=[3,0,0,0], fn=8 );
    translate([-20+5.5, 1.5-7, 17.5]) cube(size = [16, 3, 35], center = true);

    difference(){
        union(){

            translate([-37.5+13, 0, 5]) cube_fillet(size = [3, 35, 10], center = true, radius=1, $fn=8);
            translate([-37.5+13, 0, 22.5]) cube(size = [3, 14, 45], center = true);
            translate([-5.5, 0, 17.5]) cube_fillet(size = [7, 14, 35], center = true, vertical = [2,2,0,2], fn=8);

        }
        translate([-5.5, 0, 17.5]) cube(size = [9, 10, 10], center = true);
        translate([0, -12, 5]) rotate([0, -90, 0]) cylinder(h=50, r= 2.5);
        translate([0, 12, 5]) rotate([0, -90, 0]) cylinder(h=50, r= 2.5);

        translate([0, 0, 40]) rotate([0, -90, 0]) cylinder(h=50, r= 2.5);
        intersection() {
            for (i = [0 : 35/belt_tooth_distance])
            {
                translate([-8.5, 0, 1+i*belt_tooth_distance]) cube(size = [2, 10, belt_tooth_distance*belt_tooth_stride], center = true);
            }
            translate([0, 0, 35/2]) cube(size = [20, 10, 35], center = true);
        }
    }
}
