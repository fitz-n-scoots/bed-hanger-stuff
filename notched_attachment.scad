pi_box_hight = 120; 
pi_box_width = 60;
pi_box_length = 70;
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


module atachment_notch() {
  hull(){
    translate([0,0,12.5]){
      translate([notch_tip_length/2, 0, notch_rim_height/2]) rotate([0, 0, 360/16])
        cylinder(h = notch_rim_height, r = notch_rim_radius / cos(360/16), $fn = 8, center = true);
      translate([notch_tip_length/-2, 0, notch_rim_height/2]) rotate([0, 0, 360/16])
        cylinder(h = notch_rim_height, r = notch_rim_radius / cos(360/16), $fn = 8, center = true);
      translate([0, 0, notch_tip_height/2])
        cube([notch_tip_length, notch_tip_width, notch_tip_height], center = true);
        
    }
}
 
        translate([-spacer_box_width*2+14 + 15,4.5,3])
            rotate([90,0,0])
                cylinder(r=2.5 , h= 9);

        difference(){
    
        
    union(){
      translate([-15,0,magnet_hight-2])
        cube([spacer_box_hight - 3,magnet_width+2,magnet_hight*2],center = true);
    }
    union(){
      translate([0,-0,magnet_hight+.5])
        cube([magnet_length*30,magnet_width,magnet_hight*2],center = true);
    
    }
    }
}

atachment_notch();