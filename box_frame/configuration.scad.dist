// PRUSA iteration3
// Configuration file
// GNU GPL v3
// Josef Průša <josefprusa@me.com>
// Václav 'ax' Hůla <axtheb@gmail.com>
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/josefprusa/Prusa3

include <inc/metric.scad>;
include <inc/conf_bushing.scad>;

// Custom settings here, tailor to your supplies and print settings

// Extruder settings **********************************************************
// Don't forget to set your slicer's extruder settings to match the values you
// enter here.

layer_height = 0.3;
// Width over thickness determines how wide the plastic will be when extruded
// onto the object that is being printed. width_over_thickness is multiplied
// by the layer_height to calculate this width. i.e. If your layer_height is
// set to 0.3 mm and your width_over_thickness is set to 2.2, the resulting
// width will be 0.66 mm.
width_over_thickness = 2.2;

// Select your belt type ******************************************************

// T2.5
//belt_width = 6.5;  //add 0.5 to actual width
//belt_tooth_distance = 2.5;
//belt_tooth_ratio = 0.75;
//belt_thickness = 0.8;

// T5 (strongly discouraged)
//belt_width = 6.5;
//belt_tooth_distance = 5;
//belt_tooth_ratio = 0.75;
//belt_thickness = 0.8;

// HTD3
//belt_width = 9.5;
//belt_tooth_distance = 3;
//belt_tooth_ratio = 0.75;
//belt_thickness = 1.75;

// MXL
//belt_width = 6.5;
//belt_tooth_distance = 2.032;
//belt_tooth_ratio = 0.64;
//belt_thickness = i have no idea;

// GT2 
// there is bunch of GT2 belts with different tooth-to-tooth distance
// this one is most common in reprap world
// adjust to your needs.
belt_width = 6.5;
belt_tooth_distance = 2;
belt_tooth_ratio = 0.5;
belt_thickness = 0.8;

// Choose bearing/bushing configuration ***************************************
// conf_b_* are in inc/conf_bushing.scad

bushing_xy = conf_b_lm8uu;
bushing_z = conf_b_lm8uu;
// for longer bearings use one shorter in x-carriage to make place for belt attachment
// by default use same as xy
bushing_carriage = bushing_xy;


// Select idler bearing size **************************************************
// bearing_* are in inc/conf_bushing.scad

idler_bearing = bearing_623;

// Select carriage lenght ******************************************************
// 30 for single carriage extruder (two holes with centers 30mm apart)
// 50 for wade or single with fan (three holes, 30-20)
// 80 for full length carriage (four holes, 30-20-30)

carriage_l_base = 50;


// Fillets ********************************************************************
// fillets are rounded corners of boxes. The right engineering term is probably radius
// but cad software calls it fillet.
// mostly cosmetic, except z axis.
// 0 = no fillets
// 1 = fillet
// 2 = chamfer (cut the edges at 45deg. angle)
// Please do put only parts with fillets on sale, other options are not really tested

use_fillets = 1;

// set to 0 for single plate (affects z axis and screws that attach RP parts to frame)
i_am_box = 0;

// if you do your own plate and can move bottom Z screws 5mm up set this to 0 to
// get stronger motor mount. Only for i_am_box = 0
i_want_to_use_single_plate_dxf_and_make_my_z_weaker = 1;


// Radius of long threaded rod on Y frame

// Affects y-axis-corner (both box and single plate)
// and y-axis-bracket (box only)

//Use 5.4 for M10 or 4.4 for M8
y_threaded_rod_long_r = 5.4;


// Thickness of the boards that make the box frame.

// in y-axis-corner it governs the height of the corners by adjusting the
// distance between ground and M10 threaded rod. (both box and single plate)

// For box model, the parts that hold Z smooth rod have one hole from front
// and one from side, and this setting makes sure that the screw from side
// is in the center of the plank.

// Use 12 for single plate
// or 20 if you want to use the Y lm8uu holders
// (extras/bearing-holder-single-plate-y)
board_thickness = 12;

// Segments of small holes. some poeple claim that a low value makes them easier to print.
small_hole_segments=7;

// functions
include <inc/functions.scad>;
include <inc/settings.scad>;

// These constants define the geometry of the doc/complete-printer.scad
bed_x_size=225;
bed_y_size=225;
x_smooth_rod_length=380+board_thickness*2;
y_smooth_rod_length=400;
z_smooth_rod_length=320;
