include<notched_attachment.scad>;

speaker_box_hight = 60; 
speaker_box_width = 60;
speaker_box_length = 180;
//does not go to 116 or higher
spacer_box_hight = 80; 
//dont make this longer its a waist of filament.:
spacer_box_width = 40;
spacer_box_length = 55;

usb_cutout_hight = 50;
usb_cutout_width = 15;
usb_cutout_length = 55;

wall_width = 1.5;

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
  translate([0,-50,27])
    rotate([0,90,270])
      atachment_notch(spacer_box_hight,spacer_box_width,spacer_box_length);

difference(){
  translate([0,0,37])
    cube([speaker_box_length+70,speaker_box_width-7,speaker_box_hight+11],center = true);

  translate([0,0,100])
    cube([speaker_box_length+65,speaker_box_width-15,speaker_box_length+0],center = true);
}









