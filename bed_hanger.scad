
module spacer () {
  cylinder(r=33.25 , h=20 , $fn = 200);
}
module mating_surface(){
  cube([66.5,66.5,7.5],center = true);
}


module slider (){
  cube([66.5,100,7.5],center = true);
}
module atachment_nub (){
  hull(){
  cylinder(r=2.5 , $fn = 8);
  translate([7,0,0])
  cylinder(r=2.5 , $fn = 8);
  translate([3.5,-0,-2])
  cube([7,3,0.05], center = true);
  }
}
translate([-3.5,0,-1])
atachment_nub();

translate([0,0,27.5])
slider ();

translate([0,0,3.25])
mating_surface();

translate([0,0,7])
spacer();