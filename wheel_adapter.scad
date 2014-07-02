// RollerDog Wheel Adapters

arm_length=30;
nut_size=5;
bolt_diameter=3;
cube_size=30;
top_lip_height=8;
lip_width=10;
wheel_bolt_diameter=8;
bearing_diameter=22;
edge_room=3;

module nut() {
	intersection_for (i=[0,45]) {
		rotate([i,0])
			cube([3,nut_size,nut_size],center=true);
	}
}


module pvc_pipe() {
	rotate([0,90,0])
		cylinder(d=21,h=40,center=true);
}

module bearing() {
	cylinder(d=bearing_diameter,h=7,center=true);
}

difference() {
	union() {
		cube(cube_size,center=true);
		translate([0,0,cube_size/2+top_lip_height/2])
			cube([cube_size,lip_width,top_lip_height],center=true);
		translate([0,-cube_size/4,-cube_size/2-arm_length/2])
			cube([cube_size,cube_size/2,arm_length],center=true);
	}
	// Gap
	translate([0,0,15])
		cube([35,1,20],center=true);
	// Nut Hole
	translate([0,5,cube_size/2+top_lip_height/2])
		rotate([0,0,90]) 
			nut();
	// Bolt Hole
	translate([0,0,cube_size/2+top_lip_height/2])
		rotate([90,0,0]) 
			cylinder(d=bolt_diameter,h=20,center=true);
	// Pipe Hole
	pvc_pipe();
	// Bearing Hole
	translate([0,-cube_size/2,-arm_length-cube_size/2+bearing_diameter/2+edge_room])
		rotate([90,0,0]) 
		bearing();
	translate([0,0,-arm_length-cube_size/2+bearing_diameter/2+edge_room])
		rotate([90,0,0]) 
			cylinder(d=wheel_bolt_diameter,h=60,center=true);
	
}

