pi_box_hight = 120; 
pi_box_width = 50;
pi_box_length = 70;

spacer_box_hight = 100; 
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

module atachment_notch_top() {
  hull(){
    translate([notch_tip_length/2, 0, magnet_hight/2-4]) rotate([0, 0, 360/16])
      cylinder(h = notch_rim_height, r = notch_rim_radius / cos(360/16), $fn = 8, center = true);
    translate([notch_tip_length/-2, 0,magnet_hight/2-4 ]) rotate([0, 0, 360/16])
      cylinder(h = notch_rim_height, r = notch_rim_radius / cos(360/16), $fn = 8, center = true);
    translate([0, 0, notch_tip_height/2])
      cube([notch_tip_length, notch_tip_width, notch_tip_height], center = true);
  }
}

module notch (){
    
    difference(){
    translate([0,0,magnet_hight*2+1])
    atachment_notch_top();
    translate([0,0,magnet_hight*2+1])
    magnet();
    
    }
    difference(){
    union(){
    translate([-spacer_box_hight/3,0,5])
        cube([spacer_box_hight-17,magnet_width+2,magnet_hight*2],center = true);
    }
    union(){
    translate([-spacer_box_hight/3,0,5])
    cube([magnet_length*4-10,magnet_width,spacer_box_hight-1],center = true);
    }
    }
}

module pi_box (){
    difference(){
    union(){
    translate([0,0,pi_box_hight/2])
    cube([pi_box_length,pi_box_width,pi_box_hight],center = true);
    
    difference(){
    translate([0,pi_box_width/2 - 9.5,120])
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
    cube([pi_box_length-1 , pi_box_width-1 , pi_box_hight-10] , center = true);
    
    translate([0,-10,pi_box_hight-3])
    cube([pi_box_length - wall_width,29.3333333333333,7],center = true);

    }
}
module spacing_box (){
    difference(){
    
    union(){
    translate([0,0,40])
    cube([spacer_box_length,spacer_box_width,spacer_box_hight],center = true);
    }
    
    translate([0,-40,30])
    rotate([0,90,270])
    translate([-15,0,magnet_hight-2])
        magnet();
        
    translate([0,-5,30])
    rotate([0,0,270])
    translate([5.5,-0,magnet_hight+20])
        cube([magnet_width*2,magnet_width+2,spacer_box_hight - 25],center = true);
        
    translate([0,-6,30])
    cube([magnet_hight,magnet_width,magnet_length], center = true);
    }
    
}
pi_box();

translate([0,(pi_box_width + spacer_box_width)/-2,10])
spacing_box ();

translate([0,(pi_box_width + spacer_box_width + 10)/-2,25])
rotate([0,90,270])
notch();