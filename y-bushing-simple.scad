module bushing_holder(){
	translate(v = [0,7+2,0])difference(){
translate(v = [0,0,7]) #cube(size = [14,14,14], center = true);
translate(v = [0,0,7]) cube(size = [9,9,17], center = true);
}
difference(){
translate(v = [0,0,7]) cube(size = [40,5,14], center = true);
translate(v = [12,3,7]) rotate(a=[90,0,0]) cylinder(h = 80, r=2.5, $fn=30);
translate(v = [-12,3,7]) rotate(a=[90,0,0]) cylinder(h = 80, r=2.5, $fn=30);
}
}

bushing_holder();
translate(v = [0,-22,0])bushing_holder();

/*translate(v = [0,18,7]) rotate([0,90,90]) {
translate(v = [0,0,2.5])difference(){
translate(v = [0,0,7+2]) cube(size = [14,14,14], center = true);
translate(v = [0,0,7+2]) cube(size = [17,9,9], center = true);
}
difference(){
translate(v = [0,0,2.5]) cube(size = [14,55,5], center = true);

translate(v = [2,16,2.5]) cube(size = [14,2,7], center = true);
translate(v = [-2,11,2.5]) cube(size = [14,2,7], center = true);


translate(v = [-2,-16,2.5]) cube(size = [14,2,7], center = true);
translate(v = [2,-11,2.5]) cube(size = [14,2,7], center = true);

translate(v = [0,22,-1])  cylinder(h = 80, r=2.5, $fn=30);
translate(v = [0,-22,-1])  cylinder(h = 80, r=2.5, $fn=30);
}
}*/