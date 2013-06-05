// PRUSA iteration3
// Configuration file
// GNU GPL v3
// Josef Průša <josefprusa@me.com>
// Václav 'ax' Hůla <axtheb@gmail.com>
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <inc/metric.scad>;
include <inc/conf_bushing.scad>;

// Custom settings here, tailor to your supplies and print settings

layer_height = 0.3;
width_over_thickness = 2.2;

// Select your belt type ******************************************************

//T2.5
//belt_tooth_distance = 2.5;
//belt_tooth_ratio = 0.75;

//T5 (strongly discouraged)
//belt_tooth_distance = 5;
//belt_tooth_ratio = 0.75;

//HTD3
belt_tooth_distance = 3;
belt_tooth_ratio = 0.75;

//MXL
//belt_tooth_distance = 2.032;
//belt_tooth_ratio = 0.64;

//GT2 there is bunch of GT2 belts with different tooth-to-tooth distance
//adjust to your needs
//belt_tooth_distance = 2;
//belt_tooth_ratio = 0.5;

// For T type belts you will probably want 0.8mm or so.
belt_thickness = 1.75;

// Choose bearing/bushing configuration ***************************************
// conf_b_* are in inc/conf_bushing.scad

bushing_xy = conf_b_lm8uu;
bushing_z = conf_b_lm8uu;
// for longer bearings use one shorter in x-carriage to make place for belt attachment
// by default use same as xy
bushing_carriage = bushing_xy;

// Select idler bearing size **************************************************
// [outer_diameter, width, inner_diameter, uses_guide]
// 608 [standard skate bearings] with bearing guide
bearing_608 = [22, 7, 8, 1];
//608 bearings with fender washers. Not good at all, the belt brushes against the carriage
bearing_608_washers = [22, 10, 8, 0];
// one 625 with guides
bearing_625 = [16, 5, 5, 1];
// two 625 - for use without bearing guides.
bearing_625_double = [16, 10, 5, 0];

// those two here are really good:
bearing_624_double = [13, 10, 4, 0];
// this one has roughly same diameter as pulley, makes belt parallel so its prettier
bearing_623_double = [10, 8, 3, 0];

idler_bearing = bearing_624_double;

//Select carriage lenght
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

//set to 0 for single plate (affects z axis and screws that attach RP parts to frame)
i_am_box = 0;

//if you do your own plate and can move bottom Z screws 5mm up set this to 0 to
//get stronger motor mount. Only for i_am_box = 0
i_want_to_use_single_plate_dxf_and_make_my_z_weaker = 1;

//radius of long threaded rod on Y frame
//Use 5.4 for M10 or 4.4 for M8
y_threaded_rod_long_r = 5.4;

// Thickness of the XZ plate board. Leave at 12 for single plate
board_thickness = 12;

// segments of small holes. some poeple claim that a low value makes them easier to print.
small_hole_segments=7;

// END of custom settings


// You are not supposed to change this
board_to_xz_distance = 26;
xaxis_rod_distance = 45;

//calculated from settings
single_wall_width = width_over_thickness * layer_height;

idler_width = (idler_bearing[1] > 7 ? idler_bearing[1] : 7) + 2.5 * idler_bearing[3] ;

//deltas are used to enlarge parts for bigger bearings 
xy_delta = ((bushing_xy[1] <= 7.7) ? 0 : bushing_xy[1] - 7.7) * 0.9;
z_delta = (bushing_z[1] <= 7.7) ? 0 : bushing_z[1] - 7.7;

// CHANGE ONLY THE STUFF YOU KNOW
// IT WILL REPLACE DEFAULT SETTING

// RODS

// threaded_rod_diameter = 0;
// threaded_rod_diameter_horizontal = 0;
// smooth_bar_diameter = 0;
// smooth_bar_diameter_horizontal = 0;

// Nuts and bolts

// m8_diameter = 0;
// m8_nut_diameter = 0;

// m4_diameter = 0;
// m4_nut_diameter = 0;

// m3_diameter = 0;
// m3_nut_diameter = 0;

// Bushing holder

// bushing_core_diameter = smooth_bar_diameter;
// bushing_material_thickness = 0;

///counted stuff
m3_nut_diameter_bigger = ((m3_nut_diameter  / 2) / cos (180 / 6))*2;

// functions
include <inc/functions.scad>

// These constants define the geometry of the complete-printer.scad

//x_smooth_rod_length=325;
//y_smooth_rod_length=405;
//z_smooth_rod_length=235;
bed_x_size=225;
bed_y_size=225;

x_smooth_rod_length=460+board_thickness*2; // 492 for 16mm thickness; 484 for 12mm thickness
y_smooth_rod_length=470;
z_smooth_rod_length=405;
