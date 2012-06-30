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

// y motor mount
translate([56-yrodseparation/2,-y_smooth_rod_length/2+9,0]) 
{
	rotate([0,90,0]) rotate([0,0,90]) motorholder();
	translate([10,0,30])rotate([0,90,0])nutwasher();
	translate([0,0,30])rotate([0,90,180])nutwasher();
	translate([10,0,10])rotate([0,90,0])nutwasher();
	translate([0,0,10])rotate([0,90,180])nutwasher();
}

// y idler mount
translate([70-yrodseparation/2,y_smooth_rod_length/2-9,30]) 
{
	translate([0,0-33,-8]) 
	rotate([0,-90,0]) idlermount();
	translate([0,0,0])rotate([0,90,0])nutwasher();
	translate([-20,0,0])rotate([0,90,180])nutwasher();
}

yrodseparation=100;

module yfront()
{
	// corners
	leftfront();
	translate([yrodseparation,0,0]) mirror([1,0,0]) leftfront();

	// front bottom threaded rod
	color("Aqua")
	translate([-20,9,10]) rotate([0,90,0]) cylinder(h = 140, r=4);

	translate([yrodseparation+11,9,10])rotate([0,90,0])nutwasher();
	translate([yrodseparation-11,9,10])rotate([0,90,180])nutwasher();

	translate([-11,9,10])rotate([0,90,180])nutwasher();
	translate([11,9,10])rotate([0,90,0])nutwasher();
	
	// front top threaded rod
	color("Aqua")
	translate([-20,9,30]) rotate([0,90,0]) cylinder(h = 140, r=4);

%	translate([-11,9,30])rotate([0,90,180])nutwasher();
%	translate([11,9,30])rotate([0,90,0])nutwasher();

%	translate([yrodseparation-11,9,30])rotate([0,90,180])nutwasher();
%	translate([yrodseparation+11,9,30])rotate([0,90,0])nutwasher();
}

translate([-yrodseparation/2,-y_smooth_rod_length/2])
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
	translate([0,0,45]) rotate([0,90,90]) cylinder(h = y_smooth_rod_length, r=4,center=true);
	//left bottom rod
	color("Aqua")
	translate([0,0,20]) rotate([0,90,90]) cylinder(h = 430, r=4,center=true);
	// middle nuts
	translate([0,0,20])rotate([0,-90,90])nutwasher();
	translate([0,board_thickness,20])rotate([0,90,90])nutwasher();

	// back nuts
	translate([0,y_smooth_rod_length/2+2,20])rotate([0,90,90])nutwasher();
	translate([0,y_smooth_rod_length/2+2-22,20])rotate([0,90,-90])nutwasher();
	// front nuts
	translate([0,-y_smooth_rod_length/2-2,20])rotate([0,90,-90])nutwasher();
	translate([0,-y_smooth_rod_length/2-2+22,20])rotate([0,90,90])nutwasher();
	}
}

yside();
translate([yrodseparation,0,0])yside();

// heat bed
color("Lime",0.25)
translate([0,0,58]) cube([bed_x_size,bed_y_size,6], center=true);

board_sides=50;
board_w=bed_x_size+10+2*board_sides;

// XZ board
translate([0,board_thickness/2,150])
%difference()
{
	cube([board_w,board_thickness,300],true);
	translate([0,0,-15])
	cube([bed_x_size+10,board_thickness+2,200],true);
}


// Z motor mounts
translate([-board_w/2-5,0,42])
rotate(-90)
zmotorholder();

translate([board_w/2+5,0,42])
rotate(-90)
mirror([0,1,0])
zmotorholder();

// Z rod mounts
translate([-board_w/2-5,0,260])
rotate(-90)
zrodholder();

translate([board_w/2+5,0,260])
rotate(-90)
mirror([0,1,0])
zrodholder();

// Z rods
module z_rods()
{
	color("MediumBlue")
	translate([board_w/2-4,-26,42])cylinder(h=z_smooth_rod_length,r=4);
}

z_rods();
mirror([1,0,0])z_rods();

// X ends
translate([-board_w/2+4,-26,200])
rotate([0,0,90])
rotate([0,180,0])
x_end_motor();

translate([board_w/2-4,-26,200])
rotate(90)
rotate([0,180,0])
x_end_idler();

// X rods
for(i=[0:1])
color("MediumBlue")
translate([0,-12,149+i*45])rotate([0,90,0])cylinder(h=300,r=4,center=true);

// X carriage
translate([0,-12,149])
rotate([0,90,0])
x_carriage();