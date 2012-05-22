// PRUSA Mendel  
// Configuration file
// GNU GPL v3
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

// PLEASE SELECT ONE OF THE CONFIGURATIONS BELOW
// BY UN-COMMENTING IT

// Uncomment for metric settings
// METRIC METRIC METRIC METRIC METRIC METRIC METRIC METRIC 

include <metric.scad>;

// CUSTOM CUSTOM CUSTOM CUSTOM CUSTOM CUSTOM CUSTOM CUSTOM CUSTOM

thin_wall = 3;


// Linear bearing version
linear = false;
// set false for LM-8UU, true for LM-E-8UU (ignore if linear is set to false)
lme8uu = false;



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
include <functions.scad>

