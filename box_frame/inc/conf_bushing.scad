// PRUSA iteration3
// Bushing and bering dimensions
// GNU GPL v3
// Václav 'ax' Hůla <axtheb@gmail.com>
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel
//

// each config is in form[r_rod, r, h, type, name] where:
//     r_rod  is smooth rod radius [0]
//     r is outer bushing radius needed for tight fit or bearing radius with loose fit [1]
//     h is barrel length [2]
//     type is 0 for linear bearings, 1 is for bushings which needs to be enclosed fully. [3]
//       is it alo assumed that type 1 has flange and type 0 has not
//     name is human readable name [4]

conf_b_igus = [4, 5.1, 10, 1, "igus J(V)FM 0810-10 or GFM 0810-10"];
conf_b_lm8uu = [4, 7.7, 24, 0, "lm8uu bearing (standard)"];

conf_b_igus10 = [5, 6.1, 10, 1, "igus J(V)FM 1012-10"];
conf_b_lm10uu = [5, 9.7, 29, 0, "lm10uu bearing (10mm smooth rod)"];
conf_b_lm10luu = [5, 9.7, 55, 0, "lm10luu bearing (10mm smooth rod, long)"];

conf_b_lme8uu =[4, 8.2, 25, 0, "lme8uu bearing"];
conf_b_lm8luu = [4, 7.7, 45, 0, "lm8luu bearing (double length)"];
conf_b_bronze = [4, 8, 11, 1, "bronze self-aligning bushing, 8mm"];
conf_b_lm12uu = [6, 10.6, 30, 0, "lm12uu bearing (12mm smooth rod)"];
conf_b_lm12luu = [6, 10.6, 57, 0, "lm12luu bearing (12mm, double length)"];
