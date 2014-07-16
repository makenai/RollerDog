// Wheel Hubcap

outside_dimension = 42;
inside_dimension = 16;

module hubcap() {
	difference() {
		hull() {
			translate([0,0,6])
				cylinder(d=outside_dimension-5,h=2,center=true);
			cylinder(d=outside_dimension,h=10,center=true);
		}
		translate([0,0,-3])
			cylinder(d=inside_dimension,h=6,center=true);
	}
}

hubcap();
