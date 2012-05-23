use <bushing.scad>;
rod_distance = 45;

module x_end_motor(){


union(){
%translate(v=[0,0,0.5]) cube(size = [42,42,1], center = true);
rotate(a=[0,0,-90]) translate(v=[0,-9.5,0]) z_linear_bearings();

translate(v=[0,17,0]) %cylinder(h = 70, r=2.5);

// Nut trap
difference(){
translate(v=[-2,17.5,4]) cube(size = [16,15,8], center = true);

//bottom hole
translate(v=[0,17,-1]) cylinder(h = 4, r=2.45);
// nut slid in
translate(v=[5,17,4]) cube(size = [21,9.5,4.1], center = true);

translate(v=[0,17,6.5]) cylinder(h = 4, r=2.45);


}
}


//rod holder

difference(){
translate(v=[-4.5-10+2-1,17.5-10+2,30]) cube(size = [15+2,35+4,60], center = true);
translate(v=[0,0,26]) cube(size = [19,19,80], center = true);

// belt hole
translate(v=[-5.5-10+1.5,22-10,30]) cube(size = [10,46,32], center = true);



translate(v=[-14,-9,6]) rotate(a=[-90,0,0]) pushfit_rod(8,50);
translate(v=[-14,-9,rod_distance+6]) rotate(a=[-90,0,0]) pushfit_rod(8,50);

}
/// motor dummy
%translate(v=[21-5,-21-11,25]) cube(size = [42,42,42], center = true);


difference(){
translate(v=[-4.5-10+2-1,-21-11+1,26.5]) cube(size = [17,44,53], center = true);

// motor screw holes
translate(v=[21-5,-21-11,30.25]){
	// belt hole
	translate(v=[-30,1,0]) cube(size = [10,46,22], center = true);
	translate(v=[-10,-15.5,-15.5]) cube(size = [60,3.5,3.5], center = true);
	
	
	translate(v=[-10,-15.5,15.5]) cube(size = [60,3.5,3.5], center = true);
	translate(v=[-10,15.5,-15.5]) cube(size = [60,3.5,3.5], center = true);
	
	translate(v=[-10,15.5,15.5]) cube(size = [60,3.5,3.5], center = true);
	
	// material saving cutout
	translate(v=[-10,-40,-30]) rotate(a=[45,0,0])  cube(size = [60,42,42], center = true);
	translate(v=[0,0,0]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 80, r=18, $fn=6);
}

}
}


module x_end_idler(){


union(){
%translate(v=[0,0,0.5]) cube(size = [42,42,1], center = true);
rotate(a=[0,0,-90]) translate(v=[0,-9.5,0]) z_linear_bearings();

translate(v=[0,17,0]) %cylinder(h = 70, r=2.5);

// Nut trap
difference(){
translate(v=[-2,17.5,4]) cube(size = [16,15,8], center = true);

//bottom hole
translate(v=[0,17,-1]) cylinder(h = 4, r=2.45);
// nut slid in
translate(v=[5,17,4]) cube(size = [21,9.5,4.1], center = true);

translate(v=[0,17,6.5]) cylinder(h = 4, r=2.45);


}
}


//rod holder

difference(){
translate(v=[-4.5-10+2-1,17.5-10+2,30]) #cube(size = [15+2,35+4,60], center = true);
translate(v=[0,0,26]) cube(size = [19,19,80], center = true);

// belt hole
translate(v=[-5.5-10+1.5,22-10,30]) cube(size = [10,46,32], center = true);



translate(v=[-14,-11,6]) rotate(a=[-90,0,0]) pushfit_rod(8,50);
translate(v=[-14,-11,rod_distance+6]) rotate(a=[-90,0,0]) pushfit_rod(8,50);

// idler hole 
translate(v=[0,17+7,30.25]) rotate(a=[0,-90,0]) cylinder(h = 80, r=2.2, $fn=30);

}

}
mirror([0,0,0])x_end_idler();
//mirror([0,1,0]) x_end_motor();

module pushfit_rod(diameter,length){
	cylinder(h = length, r=diameter/2, $fn=30);
	translate(v=[0,-diameter/4,length/2]) cube(size = [diameter,diameter/2,length], center = true);
	
	translate(v=[0,-diameter/2-1.2,length/2]) cube(size = [diameter,1,length], center = true);
}