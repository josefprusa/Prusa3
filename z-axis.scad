module zmotorholder(){
difference(){
	union(){
		// Motor holding part
		translate(v = [21,21+5,0])
		{
			//#cube(size = [42,42,2], center=true);
			difference(){
				union(){
				translate(v = [2.5,0,0]) translate(v = [-21+4.5,-5,5]) cube(size = [9+5,36+5.5,10], center=true);
				translate(v = [2.55,0,0])translate(v = [-9.5,-21-5+7,5]) cube(size = [55,14,10], center=true);
				translate(v = [5,0,0])translate(v = [0,-21-5+8,5]) cube(size = [42,5,10], center=true);
				
				//%cylinder(h = 10, r=11);
				
				translate(v = [5,0,0])translate(v = [-15.5,-15.5,0]) cylinder(h = 10, r=5.5);
				translate(v = [5,0,0])translate(v = [-15.5,+15.5,0]) cylinder(h = 10, r=5.5);
				translate(v = [0,0,0])translate(v = [-15.5,+15.5,0]) cylinder(h = 10, r=5.5);
				translate(v = [5,0,0])translate(v = [15.5,-15.5,0]) cylinder(h = 10, r=5.5);
				
				translate(v = [5,0,0])translate(v = [15.5,-15.5-5,0]) cylinder(h = 10, r=5.5);
				}
				
				
				// inside rounded corner
				translate(v = [-21,-21,0]) cylinder(h = 12, r=1.2, $fn=8);
				
				//alignemnt tab
				translate(v = [-21+10-20,-21+10,5]) cube(size = [20,20,12], center=true);
				
				// Z smooth rod cutout
				translate(v = [5,0,0])translate(v = [0,-21+4.2,-1]) cylinder(h = 12, r=4.2);
				
				// motor screw holes
				translate(v = [5,0,0])translate(v = [-15.5,-15.5,-1]) cylinder(h = 9, r=1.7);
				translate(v = [5,0,0])	translate(v = [-15.5,+15.5,-1]) cylinder(h = 9, r=1.7);
				translate(v = [5,0,0])translate(v = [15.5,-15.5,-1]) cylinder(h = 9, r=1.7);
				// holes for heads
				translate(v = [5,0,0])translate(v = [-15.5,-15.5,7]) cylinder(h = 7, r=3.5);
				translate(v = [5,0,0])translate(v = [-15.5,+15.5,7]) cylinder(h = 7, r=3.5);
				translate(v = [5,0,0])translate(v = [15.5,-15.5,7]) cylinder(h = 7, r=3.5);
				
				
				// self tap screw holes
				translate(v = [-22,0,5]) rotate([0,90,0]) cylinder(h = 25, r=2, $fn=18);
				translate(v = [-13.5,0,5]) rotate([0,90,0]) cylinder(h = 2, r1=1.7, r2=3.5, $fn=18);
				translate(v = [-13.5+1.95,0,5]) rotate([0,90,0]) cylinder(h = 10, r=3.5, $fn=18);
				
				translate(v = [-21-6,-20,5]) rotate([90,0,0]) cylinder(h = 12, r=2, $fn=18);
				translate(v = [-21-6,-24.5,5]) rotate([90,0,0]) cylinder(h = 2, r1=1.7, r2=3.5, $fn=18);
			}
		}
		
	}
}
}


module zrodholder(){
difference(){
	union(){
		// Motor holding part
		translate(v = [21,21+5,0])
		{
			//#cube(size = [42,42,2], center=true);
			difference(){
				union(){
				translate(v = [2.5,0,0]) translate(v = [-21+4.5,-5,5]) cube(size = [9+5,25,10], center=true);
				translate(v = [5+2.5-2.5,0,0])translate(v = [-9.5-8,-21-5+7,5]) #cube(size = [40+5+5,14,10], center=true);
				//translate(v = [0,-21-5+8,5]) cube(size = [42,5,10], center=true);
				
				//%cylinder(h = 10, r=11);
				
				}
				
				//alignemnt tab
				translate(v = [-21+10-20,-21+10,5]) cube(size = [20,20,12], center=true);
				
				// Z smooth rod cutout
				translate(v = [5,0,0])translate(v = [0,-21+4.2,-1]) cylinder(h = 12, r=4.2);
				
				
				
				
				// self tap screw holes
				// self tap screw holes
				translate(v = [-22,0,5]) rotate([0,90,0]) cylinder(h = 25, r=2, $fn=18);
				translate(v = [-13.5,0,5]) rotate([0,90,0]) cylinder(h = 2, r1=1.7, r2=3.5, $fn=18);
				translate(v = [-13.5+1.95,0,5]) rotate([0,90,0]) cylinder(h = 10, r=3.5, $fn=18);
				
				translate(v = [-21-8,-20,5]) rotate([90,0,0]) cylinder(h = 12, r=2, $fn=18);
				translate(v = [-21-8,-24.5,5]) rotate([90,0,0]) cylinder(h = 2, r1=1.7, r2=3.5, $fn=18);
			}
		}
		
	}
}
}

//mirror([0,1,0])zmotorholder();
//translate(v = [0,2,0]) zmotorholder();

zrodholder();
translate(v = [0,-2,0]) mirror([0,1,0]) zrodholder();