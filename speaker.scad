
notch_mating_gap = 0.0;

notch_rim_radius = 5 + notch_mating_gap;
notch_rim_height = 2 + notch_mating_gap;

notch_tip_length = 20 + notch_mating_gap;
notch_tip_width = 4 + notch_mating_gap;
notch_tip_height = 6 + notch_mating_gap;

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
    translate([-15,0,magnet_hight-2])
    cube([magnet_length+45,magnet_width+2,magnet_hight*2],center = true);
    }
    union(){
    translate([0,-0,magnet_hight+.5])
    cube([magnet_length*30,magnet_width,magnet_hight*2],center = true);
    
    }
    }
}
translate([0,-50,30])
rotate([0,90,270])
notch();

difference(){

difference(){

translate([0,-45,40])
cube([55,40,80],center = true);

translate([0,-39,42.5])
cube([51,48,80],center = true);
    
translate([0,-65,30])
cube([magnet_hight,magnet_width,magnet_length], center = true);
}

}
difference(){
translate([0,0,40])
cube([185,55,80],center = true);

translate([0,0,46])
cube([183,53,74],center = true);
}









