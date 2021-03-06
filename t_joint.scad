// RollerDog T-Joint

arm_length=20;
nut_size=7.75;
bolt_diameter=4.75;
cube_size=32;
top_lip_height=8;
lip_width=10;
wheel_bolt_diameter=18;
bearing_diameter=22.5;
edge_room=3;
pipe_diameter=21.5;
tooth_count = 24;

module nut() {
	intersection_for (i=[0,45]) {
		rotate([i,0])
			cube([3,nut_size,nut_size],center=true);
	}
}

module pvc_pipe() {
	rotate([0,90,0])
		cylinder(d=pipe_diameter,h=80,center=true);
	for (i=[0:tooth_count/2]) {
		rotate([i*(360/tooth_count),0,0])
		cube([80,pipe_diameter+1,1],center=true);
	}
}

module bearing() {
	cylinder(d=bearing_diameter,h=10,center=true);
}


module tube() {
	difference() {
		union() {
			rotate([00,90,0])
				cylinder(d=cube_size,h=cube_size*1.5,center=true);
			translate([0,0,cube_size/4])
				cube([cube_size*1.5,cube_size,cube_size/2],center=true);
		}
		pvc_pipe();
	}
}

module clamp() {
	difference() {
		union() {
			rotate([00,90,0])
				cylinder(d=cube_size,h=cube_size,center=true);
			translate([0,0,(top_lip_height+cube_size/2)/2])
				cube([cube_size,lip_width,top_lip_height+cube_size/2],center=true);
			translate([0,0,-cube_size/4])
				cube([cube_size,cube_size,cube_size/2],center=true);
			translate([0,0,-cube_size*0.75])
			rotate([0,90,0])
				tube();
		}
		// Gap
		translate([0,0,20])
			cube([35,2,40],center=true);
		// Nut Hole
		translate([0,5,cube_size/2+top_lip_height/2-0.5])
			rotate([0,0,90]) 
				nut();
		// Bolt Hole
		translate([0,0,cube_size/2+top_lip_height/2-0.5])
			rotate([90,0,0]) 
				cylinder(d=bolt_diameter,h=20,center=true);
		// Pipe Hole
		pvc_pipe();
	}
}


module t_joint() {
	translate([0,0,cube_size/2])
	rotate([0,90,0])
		clamp();
}

t_joint();


