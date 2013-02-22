# This is Prusa iteration 3
Published under GPL v3

## To start:
Copy configuration.scad.dist to configuration.scad and fill custom settings section there

Print calibarion part form extras and check that:
 * your bearings fit tightly in the holder
 * Z smooth rod sits firmly inside the round hole, its ok if it needs to be forced there
 * X smooth rod can be inserted in the half round/half square hole. May need some processing of the flat part if the bridge sags. Your X ends may break if you need hammer here.
 * Hexagonal nut trap can hold M3 nut
 * Screw that you will be using to attach parts to frame can be inserted to hole near the nut trap
 * Your belt can be inserted in the slot and sits there __firmly__.

RP every .scad in this directory once
Aim for 0.3mm layers and 2.2 extrusion width (width over thickness), for 0.66mm stroke width. Printer is tested at this setting.
If you print bushing.stl/y-carriage.stl in PLA it may deform due to heatbed being close, and printed groovemount is in danger too.

Using doc/complete-printer-plus.scad as a visual clue and doc/manual.txt as a guide, build the printer.
