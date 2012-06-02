use <bushing.scad>
use <inc/functions.scad>
rod_distance = 45;

module x_end_motor(){

    x_end_idler([3,3,0,0], thru=false);
    /// motor dummy
    //%translate([21-5,-21-11,25]) cube(size = [42,42,42], center = true);


    difference(){
        translate([-4.5-10+2-1,-21-11+1,29.5]) cube_fillet(size = [17,44,45], center = true, vertical=[0,0,3,3], top=[0,3,6,3], bottom=[0,0,6,0]);

        // motor screw holes
        translate([21-5,-21-11,30.25]){
            // belt hole
            translate([-30,1,0]) cube(size = [10,46,22], center = true);
            //motor mounting holes
            translate([-41, 0, 0]) rotate([90, 0, 0])  rotate([0, 90, 0]) nema17(places=[1,1,1,1], holes=true, shadow=16, $fn=6, h=20);
            translate([0,0,0]) rotate([0,-90,0]) rotate([0,0,90]) cylinder(h = 80, r=18, $fn=6);
        }
    }
    translate([-22, -10.5, 0]) cube(size = [17, 2, 15]);
    translate([-22, -10.5, 45]) cube(size = [17, 2, 10]);
    //motor support
    translate([-22, -53, 7]) cube(size = [17, 44, 1]);
    translate([-22, -54, 0]) cube_fillet(size = [17, 3, 8], radius=1.5);
    translate([-22, -30, 0]) cube_fillet(size = [17, 3, 8], radius=1.5);
}


module x_end_idler(vfillet=[3,3,3,3], thru=true){
    difference(){
        union(){
            difference(){
                translate([-4.5-10+2-1,17.5-10+2,30]) cube_fillet(size = [15+2,35+5,60], center = true, vertical=vfillet, top=[5,3,5,3]);
                translate([0,0,26]) cube(size = [19,19,80], center = true);
            }
            rotate([0,0,-90]) translate([0,-9.5,0]) z_linear_bearings();
            // Nut trap
            difference(){
                translate([-2,17.5,4]) cube_fillet(size = [16,18,8], center = true, vertical=[3,0,0,0]);

                //bottom hole
                translate([0,17,-1]) cylinder(h = 4, r=2.45);
                //nut slid in
                translate([5,17,4]) cube(size = [21,9.5,4.1], center = true);

                translate([0,17,6.5]) cylinder(h = 4, r=2.45);
            }
        }

        // belt hole
        translate([-5.5-10+1.5,22-10,30]) cube(size = [10,46,32], center = true);

        if(thru == true){
            translate([-14,-11,6]) rotate([-90,0,0]) pushfit_rod(8,50);
            translate([-14,-11,rod_distance+6]) rotate([-90,0,0]) pushfit_rod(8,50);
        } else {
            translate([-14,-7,6]) rotate([-90,0,0]) pushfit_rod(8,50);
            translate([-14,-7,rod_distance+6]) rotate([-90,0,0]) pushfit_rod(8,50);
        }

        // idler hole
        translate([0,17+7,30.25]) rotate([0,-90,0]) cylinder(h = 80, r=2.2, $fn=30);

    }

    //threaded rod
    translate([0,17,0]) %cylinder(h = 70, r=2.5);

}
mirror([0,0,0]) x_end_idler(thru=true);
// translate([40,40,0]) x_end_idler(thru=false);
translate([40,0,0]) mirror([0,1,0]) x_end_motor();

module pushfit_rod(diameter,length){
    cylinder(h = length, r=diameter/2, $fn=30);
    translate([0,-diameter/4,length/2]) cube(size = [diameter,diameter/2,length], center = true);

    translate([0,-diameter/2-1.2,length/2]) cube(size = [diameter,1,length], center = true);
}
