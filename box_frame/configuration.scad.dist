// PRUSA iteration3
// Configuration file
// GNU GPL v3
// Josef Průša <josefprusa@me.com>
// Václav 'ax' Hůla <axtheb@gmail.com>
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

// PLEASE SELECT ONE OF THE CONFIGURATIONS BELOW
// BY UN-COMMENTING IT

// Uncomment for metric settings
// METRIC METRIC METRIC METRIC METRIC METRIC METRIC METRIC 

include <inc/metric.scad>;

// Custom settings here, tailor to your supplies and print settings

// Select your belt type ******************************************************

//T2.5
belt_tooth_distance = 2.5;
belt_tooth_ratio = 0.5;

//T5 (strongly discouraged)
//belt_tooth_distance = 5;
//belt_tooth_ratio = 0.75;

//HTD3
//belt_tooth_distance = 3;
//belt_tooth_ratio = 0.75;

//MXL
//belt_tooth_distance = 2.032;
//belt_tooth_ratio = 0.64;

//GT2
//belt_tooth_distance = 2;
//belt_tooth_ratio = 0.5;

// Choose bearing/bushing configuration ***************************************

//Choose from:

// 0 = Z as lm[e]8uu, X and Y bushings
// 1 = all bushings
// 2 = all bearings [default. Do not change unless you really know what you are doing]
// DO NOT OFFER 0 or 1 VARIANTS FOR SALE. We really mean that. In the long run it hurts everyone.

bearing_choice = 2;

// Bushing version
// 0 = square igus housings. By igus we mean JFM-0810-10 or GFM-0810-10
// 1 = round igus (works better if printed precisely)
// 2 = bronze self-aligning bushings
bushing_type = 0;

//Bearing version
// 0 = default lm8uu
// 1 = lme8uu
bearing_type = 0;

// Select idler bearing size **************************************************

// 0 = 608 [standard skate bearings]
// 1 = 624 [roughly same diameter as pulley, makes belt parallel so its prettier]

idler_bearing = 0;

// Thickness of the XZ plate board
board_thickness = 12;

//Layer height * width over thickness. Used for idler sleeve
single_wall_width = 0.3*2.2;

// END of custom settings


// You are not supposed to change this
board_to_xz_distance = 26;
xaxis_rod_distance = 45;
carriage_l = 74;
carriage_hole_to_side = 5;
carriage_hole_height = 4;

//calculated from settings

idler_size = (idler_bearing == 0) ? 22 : 13;

//use 4.5 for 608, 2.5 for 624
idler_size_inner_r = (idler_bearing == 0) ? 4.5 : 2.5;

idler_width = (idler_bearing == 0) ? 9 : 5;

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

x_smooth_rod_length=450+board_thickness*2+10; // 492 for 16mm thickness; 484 for 12mm thickness
y_smooth_rod_length=470;
z_smooth_rod_length=405;  
bed_x_size=225;
bed_y_size=225;
