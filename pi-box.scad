include<notched_attachment.scad>;

pi_box_hight = 120; 
pi_box_width = 60;
pi_box_length = 77;
//does not go to 116 or higher
spacer_box_hight = 80; 
//dont make this longer its a waist of filament.scad:
spacer_box_width = 25;
spacer_box_length = 22.5;

usb_cutout_hight = 50;
usb_cutout_width = 15;
usb_cutout_length = 55;

wall_width = 3;

floor_hight = 6;


module pi_box (){
    difference(){
      union(){
        translate([0,0,pi_box_hight/2])
          cube([pi_box_length,pi_box_width,pi_box_hight],center = true);
      

    }
      translate([pi_box_length/2,15,37.5])
        cube([usb_cutout_length,usb_cutout_width,usb_cutout_hight],center = true);
      
      translate([0,-pi_box_width/2 + 32.5,0])
      union(){
      difference(){    
      translate([-pi_box_length/2 ,-pi_box_width/2 + pi_box_width/2 - 20,45])
        cube([usb_cutout_length,usb_cutout_width,usb_cutout_hight+20],center = true);
          
      translate([-pi_box_length/2,-pi_box_width/2 + pi_box_width/2 - 10,65])
      rotate([45,0,0])
      cube([20,40,20]);
      }}
      translate([-pi_box_length/2 ,-pi_box_width/2 + 6,120])
        cube([50,3,200],center = true);

      translate([0,0,pi_box_hight/2 + floor_hight])
        cube([pi_box_length-wall_width*2 + 0.001, pi_box_width-wall_width*2 + 0.001, pi_box_hight + 0.001] , center = true);
    
      translate([0,-10,pi_box_hight-3])
        cube([pi_box_length - wall_width*2,29.3333333333333,7],center = true);
    
        translate([pi_box_length/2-27.5,pi_box_width/2-15])  
          cube([usb_cutout_length/2+17.5,usb_cutout_width,usb_cutout_hight+20],center = true);
      
      }

      difference(){
      hull(){
      
      
        translate([0,pi_box_width/2 - 9,pi_box_hight])
          cube([pi_box_length,18,1],center = true);
    
    translate([-spacer_box_length - 16 ,pi_box_width/2 ,pi_box_hight-2])
          rotate([0,90,0])
    cylinder(h=pi_box_length,r = 0.005);
    
    }

    translate([0,pi_box_width/2 - 14,pi_box_hight-5])
        cube([pi_box_width/2+30,usb_cutout_width,usb_cutout_hight-0],center = true);
    
    }

}





pi_box();


translate([0,-pi_box_width/2 - spacer_box_width/2 -7 ,spacer_box_hight/2 - 20])
    rotate([0,90,270])
        atachment_notch(spacer_box_hight,spacer_box_width,spacer_box_length);
