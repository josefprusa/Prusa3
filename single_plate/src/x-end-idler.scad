// PRUSA iteration3
// X end idler
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

use <inc/x-end.scad>

module x_end_idler_base(){
 x_end_base();
}

module x_end_idler_holes(){
 x_end_holes();
 translate(v=[0,-25,30.25]) rotate(a=[0,-90,0]) cylinder(h = 80, r=2.2, $fn=30);
}

// Final part
module x_end_idler(){
 mirror([0,1,0]) difference(){
  x_end_idler_base();
  x_end_idler_holes();
 }
}

x_end_idler();


