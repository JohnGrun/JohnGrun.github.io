echo(version=version());

difference() {
color("red")
    translate([0, -0, 0])
        linear_extrude(height = 2)
            square([121, 121], center = true);
    translate([-60.5,-60.5,0])
        linear_extrude(height = 2)
            square([15,15], center = true);
    translate([60.5,-60.5,0])
        linear_extrude(height = 2)
            square([15,15], center = true);
    translate([60.5,60.5,0])
        linear_extrude(height = 2)
            square([15,15], center = true);
    translate([-60.5,60.5,0])
        linear_extrude(height = 2)
            square([15,15], center = true);
}
                