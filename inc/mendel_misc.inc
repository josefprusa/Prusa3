/*
 *  Miscellaneous constants and standard objects used in Mendel 
 *  by Vik Olliver 29-03-2010. Uses components of the
 *  OpenSCAD Shapes Library (www.openscad.at)
 *  Copyright (C) 2009  Catarina Mota <clifford@clifford.at>
 *
 * 5-Apr-2010 vik@diamondage.co.nz
 * Different clearances are being implemented for vertical and
 * horizontal holes, as rudimentary extruders cannot relaibly
 * control extrusions around corners.
 *
 * 5-Apr-2010 vik@diamondage.co.nz
 * Added vertex separation and adapted for Y motor bracket.
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
*/


// Useful constants etc.
nema17_side=45;
m3_clearance_rad=1.9;
m4_clearance_rad_v=2.8;	// Vertical clearance
m4_clearance_rad_h=2.2;	// Horizontal clearance
m6_clearance_rad=3.7;
m8_tight_rad=4.6;
m8_clearance_rad=4.9;
bearing_608_rad_v=11.8;



// Stuff relevant to the construction of various interconnecting bits of Mendel.
//
// Vertex and Y motor mount stuff.
vertex_m8_sep=58;
// X carriage design
x_car_top_axle_offset=32;
x_car_bottom_axle_offset=22.5;
x_car_length= 98;	// Length of the X carriage
x_car_wing_offset=7.8;	// Offset of X Carriage wings from centre line
x_car_top_knob_width=13;	// Width of knobbly bit at each end of the X carriage top section.
x_belt_spacing=20;

// Extruder size etc.
extruder_mount_hole_spacing=50;
extruder_thick=20;
extruder_height=44;

// Axis leadscrew holder
leadscrew_base_height=17;
z_guide_bar_rad=4.3;	// Radius of the Z guide bars
z_motor_rail_sep=63;
z_motor_rail_height=12;

module box(w,h,d) {
	scale ([w,h,d]) cube(1, true);
}

module hexagon(height, depth) {
	boxWidth=height/1.75;
		union(){
			box(boxWidth, height, depth);
			rotate([0,0,60]) box(boxWidth, height, depth);
			rotate([0,0,-60]) box(boxWidth, height, depth);
		}
}

module m8_hole_horiz(l) {
	cylinder(l,m8_clearance_rad,m8_clearance_rad,center=true);
	translate ([m8_clearance_rad*0.6,0,0]) rotate ([0,0,45])
		cube([m8_clearance_rad,m8_clearance_rad,l],center=true);
}

module m8_hole_vert(l) {
	cylinder(l,m8_clearance_rad,m8_clearance_rad,center=true);
}

// For nut cavities, "height" is the max distance between two points on the hex.
module m4_nut_cavity(l) {
	hexagon(height=7.5,depth=l);
}

module m8_nut_cavity(l) {
	hexagon(height=14,depth=l);
}

module m3_slot(l) {
	cube([7.149,l,3.4],center=true);
}

module m4_hole_horiz(l) {
	cylinder(l,m4_clearance_rad_h,m4_clearance_rad_h,center=true);
	translate ([m4_clearance_rad_h*0.6,0,0]) rotate ([0,0,45])
		cube([m4_clearance_rad_h,m4_clearance_rad_h,l],center=true);
}

module m4_hole_vert(l) {
	cylinder(l,m4_clearance_rad_v,m4_clearance_rad_v,center=true);
}

module m4_hole_vert_with_hex(l) {
	union () {
		m4_hole_vert(l);
		translate ([0,0,-l/4]) rotate ([0,0,30]) scale ([1.1,1.1,1]) m4_nut_cavity(l/2);
	}
}

module m4_hole_horiz_with_hex(l) {
	union () {
		m4_hole_horiz(l);
		translate ([0,0,-l/4]) rotate ([0,0,0]) m4_nut_cavity(l/2);
	}
}

module m8_hole_vert_with_hex(l) {
	union () {
		m8_hole_vert(l);
		translate ([0,0,-l/4]) rotate ([0,0,30]) m8_nut_cavity(l/2);
	}
}


// Hole for a NEMA17 with one sloped side so that the wires can dangle
// out of it...
module nema_17() {
	union () {
		translate ([0,0,nema17_side/2]) box(nema17_side,nema17_side,nema17_side);
		cylinder (h=nema17_side*1.5,r=24/2,center=true);
		// Flip-out bit needed when building with X vertical
		translate ([nema17_side/2,0,0])  rotate ([0,-45,0]) translate ([nema17_side/2,0,nema17_side/2]) 
			box(nema17_side,nema17_side,nema17_side);
		// 8mm * M3 clearance slots, 4 of.
		rotate ([0,0,45]) translate([20,0,0]) box(8,m3_clearance_rad*2, 60);
		rotate ([0,0,-45]) translate([20,0,0]) box(8,m3_clearance_rad*2, 60);
		rotate ([0,0,135]) translate([20,0,0]) box(8,m3_clearance_rad*2, 60);
		rotate ([0,0,-135]) translate([20,0,0]) box(8,m3_clearance_rad*2, 60);
	}
}

// Set of 3 holes at each end of an X carriage by which the two halves are joined and balanced.
module x_carriage_common_holes() {
	union() {
		translate ([(x_car_length-x_car_top_knob_width)/2,0,0]) m4_hole_vert(60);
		translate ([(x_car_length-x_car_top_knob_width)/2,16.5,0]) m4_hole_vert(60);
		translate ([(x_car_length-x_car_top_knob_width)/2,-15,0])  m4_hole_vert(60);
		translate ([(x_car_length-x_car_top_knob_width)/-2,0,0]) m4_hole_vert(60);
		translate ([(x_car_length-x_car_top_knob_width)/-2,16.5,0]) m4_hole_vert(60);
		translate ([(x_car_length-x_car_top_knob_width)/-2,-15,0])  m4_hole_vert(60);
	}
}

