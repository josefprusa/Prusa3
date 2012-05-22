translate(v = [10+16,0,0]){
	
	%translate(v = [0,0,35]) cube(size = [20,6,70], center = true);
	
	translate(v = [-24.5+6.5,0,17.5]) cube(size = [16,14,35], center = true);
	translate(v = [-20+5.5,1.5-7,17.5]) cube(size = [16,3,35], center = true);
	
	
	

	
	difference(){
	union(){
		
		translate(v = [-37.5+13,0,5]) cube(size = [3,35,10], center = true);
		translate(v = [-37.5+13,0,22.5]) cube(size = [3,14,45], center = true);
		translate(v = [-5.5,0,17.5]) cube(size = [7,14,35], center = true);
		
	}
	translate(v = [-5.5,0,17.5]) cube(size = [9,10,10], center = true);
	translate(v = [0,-12,5]) rotate([0,-90,0]) cylinder(h=50, r= 2.5);
	translate(v = [0,12,5]) rotate([0,-90,0]) cylinder(h=50, r= 2.5);
	
	translate(v = [0,0,40]) rotate([0,-90,0]) cylinder(h=50, r= 2.5);
	
	for ( i = [0 : 11] )
	{
	    translate(v = [-8.5,0,1+i*3]) cube(size = [2,10,2], center = true);
	}
}
}