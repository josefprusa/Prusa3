// rod holder for prusa i3 in folded position
module foldingclamp() {
difference(){
union(){
translate([-7.5,0,0])rotate([0,0,0])cube(size = [15,30,15]);
translate([-20,0,0])rotate([0,0,0])cube(size = [40,5,15]);
//translate([0,23,0])rotate([0,0,45])cube(size = [6,6,15]);
}
translate([-2.5,5,-2])rotate([0,0,0])cube(size = [5,12,20]); //lightening hole
translate([0,25,-1])rotate([0,0,0])cylinder(h=20, r=4); //main rod attachment hole
translate([-13,10,7.5])rotate([90,0,0])cylinder(h=20, r=1.5); //screw attachment hole
translate([13,10,7.5])rotate([90,0,0])cylinder(h=20, r=1.5); //screw attachment hole
translate([-3,23,-2])rotate([0,0,0])cube(size = [6,12,20]); //rod access hole

}
}

//foldingclamp();
translate([-15,1,0])rotate([0,0,0])foldingclamp();
translate([15,31,0])rotate([0,0,180])foldingclamp();
translate([-15,-31,0])rotate([0,0,0])foldingclamp();
translate([15,-1,0])rotate([0,0,180])foldingclamp();
