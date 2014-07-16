// Wheel Hubcap

outside_dimension = 42.3;
inside_dimension = 16;

module hubcap() {
	difference() {
		hull() {
			translate([0,0,6])
				cylinder(d=outside_dimension-5,h=2,center=true);
			cylinder(d=outside_dimension,h=10,center=true);
		}
		translate([0,0,-1.5])
			cylinder(d=inside_dimension,h=9,center=true);
	}
}

difference() {
hubcap();
translate([-15,-15,6])
	linear_extrude(height=2)
	scale([8,8,1])
	import("t.dxf");
}
