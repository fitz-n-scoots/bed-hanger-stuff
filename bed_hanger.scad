
DEFAULT_FN = 64;

slat_gap_distance = 67;

spacer_fit_gap = 0.5;

spacer_radius = (slat_gap_distance - spacer_fit_gap)/2;
spacer_height = 20;

mating_surface_width = slat_gap_distance - spacer_fit_gap;
mating_surface_height = 7.5;

cify_underhang = 15;
cify_radius = spacer_radius + cify_underhang;
cify_taper = mating_surface_height/2;

slider_length = 150;
slider_width = mating_surface_width;
slider_height = mating_surface_height;

sphefy_length = slider_length * 1.25;
sphefy_width = slider_width * 1.5;
sphefy_height = slider_height * 2.5;
sphefy_z_offset = sphefy_height * -0.25;

notch_mating_gap = 0.5;

notch_rim_radius = 5.5 + notch_mating_gap;
notch_rim_height = 2 + notch_mating_gap;

notch_tip_length = 23 + notch_mating_gap;
notch_tip_width = 5 + notch_mating_gap;
notch_tip_height = 7.6 + notch_mating_gap;

notch_magnet_gap = 1;

hanger_full_height = slider_height + spacer_height + mating_surface_height;

magnet_hole_height = hanger_full_height - notch_magnet_gap - notch_tip_height;
magnet_hole_radius = 14.5;

module spacer () {
  cylinder(r = spacer_radius, h = spacer_height, $fn = DEFAULT_FN);
}

module mating_surface() {
  intersection() {
    cube([mating_surface_width + cify_underhang*2, mating_surface_width, mating_surface_height], center = true);
    hull() {
      translate([0, 0, mating_surface_height/4]) cylinder(r = cify_radius, h = mating_surface_height/2, $fn = DEFAULT_FN, center = true);
      cylinder(r = cify_radius - cify_taper, h = mating_surface_height, $fn = DEFAULT_FN, center = true);
    }
  }
}

module slider() {
  cube([slider_length, slider_width, slider_height], center = true);
}

module sphefy_slider() {
  intersection() {
    slider();
    translate([0, 0, sphefy_z_offset])
      scale([sphefy_length, sphefy_width, sphefy_height])
        sphere(r = 0.5, $fn = DEFAULT_FN);
  }
}

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

module magnet_hole_cutout() {
  translate([0, 0, hanger_full_height - magnet_hole_height/2])
    cylinder(h = magnet_hole_height, r = magnet_hole_radius, $fn = DEFAULT_FN, center = true);
}

module hanger_positive() {
  translate([0, 0, spacer_height + mating_surface_height + slider_height/2])
    sphefy_slider();

  translate([0, 0, mating_surface_height/2])
    mating_surface();

  translate([0, 0, mating_surface_height])
    spacer();
}

module hanger() {
  difference() {
    hanger_positive();
    union() {
      atachment_notch();
        magnet_hole_cutout();
    }
  }
}

hanger();