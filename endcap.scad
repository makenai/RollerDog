// RollerDog End Cap

arm_length=15;
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


module pvc_pipe() {
	rotate([0,90,0])
		cylinder(d=pipe_diameter,h=40,center=true);
}

module end_cap() {
	pvc_pipe();
}

end_cap();


