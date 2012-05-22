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



module bushing(stiff, lenght=11){
	difference(){
		union(){
			translate(v=[-7.5,-8,0])cube(size = [15,8,lenght]);
			cylinder(h = lenght, r=7.5);
		}
	//cutout inside
	//Opening
	rotate(a=[0,0,45]) translate(v=[1,1,-1]) cube(size = [16,16,lenght+2]);
	//Cutouts to make it more bendy
	if(stiff){
		translate(v=[-4.8,-6,-1]) cube(size = [0.8,6,lenght+2]);
		translate(v=[4,-6,-1]) cube(size = [0.8,6,lenght+2]);
	}else{
		translate(v=[-4.8,-8,-1]) cube(size = [0.8,8,lenght+2]);
		translate(v=[4,-8,-1]) cube(size = [0.8,8,lenght+2]);
	}
	translate(v=[0,5,(lenght+2)/2]) cube(size = [7,8,lenght+2], center=true);
	translate(v=[0,0,-1]) cylinder(h = lenght+2, r=5);
	}
}


module standart_bushing(){

difference(){translate(v=[0,5,8])rotate(a=[90,0,0]){
bushing(false, 10);
translate(v=[-7,-13,0])cube(size = [14,5,10]);
translate(v=[-2,-13,-3])cube(size = [4,5,16]);
translate(v=[-2,-12,-3])cube(size = [4,7.5,2]);
translate(v=[-2,-12,11])cube(size = [4,7.5,2]);
}
translate(v=[-3,-1,-16])rotate(a=[45,0,0])cube(size = [6,5,16]);

mirror([ 0, 1, 0 ]) translate(v=[-3,-1,-16])rotate(a=[45,0,0])cube(size = [6,5,16]);}
}


// Includes small cutouts for better prints
module vertical_bushing(stiff, lenght){
difference(){
bushing(stiff, lenght);
translate(v=[-5,0,-1]) cube(size = [10,2.5,lenght+2]);
}
}


//vertical_bushing(true, 11);

module z_bushings(){
// STUFF FOR X-ENDS
difference(){
// Slider.
translate([0,6.5,30]) 
cube([23,17,60],center=true);
// Slider cutout.
translate([0,10,32.5]) 
cube([17,17,70],center=true);
}
union(){translate([0,9.5,0])vertical_bushing(true,13);
	//translate([0,4,0.5])cube(size = [8,2,1], center = true);
	//translate([0,4,12.5])cube(size = [8,2,1], center = true);
	translate([0,9.5,48])vertical_bushing(true,13);
	//translate([0,4,48+0.5])cube(size = [8,2,1], center = true);
	//translate([0,4,48+12.5])cube(size = [8,2,1], center = true);
	translate([0,9.5,32])
	{
		difference()
		{
			bushing(true,16);
			translate([0,3,2]) 
			rotate([45,0,0])
			cube([16,30,16], center=true);
		}
	}
}
}


// Linear bushing options


lm8uu_diameter=(lme8uu==true) ? 16 : 15;
lm8uu_length=(lme8uu==true) ? 25 : 24;
lm8uu_radius = lm8uu_diameter / 2;
block_height = 2*lm8uu_length+17;



//z_bushings();
//
//linear_holder_base(60);
//cut_corners(true, false, true, false); 

module cut_corners(lf,lb,rf,rb){
	difference(){
	lm8uu_bearing_holder();
	if(lf) translate(v=[(10)-3,(-28.5/2)+3,0]) rotate(a=[0,0,45]) rotate(a=[35,0,0]) translate(v=[0,-5,0]) cube(size = [20,10,20], center = true);
	if(lb)translate(v=[(-10)+3,(-28.5/2)+3,0]) rotate(a=[0,0,-45]) rotate(a=[35,0,0]) translate(v=[0,-5,0]) cube(size = [20,10,20], center = true);
	mirror([ 0, 1, 0 ]){
	if(rf)translate(v=[(10)-3,(-28.5/2)+3,0]) rotate(a=[0,0,45]) rotate(a=[35,0,0]) translate(v=[0,-5,0]) cube(size = [20,10,20], center = true);
	if(rb)translate(v=[(-10)+3,(-28.5/2)+3,0]) rotate(a=[0,0,-45]) rotate(a=[35,0,0]) translate(v=[0,-5,0]) cube(size = [20,10,20], center = true);
	}
}
//lm8uu_bearing_holder();
}

module linear_holder_base(length){
	
difference(){
union(){
//main block
//translate(v=[-(lm8uu_radius+2.5)/2,0,block_height/2]) cube(size = [lm8uu_radius+2.5,lm8uu_diameter+5,block_height], center = true);
translate(v=[-5,0,length/2]) cube(size = [10,20,length], center = true);

//holder for main block in x-end
// leaving it out now
//translate(v=[0,0,0]) cylinder(h = length, r=10, $fn=60);

//translate(v=[-5,0,15.8/2]) cube(size = [12,23,15.8], center = true);
//translate(v=[0,0,0]) cylinder(h = block_height, r=lm8uu_radius+2.5, $fn=60);
}
//main axis
translate(v=[0,0,-2]) cylinder(h = length+4, r=(lm8uu_diameter+0.8)/2, $fn=50);
// not needed for zip tie
//main cut
//translate(v=[10,0,length/2]) cube(size = [20,14,length+4], center = true);
//smooth entry cut
//translate(v=[12,0,length/2]) rotate(a=[0,0,45]) cube(size = [20,20,length+4], center = true);
}
}


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


module z_linear_bearings(){

	translate(v=[0,9.5,0]) rotate(a=[0,0,90]){
		difference(){
			linear_holder_base(65);
			translate(v=[0,0,14.5+2]) ziptie();
			translate(v=[0,0,block_height-(12+2)-5]) ziptie();
		}

		//x-end adapter
		difference(){	
			translate(v=[-6,0,15.8/2]) cube(size = [10,23,15.8], center = true);
			translate(v=[0,0,-2]) cylinder(h = 20, r=7.9, $fn=50);
		}
		translate(v=[-(10-5.5)/2-lm8uu_radius+2,0,0+1]) cube(size = [10-5.5,20,2], center = true);
		translate(v=[-(10-5.5)/2-lm8uu_radius+2,0,lm8uu_length+4.0]) cube(size = [10-5.5,20,2], center = true);
		translate(v=[-(10-5.5)/2-lm8uu_radius+2,0,64-lm8uu_length-3]) cube(size = [10-5.5,20,2], center = true);
		translate(v=[-(10-5.5)/2-lm8uu_radius+2,0,64]) cube(size = [10-5.5,20,2], center = true);
	}
}

module ziptie(){
difference(){
translate(v=[0,0,0]) cylinder(h = 3.9, r=lm8uu_diameter);
translate(v=[0,0,0]) cylinder(h = 5, r=lm8uu_diameter-3, $fn=50);
translate(v=[0,0,3]) cylinder(h = 1, r1=lm8uu_diameter-3, r2=lm8uu_diameter, $fn=50);
}}




