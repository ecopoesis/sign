// print_anchors.scad
// Prescott Ogden <ogden@pres.co.tt>

// This is a very simple script that takes an stl file as input and generates 
// a model with print anchors, as seen in thing 16596.
// It was written to enable designers to distribute files that may need such
// anchors in a way that is not process-specific, and can be used on well
// calibrated FDM machines as well as with SLS and LOM technologies.
// A user who needs print anchors can apply this script as a pre-processing step,
// before handing to a toolpath generator. Ideally, this will be made obsolete by 
// plugins to various toolpath generators, and ultimately improvements in raftless
// printing, but for now, this is extremely simple to implement and acheives 
// the desired effect.


file = "example.stl"; // The input file, with printbed on xy plane.
anchor_height = 0.3; // height of print anchor in mm,
anchor_margin =10;  // distance the anchor extends from the base of the part

epsilon = 0.001; // a very tiny distance, because openSCAD cannot yet 
			// do minkowski sums in 2D

union(){
	minkowski(){
		linear_extrude( height = epsilon, center = false, convexity = 10, twist = 0)
			projection (cut = true) import(file);
	
		cylinder(r = anchor_margin, h = anchor_height - epsilon, center = false);
	}
	
	translate([0, 0, anchor_height])
		import(file);
}

