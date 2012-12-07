// PRUSA iteration3
// Compact extruder
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org




module motor_dummy(){
	translate([-22,-22,-5]) %cube([44,44,5]);
	translate([18,18,-5]) %cylinder(r=2, h=24);
	translate([18,-18,-5]) %cylinder(r=2, h=24);
	translate([-18,18,-5]) %cylinder(r=2, h=24);
	translate([-18,-18,-5]) %cylinder(r=2, h=24);
	translate([-22+2.5+10,0,-5]) %cylinder(r=2.5, h=7);
	
}

module extruder_base(){
 // Main body
 translate([-1-22,-2,0]) cube([22+22,56,24]);
 // Extruder plate mount
 translate([-16-28,49-5-8,0]) cube([59+28,18,24]);
 // Carriage mount cylinders
 translate([11,25,0]){
  //translate([-12,24,0]) cylinder(r=5, h=24);
  //translate([12,24,0]) cylinder(r=5, h=24);
 }
}

module extruder_holes(){
 // 1st extruder
 translate([11,25,0]){ // Translate to center of the main block
  // Main shaft opening
  translate([0,-2,-1]) cylinder(r=6.5, h=26);

  // Lower motor mount hole
  translate([-8.5,18-2,-1]) cylinder(r=2, h=35);
  translate([-8.5,18-2,21]) cylinder(r=3.1, h=35);
  // Upper motor mount hole
  translate([-8.5,-18-2,-1]) cylinder(r=2, h=35);
  translate([-8.5,-18-2,21]) cylinder(r=3.1, h=35);
  // Idler motor mount hole
  translate([-8.5+36,18-2,-1]) cylinder(r=2, h=35);
  translate([-8.5+36,18-2,21]) cylinder(r=3.1, h=35);

  //Idler place
  
  translate([10,-11,1]) cube([13,30,22]);

  // Carriage mount right screw head hole
  translate([-12-12,24,-3]) cylinder(r=3.5, h=23);
  // Carriage mount left screw head hole
  translate([12-12,24,-3]) cylinder(r=3.5, h=23);
  // Carriage mount right screw hole
  translate([-12-12,24,20.5]) cylinder(r=2, h=23);
  // Carriage mount left screw head hole
  translate([12-12,24,20.5]) cylinder(r=2, h=23);
  // Idler bearing cutout
  translate([11,0-2,-4.5+10]) cylinder(r=11, h=20);
 }

 // Filament path
 translate([1.5+11+3.5,65,11]) rotate([90,0,0]) cylinder(r=2, h=70);

 mirror([1,0,0])translate([1.5+11+3.51+1,65,11]) rotate([90,0,0]) cylinder(r=2, h=70);

 // 2nd extruder
 translate([-1,0,0]) mirror([1,0,0]) translate([11,25,0]){ // Translate to center of the main block
  // Main shaft opening
  translate([0,-2,-1]) cylinder(r=6.5, h=26);

  // Lower motor mount hole
  translate([-8.5,18-2,-1]) cylinder(r=2, h=35);
  translate([-8.5,18-2,21]) cylinder(r=3.1, h=35);
  // Upper motor mount hole
  translate([-8.5,-18-2,-1]) cylinder(r=2, h=35);
  translate([-8.5,-18-2,21]) cylinder(r=3.1, h=35);
  // Idler motor mount hole
  translate([-8.5+36,18-2,-1]) cylinder(r=2, h=35);
  translate([-8.5+36,18-2,21]) cylinder(r=3.1, h=35);

  translate([10,-11,1]) cube([13,30,22]);
  
  // Idler bearing cutout
  translate([11,0-2,-4.5+10]) cylinder(r=11, h=20);
 }
 

 // Left extruder plate mounting hole
 translate([25,65,11]) rotate([90,0,0]) cylinder(r=1.8, h=70);
 translate([25,47,11]) rotate([90,0,0]) cylinder(r=3.1, h=70, $fn=6);
 // Right extruder plate mounting hole

 translate([-26,65,11]) rotate([90,0,0]) cylinder(r=1.8, h=70);
 translate([-26,47,11]) rotate([90,0,0]) cylinder(r=3.1, h=70, $fn=6);

  // Idler mounting holse
  translate([11,25,10]){
   // Nut traps
   translate([-3,-32,6-5.5/2]) cube([2.7,14,5.5]);
   translate([-3,-32,-4-5.5/2]) cube([2.7,14,5.5]);

   translate([-3-20,-32,6-5.5/2]) cube([2.7,14,5.5]);
   translate([-3-20,-32,-4-5.5/2]) cube([2.7,14,5.5]);
   // Screws
   translate([-50,-22,-4]) rotate([0,90,0]) cylinder(r=2, h=80);
   translate([-50,-22,6]) rotate([0,90,0]) cylinder(r=2, h=80);
	}
}

module extruder_idler_base(){
 translate([0.25,0,0]) cube([19.5,45.5,8+3]);
	
}

module extruder_idler_holes(){
 translate([10,25,0]){
  // Main cutout
  cube([10,23,25], center= true);
  // Idler shaft
  translate([-12,0,4.1+2])rotate([0,90,0])cylinder(r=4.1, h=24);
  // Screw holes
  translate([5,-20,-1])cylinder(r=2.2, h=24);
  translate([-5,-20,-1])cylinder(r=2.2, h=24);
 }
}


// Idler final part
module idler(){
 difference(){
  extruder_idler_base();
  extruder_idler_holes();
 }
}

//translate([10,0,1]) rotate([0,-90,0]) idler();
translate([-68,-8,0])  idler();
// Extruder final part
module extruder(){
 translate([-23,2,0])difference(){
  extruder_base();
  extruder_holes();
 }
}

extruder();
translate([-2.5,25,0]) motor_dummy();
