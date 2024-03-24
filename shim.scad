
// all units in mm 
mainWidth = 20;
mainLength = 70;
commonThickness = 3;

indentWidth = 7;
indent1Length = 20;
indent2Length = 25;

middleWasherRadius = 6;
middleWasherThickness = 1;
middleWasherSupportsThick = 1.5;
middleWasherHeight = 20;

sfn = 30;

// TK - corner rounding

difference() {
    translate([(indent2Length-indent1Length)/-2, 0,0]) cube([mainLength, mainWidth, commonThickness], center=true);
    indents();
}
translate([0,0,(middleWasherHeight + commonThickness)/2]) middleWasher();

module middleWasher() {
    difference() {
        cylinder(r = middleWasherRadius, h = middleWasherHeight, center = true);
        cylinder(r = middleWasherRadius - middleWasherThickness, h = middleWasherHeight * 2, center = true);
    }
    for(i = [1:6]) {
        rotate([0,0,i*60]) {
            translate([0, middleWasherRadius+middleWasherSupportsThick/4, 0]) {
                cube([middleWasherSupportsThick, middleWasherSupportsThick, middleWasherHeight], center=true);
            }
        }
    }
}




module indents() {
    translate([indent1Length/2+middleWasherRadius*1.5,0,0]) indent(indent1Length);
    translate([indent2Length/-2-middleWasherRadius*1.5, 0,0]) indent(indent2Length);
    
    
}

module indent(length) {
    // tk corner 
    cube([length, indentWidth, commonThickness*2], center=true);
}
