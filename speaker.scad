include<notched_attachment.scad>;

stoper_hight = 32.5;

speaker_box_hight = 60; 
speaker_box_width = 70;
speaker_box_length = 195; 
//does not go to 116 or higher
spacer_box_hight = speaker_box_hight + 10;
//dont make this longer its a waist of filament.:
spacer_box_width = 20; //!
spacer_box_length = 25;

usb_cutout_hight = 50;
usb_cutout_width = 15;
usb_cutout_length = 55;


  translate([-speaker_box_length/2+15,-speaker_box_width/2 - 10,speaker_box_hight/2 - 13])
    rotate([0,90,270])
      atachment_notch(spacer_box_hight,spacer_box_width,spacer_box_length);
      
  translate([speaker_box_length/2-15,-speaker_box_width/2 - 10,speaker_box_hight/2 - 13])
    rotate([0,90,270])
      atachment_notch(spacer_box_hight,spacer_box_width,spacer_box_length);
difference(){
  union(){
  translate([0,0,37])
    cube([speaker_box_length,speaker_box_width-7,speaker_box_hight+11],center = true);
  
  }
  
  translate([0,0,45])
    cube([speaker_box_length-5,speaker_box_width-15,speaker_box_hight],center = true);

  translate([0,-0,0])
  cylinder(d=20,$fn=256,h=20);
}
translate([0,speaker_box_width/2 - 3.5,speaker_box_hight/2+42.5])
      hull(){
      
      
        translate([0,speaker_box_width/2-45,speaker_box_hight/2-30])
          cube([speaker_box_length,18,1],center = true);
    
    translate([-speaker_box_length/2 ,speaker_box_width/2-37.5 ,speaker_box_hight/2-stoper_hight])
          rotate([0,90,0])
    cylinder(h=speaker_box_length,r = 0.005);
    
    }
difference(){
translate([-0,-speaker_box_width/2+3,7]){
rotate([90,0,0]){
cylinder(h=15,r=6);
    

translate([0,0,15])
cylinder(h=6,r=15);



}
}
translate([-29/2,-speaker_box_width/2-20,-8])
cube([29,29,10]);
}