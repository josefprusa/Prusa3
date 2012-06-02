translate([0,13.8/2,0])
    difference(){
        translate([0,0,35]) cube(size = [13.8,13.8,70], center = true);
        translate([0,0,35]) cube(size = [9,9,72], center = true);
    }
translate([45,13.8/2,0])
    difference(){
        translate([0,0,15]) cube(size = [13.8,13.8,30], center = true);
        translate([0,0,35]) cube(size = [9,9,72], center = true);
    }


// main plate
difference(){
    translate([(45+13.8)/2-13.8/2,-2.5,35]) cube(size = [45+13.8,5,70], center = true);
    translate([55,-17.5, 35+25+10]) rotate([0,45,0]) cube(size = [60,60,60], center = true);

}


// mounting plate
difference(){
    translate([2.5-13.8/2, -17.5,35]) cube(size = [5,35,70], center = true);
    translate([2.5-13.8/2, -17.5,35]) cube(size = [7,25,25], center = true);
    translate([0,-17.5, 35-25]) rotate([0,-90,0]) cylinder(h = 80, r=2.5, $fn=30);
    translate([0,-17.5, 35+25]) rotate([0,-90,0]) cylinder(h = 80, r=2.5, $fn=30);
}



// belt dummy
translate([45/2,13.8/2,0]){

    %translate([0,0,35]) cube(size = [20,6,70], center = true);

    translate([-13.5,0,17.5]) #cube(size = [7,14,35], center = true);


    difference(){
        translate([-5.5,0,17.5]) cube(size = [7,14,35], center = true);
        translate([-5.5,0,17.5]) cube(size = [9,10,10], center = true);


        for ( i = [0 : 11] )
        {
            translate([-8.5,0,1+i*3]) cube(size = [2,10,2], center = true);
        }
    }

}
