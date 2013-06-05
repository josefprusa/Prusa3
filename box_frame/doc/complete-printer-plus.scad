// PRUSA iteration3
// Complete printer visualisation
// GNU GPL v3
// Greg Frost
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <../configuration.scad>
use <../y-drivetrain.scad>
use <../y-axis-corner.scad>
use <../z-axis.scad>
use <../x-end.scad>
use <../x-carriage.scad>
use <../y-axis-bracket.scad>
use <../bushing.scad>
use <../inc/bearing-guide.scad>
module ybeltholder() {
	include <../y-belt-holder.scad>
}
module bearing_guide() {
	bearing_guide_inner();
	translate([0,0,7+0.9*2])rotate([0,180,0])bearing_guide_outer();
}


//--------------------------------------------------------------------------------------------------------------------------------
// screws, nuts, etc
//--------------------------------------------------------------------------------------------------------------------------------
// wood (flat) screw
module screw(depth=board_thickness*1.5){
	module arrow(radiusmax=4, thickness=1, initialgap=0.5, radiusmin=0.5, depth=4) {
		union() {
			hull() {
				translate([0,0,initialgap/2-0.25])cube(size=[radiusmax,thickness,initialgap+0.5], center=true);
				translate([0,0,depth])cube(size=[radiusmin,radiusmin,radiusmin], center=true);
			}
			rotate([0,0,90]) hull() {
				translate([0,0,initialgap/2-0.25])cube(size=[radiusmax,thickness,initialgap+0.5], center=true);
				translate([0,0,depth])cube(size=[radiusmin,radiusmin,radiusmin], center=true);
			}
		}
	}

	color([1,1,0])
	difference() {
		union() {
			cylinder(r1=4,r2=3.5/2,h=4);
			cylinder(r1=3.5/2,r2=3.5/2,h=depth-2);
			translate([0,0,depth-2])cylinder(r1=3.5/2,r2=0,h=2);
		}
		arrow();
	}
}
module M3screw(depth=10) {
	difference() {
		union() {
			cylinder(r=1.5, h=2+depth);
			cylinder(r=2.5, h=2);
		}
		cube(size=[6,1,2],center=true);
	}
}
// M3 nut
module M3nut(){
	color("silver")
	difference(){
		translate([0,0,2])cylinder(r=6/2,h=2.5,$fn=6);
		translate([0,0,-1])cylinder(r=3/2,h=12,$fn=10);
	}
}
// M8 nut + washer
module nutwasher(){
	color("silver")
	difference(){
		union(){
			translate([0,0,2])cylinder(r=15/2,h=7,$fn=6);
			translate([0,0,0.5])cylinder(r=8.5,h=1);
		}
		translate([0,0,-1])cylinder(r=8/2,h=12);
	}
}
//--------------------------------------------------------------------------------------------------------------------------------









//--------------------------------------------------------------------------------------------------------------------------------
// Y axis
//--------------------------------------------------------------------------------------------------------------------------------
// y motor mount
translate([56-yrodseparation/2,-y_smooth_rod_length/2+9,board_thickness-12]) 
{
	rotate([0,90,0]) rotate([0,0,90]) motorholder();
	translate([10,0,30])rotate([0,90,0])nutwasher();
	translate([0,0,30])rotate([0,90,180])nutwasher();
	translate([10,0,10])rotate([0,90,0])nutwasher();
	translate([0,0,10])rotate([0,90,180])nutwasher();
}

// y idler mount
translate([70-yrodseparation/2,y_smooth_rod_length/2-9,30 + board_thickness-12]) 
{
	translate([0,0-33,-8]) 
		rotate([0,-90,0]) idlermount();
	translate([0,0,0])rotate([0,90,0])nutwasher();
	translate([-20,0,0])rotate([0,90,180])nutwasher();
	// bearing guide
	translate([-5,-33+8,-8+8]) 
		rotate([0,-90,0]) bearing_guide();
}

yrodseparation=140;

module yfront()
{
	// corners
	render(convexity=2) leftfront();
	translate([yrodseparation,0,0]) mirror([1,0,0]) render(convexity=2) leftfront();

	// front bottom threaded rod
	color("Aqua")
	translate([-20,9,10]) rotate([0,90,0]) cylinder(h = yrodseparation+40, r=4);

	translate([yrodseparation+11,9,10])rotate([0,90,0])nutwasher();
	translate([yrodseparation-11,9,10])rotate([0,90,180])nutwasher();

	translate([-11,9,10])rotate([0,90,180])nutwasher();
	translate([11,9,10])rotate([0,90,0])nutwasher();
	
	// front top threaded rod
	color("Aqua")
	translate([-20,9,30]) rotate([0,90,0]) cylinder(h = yrodseparation+40, r=4);

	translate([-11,9,30])rotate([0,90,180])nutwasher();
	translate([11,9,30])rotate([0,90,0])nutwasher();

	translate([yrodseparation-11,9,30])rotate([0,90,180])nutwasher();
	translate([yrodseparation+11,9,30])rotate([0,90,0])nutwasher();
}

translate([-yrodseparation/2,-y_smooth_rod_length/2,board_thickness-12])
{
	yfront();
	translate([0,y_smooth_rod_length,0]) 
		mirror([0,1,0])
		yfront();
}

module yside()
{
	translate([-yrodseparation/2,0])
	{
	// left top rod
	color("MediumBlue")
	translate([0,0,3+board_thickness + 30]) rotate([0,90,90]) cylinder(h = y_smooth_rod_length, r=bushing_xy[0],center=true);
	//left bottom rod
	color("Aqua")
	translate([0,0,3+board_thickness+4+1]) rotate([0,90,90]) cylinder(h =  y_smooth_rod_length+22, r=y_threaded_rod_long_r ,center=true);


	// middle nuts
	// 100=default wood plank width (see pl function below)
	translate([0,board_thickness-4-3,8+board_thickness])rotate([0,-90,90])nutwasher();
	translate([0,board_thickness+100-4+3,8+board_thickness])rotate([0,90,90])nutwasher();



	// back nuts
	translate([0,y_smooth_rod_length/2+2,8+board_thickness])rotate([0,90,90])nutwasher();
	translate([0,y_smooth_rod_length/2+2-22,8+board_thickness])rotate([0,90,-90])nutwasher();
	// front nuts
	translate([0,-y_smooth_rod_length/2-2,8+board_thickness])rotate([0,90,-90])nutwasher();
	translate([0,-y_smooth_rod_length/2-2+22,8+board_thickness])rotate([0,90,90])nutwasher();
	}
}

yside();
translate([yrodseparation,0,0])yside();

// heat bed
heatbed_height=board_thickness;
color("Lime",0.25)
translate([0,0,58-3+heatbed_height/2+5]) cube([bed_x_size,bed_y_size,heatbed_height], center=true);


// Y belt holder
translate([-yrodseparation/2+60.5   ,    0, 58-3+5-2.8]) rotate([0,90,-90]) ybeltholder();
translate([-yrodseparation/2+60.5+12,   -5, 58-3+0-2.8-1]) screw(heatbed_height/2+8);
translate([-yrodseparation/2+60.5-12,   -5, 58-3+0-2.8-1]) screw(heatbed_height/2+8);
translate([-yrodseparation/2+60.5   ,-5-35, 58-3+0-2.8-1]) screw(heatbed_height/2+8);


// bushings
render(convexity=3) translate([yrodseparation/2   , -bed_y_size/4-10   , 50    -0.5]) rotate([0,90,90]) y_bearing();
translate([yrodseparation/2+14, -bed_y_size/4-10+10, 50+6.5-0.5-5]) screw(heatbed_height/2+8);
translate([yrodseparation/2-14, -bed_y_size/4-10+10, 50+6.5-0.5-5]) screw(heatbed_height/2+8);

render(convexity=3) mirror([0,1,0])translate([yrodseparation/2   , -bed_y_size/4-10   , 50    -0.5]) rotate([0,90,90]) y_bearing();
mirror([0,1,0])translate([yrodseparation/2+14, -bed_y_size/4-10+10, 50+6.5-0.5-5]) screw(heatbed_height/2+8);
mirror([0,1,0])translate([yrodseparation/2-14, -bed_y_size/4-10+10, 50+6.5-0.5-5]) screw(heatbed_height/2+8);

render(convexity=3) translate([-yrodseparation/2   , -10   , 50    -0.5]) rotate([0,90,90]) y_bearing();
translate([-yrodseparation/2+14, -10+10, 50+6.5-0.5-5]) screw(heatbed_height/2+8);
translate([-yrodseparation/2-14, -10+10, 50+6.5-0.5-5]) screw(heatbed_height/2+8);

//--------------------------------------------------------------------------------------------------------------------------------








//--------------------------------------------------------------------------------------------------------------------------------
// Z axis
//--------------------------------------------------------------------------------------------------------------------------------
board_sides=120;
board_w=bed_x_size+10+2*board_sides;

//// aluminum XZ board
//translate([0,board_thickness/2,150])
//%difference()
//{
//	cube([board_w,board_thickness,300],true);
//	translate([0,0,-15])
//	cube([bed_x_size+10,board_thickness+2,200],true);
//}


// Z motor mounts
translate([-board_w/2-5+12-board_thickness,12-board_thickness,50])
rotate(-90) mirror([0, 0, 1])
render(convexity=3) zmotorholder();

translate([-board_w/2-5+12-board_thickness-1, board_thickness / 2, 39])
rotate([-90,0,-90])
screw(25);
translate([-board_w/2-5+12-board_thickness+30,12-board_thickness-15,41])
rotate([-90,0,0])
screw(25);
translate([-board_w/2-5+12-board_thickness+10.5,12-board_thickness-10.5,42+7])
rotate([180,0,0])
M3screw();
translate([-board_w/2-5+12-board_thickness+41.5,12-board_thickness-10.5,42+7])
rotate([180,0,0])
M3screw();
translate([-board_w/2-5+12-board_thickness+10.5,12-board_thickness-10.5-31,42+7])
rotate([180,0,0])
M3screw();


translate([board_w/2+5-12+board_thickness,12-board_thickness,50])
rotate(-90) mirror([0, 0, 1])
mirror([0,1,0])
render(convexity=3) zmotorholder();

translate([board_w/2+5-12+board_thickness+1, board_thickness / 2, 39])
rotate([90,0,-90])
screw(25);
translate([board_w/2+5-12+board_thickness-30,12-board_thickness-15,41])
rotate([-90,0,0])
screw(25);
translate([board_w/2+5-12+board_thickness-10.5,12-board_thickness-10.5,42+7])
rotate([180,0,0])
M3screw();
translate([board_w/2+5-12+board_thickness-41.5,12-board_thickness-10.5,42+7])
rotate([180,0,0])
M3screw();
translate([board_w/2+5-12+board_thickness-10.5,12-board_thickness-10.5-31,42+7])
rotate([180,0,0])
M3screw();



// Z rod mounts
//translate([-board_w/2-5,0,260])
translate([-board_w/2-5+12-board_thickness,12-board_thickness,430])
rotate(-90)
render(convexity=3) zrodholder();

translate([-board_w/2-5+12-board_thickness-1, board_thickness / 2, 430+7.5])
rotate([0,90,0])
screw(25);
translate([-board_w/2-5+12-board_thickness-1+34,12-board_thickness+8-23,430+6.5])
rotate([-90,90,0])
screw(25);


//translate([board_w/2+5,0,260])
translate([board_w/2+5-12+board_thickness,12-board_thickness,430])
rotate(-90)
mirror([0,1,0])
render(convexity=3) zrodholder();

translate([board_w/2+5-12+board_thickness+1, board_thickness / 2, 430+7.5])
rotate([0,-90,0])
mirror([0,1,0])
screw(25);
translate([board_w/2+5-12+board_thickness+1-34,12-board_thickness+8-23,430+6.5])
rotate([-90,90,0])
mirror([0,1,0])
screw(25);

// Z rods
module z_rods()
{
	color("MediumBlue")
	translate([board_w/2-4-12+board_thickness,-26+12-board_thickness,42])cylinder(h=z_smooth_rod_length,r=bushing_z[0]);
    echo (z_smooth_rod_length);
	color("Aqua")
	translate([board_w/2-4-12+board_thickness-17,-26+12-board_thickness,56])cylinder(h = 390, r=2.5);
}

z_rods();
mirror([1,0,0])z_rods();
//--------------------------------------------------------------------------------------------------------------------------------










//--------------------------------------------------------------------------------------------------------------------------------
// X axis
//--------------------------------------------------------------------------------------------------------------------------------

// move the x-axis up 20cm (for visualization only)
x_axis_height=200;
x_smooth_rod_length=450+board_thickness*2+10;

// X ends
translate([-board_w/2+4+12-board_thickness,-26+12-board_thickness, 200+ x_axis_height])
rotate([0,0,90])
//rotate([0,180,0])
render(convexity=4) mirror([0, 0, 1]) x_end_motor();

translate([board_w/2-4-12+board_thickness,-26+12-board_thickness, 200 + x_axis_height])
rotate(90)
//rotate([0,180,0])
render(convexity=4) mirror([0, 0, 1]) x_end_idler();

// bearing guide
translate([board_w/2-4-12+board_thickness-27,-26+12-board_thickness-9-(10-(7+0.9*2))/2,140 + x_axis_height+27])
rotate([90,0,0])
bearing_guide();

// X rods
for(i=[0:1])
color("MediumBlue")
translate([1.5,-12+12-board_thickness-28,-3+149+i*45 + x_axis_height])rotate([0,90,0])cylinder(h=x_smooth_rod_length,r=4,center=true);

// X carriage
translate([0,-12+12-board_thickness-28,-3+149 + x_axis_height])
rotate([0,90,0])
translate([-45,0,75])
rotate([0,180,0])
render(convexity=3) x_carriage();

// small nuts
translate([0,-12+12-board_thickness-28,-3+149 + x_axis_height])
rotate([0,90,0])
translate([-45+20,0+9,75-3])
rotate([90,0,0])
M3nut();

translate([0,-12+12-board_thickness-28,-3+149 + x_axis_height])
rotate([0,90,0])
translate([-45+20,0+9,75-33])
rotate([90,0,0])
M3nut();

translate([0,-12+12-board_thickness-28,-3+149 + x_axis_height])
rotate([0,90,0])
translate([-45+20,0+9,75-53])
rotate([90,0,0])
M3nut();

translate([0,-12+12-board_thickness-28,-3+149 + x_axis_height])
rotate([0,90,0])
translate([-45+20,0+9,75-83])
rotate([90,0,0])
M3nut();

// belt clamp
translate([0-28,-12+12-board_thickness-28-10,-3+149 + x_axis_height-7])
rotate([0,90,0])
translate([-45,0,75])
rotate([0,90,0])
x_beltclamp();

// belt clamp
translate([0-28-30,-12+12-board_thickness-28-10,-3+149 + x_axis_height-7])
rotate([0,90,0])
translate([-45,0,75])
rotate([0,90,0])
x_beltclamp();

//--------------------------------------------------------------------------------------------------------------------------------






















//--------------------------------------------------------------------------------------------------------------------------------
// Frame (box style)
//--------------------------------------------------------------------------------------------------------------------------------
module pl(x=100,y=100,z=board_thickness){
	cube([x,y,z]);
}
module p3bscorner(){
	translate([    board_thickness*1.5+3,-0.5-board_thickness,board_thickness/2])rotate([-90,0,0])screw();
	translate([450-board_thickness*1.5  ,-0.5-board_thickness,board_thickness/2])rotate([-90,0,0])screw();
	translate([450/2                    ,-0.5-board_thickness,board_thickness/2])rotate([-90,0,0])screw();
	color([0.5,0.5,0.5,0.8])pl(x=450);
	color([0.5,0.5,0.6,0.8])rotate([90,0,0])pl(x=450);
}
module p3bsgantry(){
	separation=10;
	translate([450-separation,-100-separation   ,board_thickness*2+1])mirror([0,0,1])screw();
	translate([450-separation, 100+separation+50,board_thickness*2+1])mirror([0,0,1])screw();
	translate([350+separation,-100-separation   ,board_thickness*2+1])mirror([0,0,1])screw();
	translate([350+separation, 100+separation+50,board_thickness*2+1])mirror([0,0,1])screw();

	translate([350+separation,-200+separation   ,board_thickness*2+1])mirror([0,0,1])screw();
	translate([350+separation, 200-separation+50,board_thickness*2+1])mirror([0,0,1])screw();
	color([0.5,0.5,0.6,0.9])translate([450,-200,board_thickness])rotate([0,0,90])pl(x=450);
	translate([0,-200,0])color([0,0,0,0.3])p3bscorner();
	translate([0, 250,0])color([0,0,0,0.3])mirror([0,1,0])p3bscorner();
}
module boxframe(top=false){
	translate([300-board_thickness                      ,-200.5-board_thickness,board_thickness/2+3])rotate([-90,0,  0])screw();
	translate([200+board_thickness+board_thickness/2    ,-200.5-board_thickness,board_thickness/2+3])rotate([-90,0,  0])screw();
	translate([300-board_thickness                      , 250.5+board_thickness,board_thickness/2+3])rotate([ 90,0,  0])screw();
	translate([200+board_thickness+board_thickness/2    , 250.5+board_thickness,board_thickness/2+3])rotate([ 90,0,  0])screw();
	translate([300.5+board_thickness                    ,-200+board_thickness  ,board_thickness/2+3])rotate([ 90,0,-90])screw();
	translate([300.5+board_thickness                    ,-100-board_thickness  ,board_thickness/2+3])rotate([ 90,0,-90])screw();
	translate([300.5+board_thickness                    , 250-board_thickness  ,board_thickness/2+3])rotate([ 90,0,-90])screw();
	translate([300.5+board_thickness                    , 150+board_thickness  ,board_thickness/2+3])rotate([ 90,0,-90])screw();

	// 3mm separation for the screw heads at the bottom of the structure
	//translate([300,-180,0])rotate([0,0,90])color([1,0,0,0.35])pl(x=400,z=3);
	translate([300,-200,3])rotate([0,0,90])color([0,0,1,0.55])pl(x=450);

	translate([300+board_thickness,0])rotate([0,-90,0])color([0,0,0,0.4])p3bsgantry();
	if(top){
		translate([200+board_thickness+board_thickness/2,-200-board_thickness/2,450+board_thickness+1])mirror([0,0,1])screw();
		translate([200+board_thickness+board_thickness/2, 250+board_thickness/2,450+board_thickness+1])mirror([0,0,1])screw();
		translate([300-board_thickness-board_thickness/2,-200-board_thickness/2,450+board_thickness+1])mirror([0,0,1])screw();
		translate([300-board_thickness-board_thickness/2, 250+board_thickness/2,450+board_thickness+1])mirror([0,0,1])screw();
		translate([300+board_thickness/2                ,-150                  ,450+board_thickness+1])mirror([0,0,1])screw();
		translate([300+board_thickness/2                , 200                  ,450+board_thickness+1])mirror([0,0,1])screw();
		translate([300+board_thickness,-200-board_thickness,450])rotate([0,0,90])color([0,0,1,0.55])pl(x=450+board_thickness*2);
	}
}


translate([-25,312,0])rotate([0,0,-90])color([0,0,0,0.4])
boxframe(true);
// floor
//color([0.8,0.8,0.2,0.35])translate([0,0,-100])cube([800,800,200],true);
//--------------------------------------------------------------------------------------------------------------------------------








//--------------------------------------------------------------------------------------------------------------------------------
// Parts to fix Y axis to the frame
//--------------------------------------------------------------------------------------------------------------------------------
// y brackets, used to fix the threaded rods of the y axis to the wooden XZ frame.
translate([-bracket_width(12)/2  +yrodseparation/2,-3+12    ,board_thickness+3])                  yrodbracket(12, 3, 3);
translate([-bracket_width(12)/2  -yrodseparation/2,-3+12    ,board_thickness+3])                  yrodbracket(12, 3, 3);
translate([ bracket_width(12)/2  +yrodseparation/2, 3+12+100,board_thickness+3])rotate([0,0,180]) yrodbracket(12, 3, 3);
translate([ bracket_width(12)/2  -yrodseparation/2, 3+12+100,board_thickness+3])rotate([0,0,180]) yrodbracket(12, 3, 3);
//--------------------------------------------------------------------------------------------------------------------------------
translate([-bracket_width(12)/2+6+yrodseparation/2,12+3+3     ,board_thickness+bracket_height(3)+0.5])rotate([180,0,0])screw();
translate([ bracket_width(12)/2-6+yrodseparation/2,12+3+3     ,board_thickness+bracket_height(3)+0.5])rotate([180,0,0])screw();
translate([-bracket_width(12)/2+6+yrodseparation/2,12+3+3+12  ,board_thickness+bracket_height(3)+0.5])rotate([180,0,0])screw();
translate([ bracket_width(12)/2-6+yrodseparation/2,12+3+3+12  ,board_thickness+bracket_height(3)+0.5])rotate([180,0,0])screw();

translate([-bracket_width(12)/2+6-yrodseparation/2,12+3+3     ,board_thickness+bracket_height(3)+0.5])rotate([180,0,0])screw();
translate([ bracket_width(12)/2-6-yrodseparation/2,12+3+3     ,board_thickness+bracket_height(3)+0.5])rotate([180,0,0])screw();
translate([-bracket_width(12)/2+6-yrodseparation/2,12+3+3+12  ,board_thickness+bracket_height(3)+0.5])rotate([180,0,0])screw();
translate([ bracket_width(12)/2-6-yrodseparation/2,12+3+3+12  ,board_thickness+bracket_height(3)+0.5])rotate([180,0,0])screw();

translate([-bracket_width(12)/2+6+yrodseparation/2,-12+3+3+100,board_thickness+bracket_height(3)+0.5])rotate([180,0,0])screw();
translate([ bracket_width(12)/2-6+yrodseparation/2,-12+3+3+100,board_thickness+bracket_height(3)+0.5])rotate([180,0,0])screw();
translate([-bracket_width(12)/2+6+yrodseparation/2,    3+3+100,board_thickness+bracket_height(3)+0.5])rotate([180,0,0])screw();
translate([ bracket_width(12)/2-6+yrodseparation/2,    3+3+100,board_thickness+bracket_height(3)+0.5])rotate([180,0,0])screw();

translate([-bracket_width(12)/2+6-yrodseparation/2,-12+3+3+100,board_thickness+bracket_height(3)+0.5])rotate([180,0,0])screw();
translate([ bracket_width(12)/2-6-yrodseparation/2,-12+3+3+100,board_thickness+bracket_height(3)+0.5])rotate([180,0,0])screw();
translate([-bracket_width(12)/2+6-yrodseparation/2,    3+3+100,board_thickness+bracket_height(3)+0.5])rotate([180,0,0])screw();
translate([ bracket_width(12)/2-6-yrodseparation/2,    3+3+100,board_thickness+bracket_height(3)+0.5])rotate([180,0,0])screw();

//--------------------------------------------------------------------------------------------------------------------------------
