include<notched_attachment.scad>;

wall_hight = 5;

stoper_hight = 32.5;

speaker_box_hight = 60; 
speaker_box_width = 90;
speaker_box_length = 195; 
//does not go to 116 or higher
spacer_box_hight = speaker_box_hight + 10;
//dont make this longer its a waist of filament.:
spacer_box_width = 20; //!
spacer_box_length = 25;

usb_cutout_hight = 50;
usb_cutout_width = 15;
usb_cutout_length = 55;

translate([0,0,-1]){
  translate([-speaker_box_length/2+15,-speaker_box_width/2 - 12,speaker_box_hight/2 - 13.5])
    rotate([0,90,270])
      atachment_notch(spacer_box_hight,spacer_box_width,spacer_box_length);
      
  translate([speaker_box_length/2-15,-speaker_box_width/2 - 12,speaker_box_hight/2 - 13.5])
    rotate([0,90,270])
      atachment_notch(spacer_box_hight,spacer_box_width,spacer_box_length);
difference(){
  union(){
  translate([0,0,37])
    cube([speaker_box_length,speaker_box_width-7,speaker_box_hight+11],center = true);
  
  }
  
  translate([0,0,speaker_box_hight/2+wall_hight*2+1])
    cube([speaker_box_length-5,speaker_box_width-wall_hight*2,speaker_box_hight+15],center = true);

  translate([0,-0,0])
  cylinder(d=20,$fn=256,h=20);
}
translate([0,speaker_box_width/2 - 12.5,speaker_box_hight/2+42.5])
      hull(){
      
      
        translate([0,speaker_box_width/2-45,speaker_box_hight/2-30])
          cube([speaker_box_length,18,1],center = true);
    
    translate([-speaker_box_length/2 ,speaker_box_width/2-37.5 ,speaker_box_hight/2-stoper_hight])
          rotate([0,90,0])
    cylinder(h=speaker_box_length,r = 0.005);
    
    }
difference(){
translate([-0,-speaker_box_width/2+5,20]){
rotate([90,0,0]){
cylinder(h=15,r=6);
    

translate([0,0,15])
cylinder(h=6,r=30);



}
}
translate([-50/2,-speaker_box_width/2-20,-10-.5])
cube([50,41,12]);
}
}