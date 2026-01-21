include<notched_attachment.scad>;

speaker_box_hight = 60; 
speaker_box_width = 80;
speaker_box_length = 230; 
//does not go to 116 or higher
spacer_box_hight = speaker_box_hight + 20;
//dont make this longer its a waist of filament.:
spacer_box_width = 40; //!
spacer_box_length = 55;

usb_cutout_hight = 50;
usb_cutout_width = 15;
usb_cutout_length = 55;


  translate([0,-speaker_box_width/2-22.5,spacer_box_hight/2 - 18.5])
    rotate([0,90,270])
      atachment_notch(spacer_box_hight,spacer_box_width,spacer_box_length);

difference(){
  translate([0,0,37])
    cube([speaker_box_length,speaker_box_width-7,speaker_box_hight+11],center = true);

  translate([0,0,45])
    cube([speaker_box_length-5,speaker_box_width-15,speaker_box_hight],center = true);
}









