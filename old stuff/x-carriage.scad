// PRUSA Mendel  
// X-carriage
// Used for sliding on X axis
// GNU GPL v3
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>

/**
 * @id x-carriage
 * @name X carriage
 * @category Printed
 * @using 2 m4nut
 * @using 2 m4x25
 */

snap_in_mount = false;
use <bushing.scad>

module mountingholes(){
					translate(v = [0, -25, -5]) polyhole(m3_diameter,10);
					//translate(v = [0, -25, 5]) cylinder(h = 9, r=m4_nut_diameter/2, $fn=6, center=true);		
					translate(v = [0, 25, -5]) polyhole(m3_diameter,10);
					//translate(v = [0, 25, 5]) cylinder(h = 9, r=4.5, $fn=6, center=true);
}

module xcarriage(linear_bearings){
union(){
	translate(v = [0,0,2.5]) 
		union(){
			difference(){
				union(){
					//Base block
						translate(v = [15, 0, 0])cube(size = [35,50,5], center = true);
						translate(v = [0, 18.5, 0]) cube(size = [35,20,5], center = true);
						translate(v = [-2.4, -6, 0]) rotate(a=[0,0,15]) cylinder(h = 5, r=35, $fn=5, center=true);
						translate(v = [0, -31, 0]) cylinder(h = 5, r=m4_nut_diameter/2+2, $fn=6, center=true);	
					//Nut holder base - extruder
					
					if(linear_bearings){
						//Nut holder base - belt clamps
							translate(v = [23-(7.5/2)+5, -11, 0]) cube(size = [45-7.5+10,15,5], center = true);
							translate(v = [(33+45/2-7.5), -11, 0]) cylinder(h = 5, r=7.5, $fn=18, center=true);
						//Nut holder base - belt clamps
							translate(v = [23-(7.5/2)+5, 11, 0]) cube(size = [45-7.5+10,15,5], center = true);
							translate(v = [(33+45/2-7.5), 11, 0]) cylinder(h = 5, r=7.5, $fn=18, center=true);
						
					}else{
						//Nut holder base - belt clamps
							translate(v = [23-(7.5/2)+5, -18, 0]) cube(size = [45-7.5+10,15,5], center = true);
							translate(v = [(33+45/2-7.5), -18, 0]) cylinder(h = 5, r=7.5, $fn=18, center=true);
						//Nut holder base - belt clamps
							translate(v = [23-(7.5/2)+5, 18, 0]) cube(size = [45-7.5+10,15,5], center = true);
							translate(v = [(33+45/2-7.5), 18, 0]) cylinder(h = 5, r=7.5, $fn=18, center=true);}
				}
				
				//holes for linear bearings
				if(linear_bearings){
					translate(v = [25.01,-30.01,5.01])lm8uu_bearing_cut();
					translate(v = [25.01,30.01,5.01])lm8uu_bearing_cut();	
					translate(v = [-25.01,30.01,5.01])lm8uu_bearing_cut();
					//translate(v = [-35,-30,0]) rotate(a=[0,0,20]) cube(size = [30,70,10], center = true);
				}
				// holes for connecting extruder
				// SNAP IN MOUNT
				if(snap_in_mount){
					// Hotend hole
					translate(v = [0, -6, 0]) cylinder(h = 20, r=6, $fn=20, center=true);
					translate(v = [0, -6, 3]) cylinder(h = 2, r=8, $fn=20, center=true);
					translate(v = [0, 0, 3]) cube(size = [16,12,2], center = true);
					//translate(v = [0, -6, -5]) %cylinder(h = 2, r=8, $fn=20, center=true);

					translate(v = [0, 0, 0]) cube(size = [12,12,15], center = true);
					translate(v = [0, 8, 0]) cube(size = [16,16,15], center = true);
					translate(v = [0, 16, 0]) cylinder(h = 20, r=8, $fn=20, center=true);

					//cutouts for clips
					translate(v = [0, -4.5, 0]) translate(v = [-13, 6, 0]) cube(size = [4,45,15], center = true);
					translate(v = [0, -4.5, 0]) translate(v = [13, 6, 0]) cube(size = [4,45,15], center = true);
		
					//bigger oepening
					translate(v = [0, -4.5+12.5, 0]) translate(v = [-15.5, 6, 0]) cube(size = [9,20,15], center = true);
					translate(v = [0, -4.5+12.5, 0]) translate(v = [15.5, 6, 0]) cube(size = [9,20,15], center = true);
		
		
					translate(v = [0, -4.5+9.5, 0]) translate(v = [-15.5, 6, 6.5]) rotate(a=[-20,0,0])  cube(size = [9,20,15], center = true);
					translate(v = [0, -4.5+9.5, 0]) translate(v = [15.5, 6, 6.5]) rotate(a=[-20,0,0]) cube(size = [9,20,15], center = true);
		
					translate(v = [0, -4.5-12.5, 0]) translate(v = [-18, 6, 3.5]) cube(size = [4,20,3], center = true);
					translate(v = [0, -4.5-12.5, 0]) translate(v = [18, 6, 3.5]) cube(size = [4,20,3], center = true);
				
					//SNAP IN MOUNT END
				}else{
					//NORMAL MOUNT
					
					if(linear_bearings){
					translate(v = [0, -6, 0]){
					rotate(a=[0,0,23]) mountingholes();
					rotate(a=[0,0,-23]) mountingholes();
					rotate(a=[0,0,0]) mountingholes();
					}
					}else{
						translate(v = [0, -6, 0]){
						rotate(a=[0,0,26]) mountingholes();
						rotate(a=[0,0,-26]) mountingholes();
						rotate(a=[0,0,0]) mountingholes();
						}	
					}
					//removing some mass	
					translate(v = [0, 36, 0]) cylinder(h = 9, r=14, $fn=6, center=true);	
		
					// Hotend hole
					translate(v = [0, -6, 0]) cylinder(h = 20, r=20, $fn=20, center=true);
		
					//NORMAL MOUNT END
				}
				//ZIPTIE holes for connecting belt
				//translate(v = [38, -18, 2]) cube(size = [5,3.5,30], center = true);

				if(linear_bearings){
				//belt clamp holes
				translate(v = [0,-22,0]){
				translate(v = [30, 11, -5]) polyhole(m3_diameter,10);
				translate(v = [30, 11, 0.55]) nut(m3_nut_diameter,9);
				translate(v = [48, 11, -5]) polyhole(m3_diameter,10);
				translate(v = [48, 11, 0.55]) nut(m3_nut_diameter,9);
				}

				translate(v = [30, 11, -5]) polyhole(m3_diameter,10);
				translate(v = [30, 11, 0.55]) nut(m3_nut_diameter,9);
				translate(v = [48, 11, -5]) polyhole(m3_diameter,10);
				translate(v = [48, 11, 0.55]) nut(m3_nut_diameter,9);
				}else{//belt clamp holes
				translate(v = [0,-36,0]){
				translate(v = [30, 18, -5]) polyhole(m3_diameter,10);
				translate(v = [30, 18, 0.55]) nut(m3_nut_diameter,9);
				translate(v = [48, 18, -5]) polyhole(m3_diameter,10);
				translate(v = [48, 18, 0.55]) nut(m3_nut_diameter,9);
				}

				translate(v = [30, 18, -5]) polyhole(m3_diameter,10);
				translate(v = [30, 18, 0.55]) nut(m3_nut_diameter,9);
				translate(v = [48, 18, -5]) polyhole(m3_diameter,10);
				translate(v = [48, 18, 0.55]) nut(m3_nut_diameter,9);}

			}

	}
if(linear_bearings){
	difference(){
		translate(v = [25.01,-29.81,0]) cut_corners(true,true,false,false);
		translate(v = [0, -6, 0]) cylinder(h = 60, r=20, $fn=20, center=true);
	}
	translate(v = [25.01,28.01,0])cut_corners(false,false,true, true);
	translate(v = [-25.01,20.51,0])cut_corners(false,false,true, true);
}else{
translate(v = [25.01,-30.01,5.01])standart_bushing();
translate(v = [-25.01,-30.01,5.01])standart_bushing();
translate(v = [25.01,30.01,5.01])standart_bushing();
translate(v = [-25.01,30.01,5.01])standart_bushing();
}
}
}


xcarriage(linear);


