include <bitmap.scad>
#cube([18,28,1],center=true);
chars = ["P","R","U","S","A"];
char_count = 5;

translate([-4,-11.5,0]) 8bit_str(chars, char_count,0.7,4);
charsx = ["M","e","n","d","e","l"];
char_countx = 6;

translate([4,-11.5,0]) 8bit_str(charsx, char_countx,0.6,4);