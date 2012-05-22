// PRUSA Mendel  
// Frame vertex
// GNU GPL v3
// Greg Frost
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel


include <configuration.scad>

module nutrod(){
	rotate([0,90,0]){
			//translate(v = [0,0,-0.1]) nut(m8_nut_diameter,6.7,false);
			translate(v = [-7.5/2,0,7/2-1.5]) cube(size = [7.5,15,7], center=true);
			translate(v = [0,0,-1.5]) cylinder(h = 7, r=7.5);
			cylinder(h = 270, r=4.4, $fn=30);
		}
}

/*
20 mm betwenn the front threaded rods
25 mm between the side threaded and smooth rod
*/
module leftfront(thru = false){
// translate so the rod is on x = 0
translate(v = [-11,0,0])

difference(){
intersection(){
cube(size = [22,22,thru?50.5:49]);
translate(v = [11,11,25]) rotate([0,0,45]) cube(size = [27,27,55], center=true);
}

translate(v = [-1,11,65]) rotate([0,45,0]) cube(size = [30,30,30], center=true);
translate(v = [23,11,65]) rotate([0,45,0]) cube(size = [30,30,30], center=true);
translate(v = [10,-4,65]) rotate([45,0,0]) cube(size = [30,30,30], center=true);



translate(v = [0,11,10]) rotate([0,0,0]) nutrod();

translate(v = [14,0,20]) rotate([0,0,90]) rotate([00,0,0]) nutrod();

translate(v = [0,11,30]) rotate([0,0,0]) nutrod();

if(thru==false){
translate(v = [11,17,45+2.05]) rotate([0,0,0]) #linear_extrude(height=4.1) square(size = [8.2,30], center=true);
translate(v = [11,2,45]) #rotate([0,90,90]) cylinder(h = 270, r=4.1);
}else{
translate(v = [11,17-5,45+2.05]) rotate([0,0,0]) #cube(size = [8.2,30,4.1], center=true);
translate(v = [11,2-5,45]) #rotate([0,90,90]) cylinder(h = 270, r=4.1);
}

}
}

//leftfront positioned for printing
module leftfrontprint(){
 	rotate([0,0,0])leftfront();
}

module motorholder(){
difference(){
	union(){
		// Motor holding part
		translate(v = [29,-21+50,0])
		{
			//#cube(size = [42,42,2], center=true);
			difference(){
				union(){
				translate(v = [-21+4.5,0,5]) cube(size = [9,31,10], center=true);
				translate(v = [-15.5,-15.5,0]) cylinder(h = 10, r=5.5);
				translate(v = [-15.5,+15.5,0]) cylinder(h = 10, r=5.5);
				// Parts joining part
				translate(v = [-29,-21,0]) cube(size = [14,30,10]);
				}
				translate(v = [-15.5,-15.5,-1]) cylinder(h = 10, r=1.7);
				translate(v = [-15.5,+15.5,-1]) cylinder(h = 10, r=1.7);
				// holes for heads
				translate(v = [-15.5,-15.5,7]) cylinder(h = 7, r=3.5);
				translate(v = [-15.5,+15.5,7]) cylinder(h = 7, r=3.5);
				// Motor mounting holes
			}
		}
		
		// Front holding part
		translate(v = [0,10,0]) cylinder(h = 10, r=8);
		translate(v = [0,20,5])cube(size = [16,20,10], center=true);	
		translate(v = [0,30,0])cylinder(h = 10, r=8);
	}
	translate(v = [0,10,-1]) cylinder(h = 12, r=4.5);	
	translate(v = [0,30,-1])cylinder(h = 12, r=4.5);
}




//translate(v = [0,25,0])#cube(size = [22,50,1], center=true);
}

module idlermount(){
	difference(){
		union(){
			translate(v = [0,0,0]) cylinder(h = 19, r=8);	
			translate(v = [0,20,0])cylinder(h = 19, r=8);
			translate(v = [0,10,9.5])cube(size = [16,20,19], center=true);
			translate(v = [-4,10,9.5])cube(size = [8,16+20,19], center=true);
		}
		translate(v = [0,0,-1]) cylinder(h = 120, r=2.5);	
		translate(v = [0,20,-1])cylinder(h = 25, r=4.5);
		
		translate(v = [0,0,4])cylinder(h = 11, r=12);
	}
}

module idler(){
	difference(){
		union(){
			translate(v = [0,10,2.5])cube(size = [17,20,16], center=true);
		}
		translate(v = [0,0,-1]) cylinder(h = 20, r=4.5, $fn=15);
	}
	
}
//motorholder();
//translate(v = [30,15,0]) idlermount();
//translate(v = [10,15,0]) idlermount();
//translate(v = [-15,15,0]) idler();
//motorholder();
//idlermount();
print = 1;
if(print==1){
	leftfrontprint();
	translate(v = [25,0,0]) mirror([1,0,0]) leftfrontprint();
	translate(v = [12,2,28]) rotate([0,0,0]) cube(size = [10,4,1], center=true);

	translate(v = [0,25,0]) {leftfrontprint();
	translate(v = [25,0,0]) mirror([1,0,0]) leftfrontprint();
	translate(v = [12,2,28]) rotate([0,0,0]) cube(size = [10,4,1], center=true);}
}
if(print==2){

motorholder();
// drawing corners
leftfront(); 
translate(v = [160,0,0]) mirror([1,0,0]) leftfront();
translate(v = [0,350,0]) mirror([0,1,0]){
	leftfront();
	translate(v = [160,0,0]) mirror([1,0,0]) leftfront();
	// back bottom threaded rod
	translate(v = [0,10,10]) rotate([0,90,0]) cylinder(h = 160, r=4);

	// back top threaded rod
	translate(v = [0,10,30]) rotate([0,90,0]) cylinder(h = 160, r=4);
}

// front bottom threaded rod
translate(v = [0,10,10]) rotate([0,90,0]) cylinder(h = 160, r=4);

// front top threaded rod
translate(v = [0,10,30]) rotate([0,90,0]) cylinder(h = 160, r=4);

// left top rod
translate(v = [0,0,45]) rotate([0,90,90]) cylinder(h = 350, r=4);
//left bottom rod
translate(v = [3,0,20]) rotate([0,90,90]) cylinder(h = 350, r=4);

// right top rod
translate(v = [160,0,45]) rotate([0,90,90]) cylinder(h = 350, r=4);
//right bottom rod
translate(v = [160-3,0,20]) rotate([0,90,90]) cylinder(h = 350, r=4);
}