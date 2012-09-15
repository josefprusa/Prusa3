// PRUSA iteration3
// Bushing/bearing housings
// GNU GPL v3
// Josef Průša <josefprusa@me.com>
// Václav 'ax' Hůla <axtheb@gmail.com>
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>

/**
 * @id bushing
 * @name Bushing
 * @category Printed
 * @id bushing
 */

// Linear bearing options
lm8uu_diameter=(bearing_type==1) ? 16 : 15;
lm8uu_length=(bearing_type==1) ? 25 : 24;
lm8uu_radius = lm8uu_diameter / 2;
block_height = 2*lm8uu_length+17;

// basic building blocks, housings for 1 bushing/bearing
// at [0,0] there is center of the smooth rod, pointing in Z

module linear_bushing_square(h=11) {
    translate([0,0,h/2]) {
        difference(){
            union(){
                translate([-10.5/2,0,0]) cube([10.5,13.8,h], center = true);
                cube([13.8,13.8,h], center = true);
            }
            cube([9,9,h+0.02], center = true);
        }
    }
}

module linear_bushing_round(h=11) {
    difference(){
        union(){
            translate([-10.5/2,0,h/2]) cube([10.5,13.8,h], center = true);
            cylinder(r=7.5, h=h);
        }
        translate([0,0,-0.01])  cylinder(r=5.1, h=h+0.02);
    }
}

module linear_bushing_bronze(h=11) {
    difference(){
        union(){
            translate([-10.5/2,0,h/2]) cube([10.5,13.8,h], center = true);
            cylinder(r=10.7, h=h);
        }
        translate([0,0,-0.01])  cylinder(r=8.1, h=h+0.02);
    }
}

// select right bushing and cut it at angle, so it can be printed upside down
module linear_bushing_long(h=30){
    intersection(){
        if (bushing_type == 0) {
            linear_bushing_square(h);
        }
        if (bushing_type == 1) {
            linear_bushing_round(h);
        }
        if (bushing_type == 2) {
            linear_bushing_bronze(h);
        }
        if (bushing_type == 2) {
            translate([0, 0, 0]) rotate([0,-55,0]) cube([30, 40, 80], center=true);
        } else {
            translate([0, 0, -4]) rotate([0,-45,0]) cube([30, 40, 80], center=true);
        }
    }
}

module linear_bushing(h=65){
    translate([-9.5,0,h/2]) cube([2,13.8,h], center=true);
    linear_bushing_long(h);
    if (h>30) {
        translate([0,0,h]) mirror([0,0,1]) linear_bushing_long(30);
    }
}

//this is for Z axis
module bushing_negative(h=lm8uu_length+4){
    if (bearing_choice == 1) {
        if (bushing_type == 0) {
            translate([0,0,h/2]) cube([9,9,h+0.02], center = true);
        }
        if (bushing_type == 1) {
            translate([0,0,-0.01])  cylinder(r=5.1, h=h+0.02);
        }
        if (bushing_type == 2) {
            translate([0,0,-0.01])  cylinder(r=8.1, h=h+0.02);
        }
    } else {
        translate([0,0,-0.01])  cylinder(r=lm8uu_radius+0.4, h=h+0.02);
    }

}

// this should be more parametric
module firm_foot(){
    difference(){
        union() {
            translate([3-0.25,16,0]) cube_fillet([8.5,18,20], top=[11,0,0,0], center=true);
        }
        #translate([7,14,0]) rotate([0,-90,0]) screw();
    }
}

module spring_foot(){

    difference(){
        union() {
            translate([0.5,23.5,0]) cube_fillet([3,14,20], top=[11,0,0,0], center=true);
            translate([5,17,0]) rotate([0,0,-15]) cube_fillet([12,3,20], center=true);
            translate([5,13,0]) rotate([0,0,25]) cube_fillet([13,3,20], center=true);
            translate([0,9,0]) cube_fillet([3,6,20], vertical=[0,2,0,0], center=true);
        }
        translate([2,24,0]) rotate([0,-90,0]) screw();
    }
}

module y_bearing(float=false){
    if (bearing_choice == 2) {
        linear_bearing(lm8uu_length+4);
    } else {
        linear_bushing_long(20);
    }
    translate([-9,0,10]) {
        if (float) {
            spring_foot();
            mirror([0,1,0]) spring_foot();
        } else {
            firm_foot();
            mirror([0,1,0]) firm_foot();
        }
    }
}


module linear_bearing(h=0, fillet=false){
    linear_holder_base((h > lm8uu_length+4)? h : lm8uu_length+4, fillet);
    translate([-(3)/2-lm8uu_radius+2,0,1]) cube([3,18,2], center = true);
    translate([-(3)/2-lm8uu_radius+2,0,((h > lm8uu_length+4)? h : lm8uu_length+4)-1]) cube([3,18,2], center = true);
    if ( (h-4)/2 > lm8uu_length){
        translate([-(3)/2-lm8uu_radius+2,0,h/2]) cube([3,18, (h-4)-2*lm8uu_length], center = true);
    }
}

module linear_holder_base(length, fillet=false){

    difference(){
        union(){
            //main block
            translate([-10.5/2,0,length/2]) cube([10.5,lm8uu_diameter+5,length], center = true);
            translate([0,0,0]) cylinder(h = length, r=lm8uu_radius+2.5, $fn=60);
        }
        //main axis
        translate([0,0,-2]) cylinder(h = length+4, r=(lm8uu_diameter+0.4)/2, $fn=50);
        // not needed for zip tie
        //main cut
        translate([10,0,length/2]) cube([20,14,length+4], center = true);
        //smooth entry cut
        translate([12,0,length/2]) rotate([0,0,45]) cube([20,20,length+4], center = true);
        if (fillet) {
            translate([0,0,length/2 ]) cube_negative_fillet([21,lm8uu_diameter+5,length], vertical=[0,3,3,0]);
        }
    }
}


%cylinder(r=4, h=90);
y_bearing();
translate([0,52,0]) y_bearing();
if (bearing_choice == 2) {
    translate([-22, 23, 0]) y_bearing();
} else {
    translate ([-26,23,0]) mirror([1,0,0]) y_bearing(true);
}
