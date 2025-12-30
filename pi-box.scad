difference(){
translate([0,0,25+25+10])
cube([70,50,120],center = true);
    
translate([0,0,25+25+15])
cube([70-5,50-5,110],center = true);
}
difference(){

translate([0,-50,40])
cube([55,50,80],center = true);

translate([0,-49,42.5])
cube([51,48,80],center = true);
}