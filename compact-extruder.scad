module base(){
translate([-1,-2,0]) cube([22,54,20]);

}

module holes(){
//translate to center of the main block
 translate([11,25,0]){
  translate([0,0,-1]) cylinder(r=9, h=22);
  translate([0,21,-1]) cylinder(r=2, h=22);
  translate([0,-21,-1]) cylinder(r=2, h=22);
  translate([0,21,3]) cylinder(r=3.5, h=22);
  translate([0,-21,3]) cylinder(r=3.5, h=22);
  //cutout for bearing

  translate([11,0,-4.5+10]) cylinder(r=11, h=20);
 }
//filament hole 
 translate([1.5+11+3.5,65,10]) rotate([90,0,0])cylinder(r=2, h=70);
	//idler holse
	translate([11,25,10]){
	translate([-30,15,-5]) rotate([0,90,0]) cylinder(r=2.2, h=70);
	translate([-30,-15,-5]) rotate([0,90,0]) cylinder(r=2.2, h=70);
	translate([-30,15,5]) rotate([0,90,0]) cylinder(r=2.2, h=70);
	translate([-30,-15,5]) rotate([0,90,0]) cylinder(r=2.2, h=70);
	}
}

translate([-25,0,0])difference(){
base();
holes();
}


//translate([-25,0,0]) difference(){
//base();
//holes();
//}
   //translate([1.5+11+3.5,65,10]) rotate([90,0,0])cylinder(r=1.5, h=70);


module idler_base(){
translate([0.25,5,0]) cube([19.5,40,8+3]);
}

module idler_holes(){
translate([10,25,0]){
cube([10,23,25], center= true);
translate([-12,0,4.1+2])rotate([0,90,0])cylinder(r=4.1, h=24);


translate([5,15,-1])cylinder(r=2.2, h=24);
translate([5,-15,-1])cylinder(r=2.2, h=24);
translate([-5,15,-1])cylinder(r=2.2, h=24);
translate([-5,-15,-1])cylinder(r=2.2, h=24);
}
}

//difference(){
//idler_base();
//idler_holes();
//}