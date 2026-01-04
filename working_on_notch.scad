
notch_mating_gap = 0.0;

notch_rim_radius = 5.5 + notch_mating_gap;
notch_rim_height = 2 + notch_mating_gap;

notch_tip_length = 27 + notch_mating_gap;
notch_tip_width = 7 + notch_mating_gap;
notch_tip_height = 7.6 + notch_mating_gap;

magnet_length = 27.5;
magnet_width = 7.5;
magnet_hight = magnet_width;

module magnet(){
    cube([magnet_length,magnet_width,magnet_hight],center = true);
}

module atachment_notch() {
  hull(){
    translate([notch_tip_length/2, 0, magnet_hight/2-4]) rotate([0, 0, 360/16])
      cylinder(h = notch_rim_height, r = notch_rim_radius / cos(360/16), $fn = 8, center = true);
    translate([notch_tip_length/-2, 0,magnet_hight/2-4 ]) rotate([0, 0, 360/16])
      cylinder(h = notch_rim_height, r = notch_rim_radius / cos(360/16), $fn = 8, center = true);
    translate([0, 0, notch_tip_height/2])
      cube([notch_tip_length, notch_tip_width, notch_tip_height], center = true);
  }
}
translate([0,0,magnet_hight * 2 + 1]){


difference(){
atachment_notch();

translate([0,0,magnet_hight/2-4])
magnet();
}

}

difference(){

translate([0,0,magnet_hight])
cube([magnet_length+2,magnet_width+2,magnet_hight*2],center = true);

translate([0,-0,magnet_hight+.5])
cube([magnet_length,magnet_width,magnet_hight*2],center = true);
    
translate([0,-0,magnet_hight+.5])
cube([magnet_length+6,magnet_width,magnet_hight+1],center = true);
}