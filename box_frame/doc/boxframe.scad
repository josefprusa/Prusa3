module pl(x=100,y=100,z=12){
	cube([x,y,z]);
}
module screw(depth=20){
	color([1,1,0]){
		cylinder(r1=4,r2=3.5/2,h=4);
		cylinder(r1=3.5/2,r2=3.5/2,h=depth-2);
		translate([0,0,depth-2])cylinder(r1=3.5/2,r2=0,h=2);
		
	}
	
}
module p3bscorner(){
translate([30,-12.5,6])rotate([-90,0,0])screw();
translate([422,-12.5,6])rotate([-90,0,0])screw();
translate([220,-12.5,6])rotate([-90,0,0])screw();
//front board vertical
color([0.5,0.5,0.5,0.8])pl(x=450);
//side board
color([0.5,0.5,0.6,0.8])rotate([90,0,0])pl(x=450);
}
module p3bsgantry(){
//side and front boards
translate([440,-110,25])mirror([0,0,1])screw();
translate([440,110+50,25])mirror([0,0,1])screw();
translate([360,-110,25])mirror([0,0,1])screw();
translate([360,110+50,25])mirror([0,0,1])screw();
translate([360,-180,25])mirror([0,0,1])screw();
translate([360,180+50,25])mirror([0,0,1])screw();
//front board across
color([0.5,0.5,0.6,0.9])translate([450,-200,12])rotate([0,0,90])pl(x=450);
translate([0,-200,0])color([0,0,0,0.3])p3bscorner();
translate([0,250,0])color([0,0,0,0.3])mirror([0,1,0])p3bscorner();
}
module boxframe(top=false){
translate([285,-212.5,6])rotate([-90,0,0])screw();
translate([220,-212.5,6])rotate([-90,0,0])screw();
translate([285,262.5,6])rotate([90,0,0])screw();
translate([220,262.5,6])rotate([90,0,0])screw();
translate([312.5,-180,6])rotate([90,0,-90])screw();
translate([312.5,-110,6])rotate([90,0,-90])screw();
translate([312.5,240,6])rotate([90,0,-90])screw();
translate([312.5,160,6])rotate([90,0,-90])screw();

translate([300,-180,0])rotate([0,0,90])color([1,0,0,0.35])pl(x=400,z=3);
//bottom board
translate([300,-200,3])rotate([0,0,90])color([0,0,1,0.55])pl(x=450);
translate([312,0])rotate([0,-90,0])color([0,0,0,0.4])p3bsgantry();
if(top){
translate([220,-206,463])mirror([0,0,1])screw();
translate([220,256,463])mirror([0,0,1])screw();
translate([280,-206,463])mirror([0,0,1])screw();
translate([280,256,463])mirror([0,0,1])screw();
translate([306,-156,463])mirror([0,0,1])screw();
translate([306,206,463])mirror([0,0,1])screw();
//top board
translate([312,-212,450])rotate([0,0,90])color([0,0,1,0.55])pl(x=475);

}
}

color([0,0,0,0.4])boxframe(true);

color([0.8,0.8,0.2,0.35])translate([100,0,-100])cube([800,800,200],true);
