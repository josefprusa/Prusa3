// Moved from config.scad

board_to_xz_distance = 26;
xaxis_rod_distance = 45;

//calculated from settings
single_wall_width = width_over_thickness * layer_height;

idler_width = max(belt_width, (idler_bearing[1] > 7 ? idler_bearing[1] : 7)) + 2.5 * idler_bearing[3] ;

//deltas are used to enlarge parts for bigger bearings
xy_delta = ((bushing_xy[1] <= 7.7) ? 0 : bushing_xy[1] - 7.7) * 0.9;
z_delta = (bushing_z[1] <= 7.7) ? 0 : bushing_z[1] - 7.7;

m3_nut_diameter_bigger = ((m3_nut_diameter / 2) / cos (180 / 6)) * 2;
