// PRUSA Mendel  
// X-end with NEMA 17 motor mount
// GNU GPL v3
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>
corection = 1.17; 

/**
 * @id x-end-motor
 * @name X end motor
 * @category Printed
 * @using 2 bushing
 * @using 4 m3x10xhex
 * @using 4 m3washer
 * @using 1 m8spring
 * @using 2 m8nut
 */




use <x-end.scad>

difference (){
		union ()
		{
			mirror() xend(true,linear);
		
			//translate(v = [0, 35, 12.5]) 
			//xend_nema17();
		
			translate(v = [0, 0, 0]) positioned_motor_mount();
		}
		positioned_motor_mount_holes();
}
translate([-5,-30,2])scale([2,1,2]) rotate(a=[90,0,0]) linear_extrude(file = "this-way-up.dxf", layer = "l",
  height = 2, center = true, convexity = 10, twist = -fanrot);


// GregFrosts stuff
nema17_hole_spacing=1.2*25.4; 
nema17_width=1.7*25.4;
thickness=9;
nema17_support_d=nema17_width-nema17_hole_spacing;
motor_mount_rotation=[0,0,0];
motor_mount_translation=[44-thickness,8,23.5-4.7-12+24.5];

top_corner=motor_mount_translation+[thickness,nema17_width/2,nema17_width/2];
bridge_length=top_corner[0]-9;
bridge_shear=0.48;

module positioned_motor_mount()
{
	difference ()
	{
		translate(motor_mount_translation)
		union()
		{
			rotate([0,90,0])
			motor_mount ();
			
			translate(-motor_mount_translation)
			{
				difference(){				
					translate(top_corner+[-bridge_length,-nema17_support_d-bridge_shear*bridge_length,-2.5])
						multmatrix([[1,0,0],[bridge_shear,1,0],[0,0,1]])
							cube([bridge_length,nema17_support_d,6]);
					// quick hack
					if(linear==true){
						translate(top_corner+[-bridge_length,-nema17_support_d-bridge_shear*bridge_length+8.5,-2.5])
							multmatrix([[1,0,0],[bridge_shear+0.16,1,0],[0,0,1]])
								#cube([bridge_length,nema17_support_d,6]);
					}
				}

				render()
				translate(top_corner+[-thickness,-nema17_support_d,-nema17_support_d/2])
				intersection()
				{
					translate([0,-bridge_shear*thickness,0])
					multmatrix([[1,0,0],[bridge_shear,1,0],[0,0,1]])
					cube([thickness,nema17_support_d,nema17_support_d/2]);
					cube([thickness,nema17_support_d,nema17_support_d/2]);
				}
				
			
			}
			
			render()
			intersection()
			{
				translate([0,-nema17_width/2+nema17_support_d/2,1])
				rotate([0,90,0])
				translate([3.6*1.5*thickness,0,-thickness])
				multmatrix([[1,0,-3.6],[0,1,0],[0,0,2]])
				{
					rotate(90)
					linear_extrude(height=thickness)
					barbell(nema17_support_d/2,
					nema17_support_d/2,20,60,nema17_hole_spacing);
					translate([-20,-nema17_support_d/2,0])
					cube([20,nema17_width,thickness]);
				}
				
				translate([0,0,-motor_mount_translation[2]+15.8/2])
				cube([thickness*3,nema17_width,15.8],true);
			}
		}

	translate(motor_mount_translation)
	translate([-25,-nema17_width/2-1-16,-32])
	cube([20,nema17_width+2,20]);

	}
}

module positioned_motor_mount_holes()
{
	translate(motor_mount_translation)
	rotate([0,90,0])
	motor_mount_holes ();
}

module motor_mount ()
{
	rotate(motor_mount_rotation)
	{
		for (hole=[1,2])
		rotate([0,0,90*hole])
		linear_extrude(height=thickness)
		translate(-nema17_hole_spacing*[1,1,0]/2)
		barbell (nema17_support_d/2,
		nema17_support_d/2,20,60,nema17_hole_spacing);
		% cube([nema17_width,nema17_width,0.1],true);
	}
}

module motor_mount_holes ()
{
	// Motor mount holes. 
	translate([0,0,1])
	rotate(motor_mount_rotation)
	{
		for (hole=[3:5])
		rotate([0,0,90*hole])
		translate(nema17_hole_spacing*[1,1,0]/2)
		rotate(360/16)
		cylinder(h=thickness+2,r=4.4/2,$fn=8);
		
		for (hole=[3:5])
		rotate([0,0,90*hole])
		translate(nema17_hole_spacing*[1,1,0]/2)
		translate([0,0,-24])
		cylinder(h=25,r=7/2);
	}
translate([2.5,-25,0]) #cube([10,20,10]);
}

module barbell (r1,r2,r3,r4,separation) 
{
	x1=[0,0];
	x2=[separation,0];
	x3=triangulate (x1,x2,r1+r3,r2+r3);
	x4=triangulate (x2,x1,r2+r4,r1+r4);
	# render()
	difference ()
	{
		union()
		{
			translate(x1)
			circle (r=r1);
			translate(x2)
			circle(r=r2);
			polygon (points=[x1,x3,x2,x4]);
		}
		translate(x3)
		circle(r=r3,$fa=5);
		translate(x4)
		circle(r=r4,$fa=5);
	}
}

function triangulate (point1, point2, length1, length2) = 
point1 + 
length1*rotated(
atan2(point2[1]-point1[1],point2[0]-point1[0])+
angle(distance(point1,point2),length1,length2));

function distance(point1,point2)=
sqrt((point1[0]-point2[0])*(point1[0]-point2[0])+
(point1[1]-point2[1])*(point1[1]-point2[1]));

function angle(a,b,c) = acos((a*a+b*b-c*c)/(2*a*b)); 

function rotated(a)=[cos(a),sin(a),0];

