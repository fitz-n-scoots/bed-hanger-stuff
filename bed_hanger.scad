
DEFAULT_FN = 64;

slat_gap_distance = 67;

spacer_fit_gap = 0.5;

spacer_radius = (slat_gap_distance - spacer_fit_gap)/2;
spacer_height = 20;

mating_surface_width = slat_gap_distance - spacer_fit_gap;
mating_surface_height = 7.5;

slider_length = 100;
slider_width = mating_surface_width;
slider_height = mating_surface_height;

module spacer () {
  cylinder(r = spacer_radius, h = spacer_height, $fn = DEFAULT_FN);
}

module mating_surface(){
  cube([mating_surface_width, slat_gap_distance, mating_surface_height],center = true);
}

module slider (){
  cube([slider_width, slider_length, slider_height],center = true);
}

module atachment_nub (){
  hull(){
    cylinder(r=2.5 , $fn = 8);
    translate([7,0,0])
      cylinder(r=2.5 , $fn = 8);
    translate([3.5,-0,-2])
      cube([7,3,0.05], center = true);
  }
}

module hanger() {
  translate([-3.5,0,-1])
    atachment_nub();

  translate([0, 0, spacer_height + mating_surface_height + slider_height/2])
    slider();

  translate([0,0,mating_surface_height/2])
    mating_surface();

  translate([0,0,mating_surface_height])
    spacer();
}

hanger();