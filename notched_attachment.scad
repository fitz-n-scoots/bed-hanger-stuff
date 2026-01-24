/*
//does not go to 116 or higher
sb_hight = 80; 
//dont make this longer its a waist of filament.:
sb_width = 40;
sb_length = 55;*/

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

module spacing_box (sb_hight = 80,sb_width = 40,sb_length = 55
){
    
    difference(){
        translate([0,0,sb_hight/2])
            cube([sb_length,
                  sb_width,
                  sb_hight],center = true);
    union(){
        translate([0,-40,30])
           rotate([0,90,270])
               translate([-15,0,magnet_hight-2])
                   magnet();
        
        translate([0,-sb_width/2 + magnet_width*2 -2, sb_hight/10 +25])
             rotate([0,0,270])
                 translate([5.5,0,magnet_hight+10])
        
                     cube([magnet_width*2 -3,magnet_width+2,sb_hight ],center = true);
            
        translate([0,-sb_width/2 +2,25])
            cube([magnet_hight,magnet_width,magnet_length], center = true);
        
        }
    }


}


module atachment_notch(sb_hight = 80,sb_width = 40,sb_length = 55, 
) {
  
  translate([sb_hight/2-20,0,-7])  
      rotate([-90,0,90])  
          spacing_box(sb_hight,sb_width,sb_length);
    
  hull(){
    translate([sb_hight/2 - 45,0,sb_width/2 - 7]){
      translate([notch_tip_length/2, 0, notch_rim_height/2]) rotate([0, 0, 360/16])
        cylinder(h = notch_rim_height, r = notch_rim_radius / cos(360/16), $fn = 8, center = true);
      translate([notch_tip_length/-2, 0, notch_rim_height/2]) rotate([0, 0, 360/16])
        cylinder(h = notch_rim_height, r = notch_rim_radius / cos(360/16), $fn = 8, center = true);
      translate([0, 0, notch_tip_height/2])
        cube([notch_tip_length, notch_tip_width, notch_tip_height], center = true);
        
    }
}
 
        translate([-sb_hight/2 - 17.5,4.5,sb_width/2 - 17])
            rotate([90,0,0])
                cylinder(r=1 , h= 9 , $fn = 200);
    
    difference(){
    
        
    
      translate([-20,0,sb_width/2 - 15])
        cube([sb_hight,magnet_width+2,magnet_hight*2],center = true);
    
      translate([0,-0,sb_width/2 - 16])
        cube([magnet_length*300,magnet_width,magnet_hight*2],center = true);
    
    }
    }


/*
atachment_notch (sb_hight = 90,sb_width = 40,sb_length = 55
);
//*/