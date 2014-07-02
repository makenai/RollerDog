// RollerDog Wheel Adapters

arm_length=20;
nut_size=7.25;
bolt_diameter=4.25;
cube_size=32;
top_lip_height=9;
lip_width=10;
wheel_bolt_diameter=18;
bearing_diameter=22.25;
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
		rotate([00,90,0])
			cylinder(d=cube_size,h=cube_size,center=true);
		translate([0,0,(top_lip_height+cube_size/2)/2])
			cube([cube_size,lip_width,top_lip_height+cube_size/2],center=true);
		translate([0,-cube_size/4,(-arm_length-cube_size/2)/2])
			cube([cube_size,cube_size/2,arm_length+cube_size/2],center=true);
		translate([cube_size/4,-cube_size/4,-arm_length-cube_size/2])
			cube([cube_size/2,cube_size/2,cube_size],center=true);
		translate([0,-cube_size/4,-arm_length-cube_size/2])
			rotate([90,0,0])
			cylinder(d=cube_size,h=cube_size/2,center=true);

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
	// Bearing Holes
	translate([0,-cube_size/2,-arm_length-cube_size/2])
		rotate([90,0,0]) 
		bearing();
	translate([0,0,-arm_length-cube_size/2])
		rotate([90,0,0]) 
		bearing();
	// Bearing Inner Hole
	translate([0,0,-arm_length-cube_size/2])
		rotate([90,0,0]) 
			cylinder(d=wheel_bolt_diameter,h=60,center=true);
	
}

