use <bevel_extrude.scad>

dxffile = "d.dxf";

union() {
	color("darkblue")
	difference() {
		letter();
		cube([300, 300, 20]);
	}

	color("deeppink") 
	difference() {
		letter();
		translate([0, 0, 20])
		cube([300, 300, 20]);
	}
}

module letter() {
	bevel_extrude(height=22,bevel_depth=2,$fn=32)
	import (file = dxffile);
}