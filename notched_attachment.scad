
notch_mating_gap = 0.0;

notch_rim_radius = 5 + notch_mating_gap;
notch_rim_height = 2 + notch_mating_gap;

notch_tip_length = 20 + notch_mating_gap;
notch_tip_width = 4 + notch_mating_gap;
notch_tip_height = 6 + notch_mating_gap;

module atachment_notch() {
  hull(){
    translate([notch_tip_length/2, 0, notch_rim_height/2]) rotate([0, 0, 360/16])
      cylinder(h = notch_rim_height, r = notch_rim_radius / cos(360/16), $fn = 8, center = true);
    translate([notch_tip_length/-2, 0, notch_rim_height/2]) rotate([0, 0, 360/16])
      cylinder(h = notch_rim_height, r = notch_rim_radius / cos(360/16), $fn = 8, center = true);
    translate([0, 0, notch_tip_height/2])
      cube([notch_tip_length, notch_tip_width, notch_tip_height], center = true);
  }
}

atachment_notch();