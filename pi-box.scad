include<notched_attachment.scad>;

pi_box_hight = 120; 
pi_box_width = 60;
pi_box_length = 70;
//does not go to 116 or higher
spacer_box_hight = 80; 
//dont make this longer its a waist of filament.scad:
spacer_box_width = 40;
spacer_box_length = 55;

usb_cutout_hight = 50;
usb_cutout_width = 15;
usb_cutout_length = 55;

wall_width = 1.5;



module pi_box (){
    difference(){
      union(){
        translate([0,0,pi_box_hight/2])
          cube([pi_box_length,pi_box_width,pi_box_hight],center = true);
    
      difference(){
        translate([0,pi_box_width/2 - 9.5,pi_box_hight])
          cube([pi_box_length,18,1],center = true);
    

      translate([0,pi_box_width/2 - 14,pi_box_hight-20])
        cube([pi_box_length-10,usb_cutout_width,usb_cutout_hight+200],center = true);
    }
    }
      translate([pi_box_length/2,10,45])
        cube([usb_cutout_length,usb_cutout_width,usb_cutout_hight],center = true);

      translate([-pi_box_length/2,-2.5,45])
        cube([usb_cutout_length,usb_cutout_width,usb_cutout_hight],center = true);
      translate([-pi_box_length/2,-9,120])
        cube([50,2,200],center = true);

      translate([0,0,pi_box_hight/2 + 5])
        cube([pi_box_length-1 + 0.001, pi_box_width-1 + 0.001, pi_box_hight-10 + 0.001] , center = true);
    
      translate([0,-10,pi_box_hight-3])
        cube([pi_box_length - wall_width,29.3333333333333,7],center = true);
    }
}





pi_box();

translate([0,-pi_box_width/2 - spacer_box_width/2 -7.5 , 20])
    rotate([0,90,270])
        atachment_notch(spacer_box_hight,spacer_box_width,spacer_box_length);

