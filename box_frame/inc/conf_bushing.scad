// PRUSA iteration3
// Bushing and bering dimensions
// GNU GPL v3
// Václav 'ax' Hůla <axtheb@gmail.com>
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/josefprusa/Prusa3
//

// each config is in form[r_rod, r, h, type, name] where:
//     r_rod  is smooth rod radius [0]
//     r is outer bushing radius needed for tight fit or bearing radius with loose fit [1]
//     h is barrel length [2]
//     type is 0 for linear bearings, 1 is for bushings which needs to be enclosed fully. [3]
//       type 1 may have flange, but type 0 not
//     name is human readable name [4]

//bushings
conf_b_bushing8 = [4, 5.1, 10, 1, "Tube shaped bushing like igus J(V)FM 0810-10"];
conf_b_bushing10 = [5, 6.1, 10, 1, "Tube shaped bushing with id=10mm, od=12mm and length of at least 10mm, like J(V)FM 1012-10"];
conf_b_bushing12 = [6, 7.1, 15, 1, "Tube shaped bushing with id=12mm, od=14mm and length of at least 15mm, like SF-1 1215"];

conf_b_bronze8 = [4, 8, 11, 1, "bronze self-aligning bushing, 8mm"];

//shorter beaings (two on each Z axis)
conf_b_lm8uu = [4, 7.7, 24, 0, "lm8uu bearing (standard)"];
conf_b_lm10uu = [5, 9.7, 29, 0, "lm10uu bearing (10mm smooth rod)"];
conf_b_lme8uu =[4, 8.2, 25, 0, "lme8uu bearing"];
conf_b_lm12uu = [6, 10.6, 30, 0, "lm12uu bearing (12mm smooth rod)"];

//longer bearings
conf_b_lm8luu = [4, 7.7, 45, 0, "lm8luu bearing (double length)"];
conf_b_lm10luu = [5, 9.7, 55, 0, "lm10luu bearing (10mm smooth rod, long)"];
conf_b_lm12luu = [6, 10.6, 57, 0, "lm12luu bearing (12mm, double length)"];


// Select idler bearing size **************************************************
// [outer_diameter, width, inner_diameter, uses_guide]

// roughly sorted by desirability

// one bearing with guides
// Select by availability, smaller is better.
bearing_623 = [10, 4, 3, 1, "623 bearing"];
bearing_624 = [13, 5, 4, 1, "624 bearing"];
bearing_625 = [16, 5, 5, 1, "625 bearing"];

// two bearings side by side - for use without bearing guides.
// Not recomended anymore
bearing_625_double = [16, 10, 5, 0, "625 bearing x2"];
bearing_624_double = [13, 10, 4, 0, "624 bearing x2"];
bearing_623_double = [10, 8, 3, 0, "623 bearing"];

// 608 [standard skate bearings] with bearing guide
bearing_608 = [22, 7, 8, 1, "608 bearing"];
// 608 bearings with fender washers.
// the belt brushes both against the carriage and the washers.
bearing_608_washers = [22, 10, 8, 0, "608 bearing"];

