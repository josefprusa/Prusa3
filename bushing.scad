// PRUSA Mendel
// Bushings
// GNU GPL v3
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>

/**
 * @id bushing
 * @name Bushing
 * @category Printed
 * @id bushing
 */


//
module linear_bushing_square(h=11) {
    translate([0,0,h/2]) {
        difference(){
            union(){
                //main block
                translate(v=[-10.5/2,0,0]) cube(size = [10.5,13.8,h], center = true);
                cube(size = [13.8,13.8,h], center = true);
                }
                translate([0,0,0]) cube(size = [9,9,h+0.04], center = true);
        }
    }
}

//linear_bushing_square();

module linear_bushing_round(h=11) {
    difference(){
        union(){
            //main block
            translate(v=[-10.5/2,0,h/2]) cube(size = [10.5,15,h], center = true);
            cylinder(r=7.5, h=h);
        }
        translate([0,0,-0.01])  cylinder(r=5.1, h=h+0.02);
    }
}

module linear_bushing_bronze(h=11) {
    difference(){
        union(){
            //main block
            translate(v=[-10.5/2,0,h/2]) cube(size = [10.5,15,h], center = true);
            cylinder(r=10.5, h=h);
        }
        translate([0,0,-0.01])  cylinder(r=8.1, h=h+0.02);
    }
}

//linear_bushing_round();
//linear_bushing_bronze();


module linear_bushing_long(){
    intersection(){
        if (bushing_type == 0) {
            linear_bushing_round(30);
        }
        if (bushing_type == 1) {
            linear_bushing_square(30);
        }
        if (bushing_type == 2) {
            linear_bushing_bronze(30);
        }
        if (bushing_type == 2) {
            translate([0, 0, 0]) rotate([0,-55,0]) cube([30, 40, 80], center=true);
        } else {
            translate([0, 0, -4]) rotate([0,-45,0]) cube([30, 40, 80], center=true);
        }

    }
}

linear_bushing_long();

module linear_bearing(){

    translate(v=[0,9.5,0]) rotate(a=[0,0,90]){
        linear_holder_base(65);
        translate(v=[-(10-5.5)/2-lm8uu_radius+2,0,0+1]) cube(size = [10-5.5,20,2], center = true);
        translate(v=[-(10-5.5)/2-lm8uu_radius+2,0,64]) cube(size = [10-5.5,20,2], center = true);
    }
}

// Linear bushing options

lm8uu_diameter=(bearing_type==0) ? 16 : 15;
lm8uu_length=(bearing_type==0) ? 24 : 25;
lm8uu_radius = lm8uu_diameter / 2;
block_height = 2*lm8uu_length+17;


module linear_holder_base(length){

    difference(){
        union(){
            //main block
            translate(v=[-10.5/2,0,length/2]) cube(size = [10.5,lm8uu_diameter+5,length], center = true);
            translate(v=[0,0,0]) cylinder(h = length, r=lm8uu_radius+2.5, $fn=60);
        }
        //main axis
        translate(v=[0,0,-2]) cylinder(h = length+4, r=(lm8uu_diameter+0.8)/2, $fn=50);
        // not needed for zip tie
        //main cut
        translate(v=[10,0,length/2]) cube(size = [20,14,length+4], center = true);
        //smooth entry cut
        translate(v=[12,0,length/2]) rotate(a=[0,0,45]) cube(size = [20,20,length+4], center = true);
    }
}

%linear_holder_base(55);


module y_linear_bearings(){
    difference(){
        union(){
            translate(v=[0,0,1.5]) cube(size = [26,14,3], center = true);
            translate(v=[-13,0,0])rotate(a=[0,0,30])cylinder(h = 3, r=7, $fn=6);
            translate(v=[13,0,0])rotate(a=[0,0,30])cylinder(h = 3, r=7, $fn=6);
        }


        translate(v=[-14,0,0])polyhole(m3_diameter, 10);
        translate(v=[14,0,0])polyhole(m3_diameter, 10);
        //hack
        translate(v=[0,14.25,4.5]) rotate(a=[90,0,0]) translate(v=[0,9.5,0]) rotate(a=[0,0,90]){
            translate(v=[0,0,lm8uu_length/2+0.5]) ziptie();
        }
    }

    cut_corners(true, true, true, true);



}

lm8uu_holder_length = lm8uu_length+4.5;
lm8uu_holder_width= lm8uu_diameter+5;

module lm8uu_bearing_holder(){
    translate(v=[0,14.25,4.5])rotate(a=[90,0,0])translate(v=[0,9.5,0]) rotate(a=[0,0,90]){

        difference(){
            union(){
                linear_holder_base(lm8uu_length+4.5);
                translate(v=[-10-2,0,lm8uu_holder_length/2]) cube(size = [4,20,lm8uu_holder_length], center = true);
            }
            translate(v=[0,0,12.5]) ziptie();
        }


        translate(v=[-(10-5.5)/2-5.5,0,0.75]) cube(size = [10-5.5,20,1.5], center = true);
        translate(v=[-(10-5.5)/2-5.5,0,lm8uu_length+3.75]) cube(size = [10-5.5,20,1.5], center = true);

    }
}

module lm8uu_bearing_cut()
{
    translate([-lm8uu_holder_width/2,-lm8uu_holder_length/2,-5])cube([lm8uu_holder_width,lm8uu_holder_length,20]);
}



module ziptie(){
    difference(){
        translate(v=[0,0,0]) cylinder(h = 3.9, r=lm8uu_diameter);
        translate(v=[0,0,0]) cylinder(h = 5, r=lm8uu_diameter-3, $fn=50);
        translate(v=[0,0,3]) cylinder(h = 1, r1=lm8uu_diameter-3, r2=lm8uu_diameter, $fn=50);
    }}


//z_linear_bearings();
//ziptie();
