//Greg adapter for i3 vertical carriage
use <nuts_and_bolts.scad>;


//params
tollerance = 0.2;
screw_tollerance = 0.6;

//hotend params
groove_dia = 12+tollerance;
groove_thickness = 4.40;
hotend_dia = 16+tollerance;

//greg params
greg_width = 31.5;
greg_length = 76-tollerance;
greg_screws = 4+screw_tollerance;
wheels_offset = 12.5;
hole_0_1 = 34;
hole_0_2 = 15.5;
hole_1_1 = 9.5;
hole_1_2 = 15.2;
hole_2_1 = 59;  
hole_2_2 = hole_1_2;

//adapter body param
front_plate_top_screw_offset = 2.5;
front_plate_width_up = 33.3;
front_plate_width_down = 58;
front_plate_height_up = 45;
front_plate_height_down = 23;
front_plate_thickness = 5;
belt_spacing = 2.5;
body_screws = 3+screw_tollerance;
front_plate_height = body_screws/2 + front_plate_height_down +  front_plate_top_screw_offset + 8;
plate_thickness = 6;
plate_width = greg_width + wheels_offset;
plate_length = greg_length;
side_locks_width = 17;
side_locks_length = (plate_length - front_plate_width_up) /2;
side_locks_height =  front_plate_height-front_plate_height_down;
wall_thickness = 4;
r_support = 28;
hole_distance = 25.2;
hole_h1 = 8.5;
wall_angle = 70;
fan_height = 0;
fan_screw = 0;

//module adapter_body
module adapter_body(){
	
	//extruder plate
	translate([0,0,0]) cube([plate_length,plate_width,plate_thickness]);
	
	//front plate
	translate([0,0,0]) cube([plate_length,front_plate_thickness,front_plate_height]);
	
	//side locks
	translate([0,-side_locks_width,0]) cube([side_locks_length,side_locks_width,side_locks_height]);
	translate([plate_length-side_locks_length,-side_locks_width,0]) cube([side_locks_length,side_locks_width,side_locks_height]);
	
	//side walls
	difference(){
		translate([0,0,0]) { 
			translate([0,0,0])cube([wall_thickness,plate_width,front_plate_height]);
			translate([plate_length-wall_thickness,0,0]) cube([wall_thickness,plate_width,front_plate_height]);
		}
		translate ([0,plate_width,plate_thickness])rotate(a=[wall_angle,0,0]) cube([30,34,60]);
		translate ([plate_length-wall_thickness,plate_width,plate_thickness])rotate(a=[wall_angle,0,0]) cube([30,34,60]);
	}	
	
	//corner support
	difference() {
		translate([wall_thickness,front_plate_thickness,plate_thickness]) cube([plate_length-2*wall_thickness-fan_height,r_support/2,r_support/2]);
		//corner support smoothing
		translate ([wall_thickness-0.01,r_support/2+front_plate_thickness,r_support/2+plate_thickness]) rotate(a=[0,90,0]) cylinder(r=r_support/2, h=plate_length-2*wall_thickness-fan_height+0.02, $fn=60);
	}
	
	//opto flag 
	translate([-12,plate_width-32,0]) cube([12,2,7]);
	
}



module adapter_holes(){

	//groove hole 
	translate([hole_0_1,plate_width-hole_0_2,0]) cylinder(r=groove_dia/2, h=groove_thickness, $fn=60);
	
	//groove channel
	translate([hole_0_1-groove_dia/2,plate_width-hole_0_2,0]) #cube([groove_dia,hole_0_2, groove_thickness]);
	
	//hotend hole 
	translate([hole_0_1,plate_width-hole_0_2,groove_thickness]) cylinder(r=hotend_dia/2, h=plate_thickness-groove_thickness+20, $fn=60);
	
	//hotend channel
	translate([hole_0_1-hotend_dia/2,plate_width-hole_0_2,groove_thickness])cube([hotend_dia,hole_0_2,plate_thickness- groove_thickness+20]);
	
	//greg mounting holes
	translate([hole_1_1,plate_width-hole_1_2,0]) cylinder(r=greg_screws/2, h=plate_thickness, $fn=60);
	translate([hole_2_1,plate_width-hole_2_2,0]) cylinder(r=greg_screws/2, h=plate_thickness, $fn=60);
	
	//adapter mounting holes
	translate ([plate_length/2-hole_distance/2,-0.01,side_locks_height-hole_h1]) rotate(a=[-90,00,0]) cylinder(r=body_screws/2, h=25, $fn=60);
	translate ([plate_length/2+hole_distance/2,-0.01,side_locks_height-hole_h1]) rotate(a=[-90,0,0]) cylinder(r=body_screws/2, h=25, $fn=60);
	
	//nut traps
	translate ([plate_length/2-hole_distance/2,10,side_locks_height-hole_h1]) rotate(a=[-90,90,0]) nutHole(3.40);
	translate ([plate_length/2+hole_distance/2,10,side_locks_height-hole_h1]) rotate(a=[-90,90,0]) nutHole(3.40);
	translate ([plate_length/2-hole_distance/2-2.9,9.8,side_locks_height-hole_h1-30]) cube([6,3,30]);
	translate ([plate_length/2+hole_distance/2-2.9,9.8,side_locks_height-hole_h1-30]) cube([6,3,30]);
	
	//belt spacing
	translate([0,-side_locks_width,side_locks_height-belt_spacing]) cube([plate_length,9,belt_spacing]);	
	
	//side lock corners
	rotate(a=[0,0,-135]) cube([plate_width,plate_width,30]);
	translate ([plate_length,0,0]) rotate(a=[0,0,-135]) cube([plate_width,plate_width,30]);
	
	//front plate corners 
	translate ([(plate_length-front_plate_width_down)/2+5.5,0,front_plate_height])rotate(a=[0,-90-45,0]) cube([plate_width,3*front_plate_thickness,30]);
	translate ([plate_length-(plate_length-front_plate_width_down)/2-5.5,0,front_plate_height]) rotate(a=[0,45,-0]) cube([plate_width,3*front_plate_thickness,30]);
	
}



module adapter(){
	difference(){
		adapter_body();
		adapter_holes();
	}
}

adapter();