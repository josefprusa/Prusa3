translate(v = [0,0,5])difference(){
translate(v = [0,0,7]) cube(size = [14,14,14], center = true);
translate(v = [0,0,7]) cube(size = [17,9,9], center = true);
}
difference(){
translate(v = [0,0,2.5]) cube(size = [14,50,5], center = true);

translate(v = [2,16,2.5]) cube(size = [14,2,7], center = true);
translate(v = [-2,11,2.5]) cube(size = [14,2,7], center = true);


translate(v = [-2,-16,2.5]) cube(size = [14,2,7], center = true);
translate(v = [2,-11,2.5]) cube(size = [14,2,7], center = true);

translate(v = [0,21,-1])  cylinder(h = 80, r=1.5, $fn=30);
translate(v = [0,-21,-1])  cylinder(h = 80, r=1.5, $fn=30);
}