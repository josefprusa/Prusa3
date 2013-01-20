// PRUSA iteration3
// 624 bearing belt guide
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

wall= 1.2;
clearence= 0.1; 

module belt_guide_base(){
 cylinder(r=6.5+wall+clearence, h=5-0.5, $fn=50);
 cylinder(r=6.5+wall+clearence+2*wall, h=0.95, $fn=50);
}

module belt_guide_holes(){
 translate([0,0,2]) cylinder(r=5.1+clearence, h=10, $fn=50);
 translate([0,0,-1]) cylinder(r=5+wall+clearence-2*wall, h=10, $fn=50);
}

// Final part
module belt_guide(){
 difference(){
  belt_guide_base();
  belt_guide_holes();
 }
}

belt_guide();