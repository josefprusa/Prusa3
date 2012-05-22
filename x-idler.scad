$fn=50;

thingwall = 0.75;
bearing= 13;
clearence = 0.6;

difference(){
union(){
cylinder(h=7.5, r=((bearing+clearence)/2+thingwall+clearence/2)+thingwall);
cylinder(h=0.8, r=10);
}
translate([0,0,1])
cylinder(h=8, r=(bearing+clearence)/2+thingwall+clearence/2);
cylinder(h=8, r=4.5);

}

translate([22,0,0]) difference(){
union(){
cylinder(h=7.5, r=(bearing+clearence)/2+thingwall);
cylinder(h=0.8, r=10);
}
translate([0,0,1])
cylinder(h=8, r=(bearing+clearence)/2);
cylinder(h=8, r=4.5);

}