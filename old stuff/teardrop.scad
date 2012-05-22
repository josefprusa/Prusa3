// PRUSA Mendel  
// Bushings
// GNU GPL v3
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

teardropcentering2();

module teardrop (r=4.5,h=20)
{
	rotate([-270,0,90])
	linear_extrude(height=h)
	{
		circle(r=r, $fn = 25);
		polygon(points=[[0,0],[r*cos(30),r*sin(30)],[0.5*r,r],[-0.5*r,r],[-r*cos(30),r*sin(30)]],
				paths=[[0,1,2,3,4]]);
	}
}

module teardropcentering (r=4.5,h=20)
{
	rotate([-270,0,90])
	linear_extrude(height=h)
	{
		circle(r=r, $fn = 25);
		polygon(points=[[0,0],[r*cos(30),r*sin(30)],[0.5*r,1.2*r],[-0.5*r,1.2*r],[-r*cos(30),r*sin(30)]],
				paths=[[0,1,2,3,4]]);
	}
}

module teardropcentering2 (r=4.5,h=20)
{
	//rotate([-270,0,90])
	difference(){
	linear_extrude(height=h)
	{
		circle(r=r, $fn = 25);
		polygon(points=[[0,0],[r*cos(30),r*sin(30)],[0.5*r,1.2*r],[-0.5*r,1.2*r],[-r*cos(30),r*sin(30)]],
				paths=[[0,1,2,3,4]]);
	}
	translate(v = [-1.5*r, -1.5*r,-1])cube(size =[3*r,1.5*r,h+2]);
	}
}