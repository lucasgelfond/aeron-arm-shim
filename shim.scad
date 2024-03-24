
// all units in mm 
mainWidth = 20;
mainLength = 70;
commonThickness = 3;

wingWidth = 15;

indentWidth = 7;
indent1Length = 20;
indent2Length = 25;
indentRadius = 1;

middleWasherRadius = 6;
middleWasherThickness = 1;
middleWasherSupportsThick = 1.5;
middleWasherHeight = 20;

sfn = 30;

// TK - corner rounding

module main() {
     difference() {
        translate([(indent2Length-indent1Length)/-2, 0,0]) cube([mainLength, mainWidth, commonThickness], center=true);
        indents();
    }
    translate([0,0,(middleWasherHeight + commonThickness)/2]) middleWasher();
    wings();
}


module wing() {
    difference() {
        cube([mainLength, wingWidth, commonThickness], center = true);
        for(i = [-1,1]) {
            // these values are vibes / more art than science; clearly a more complex curve in the original CAD that's not worth mocking up
            translate([(mainLength+wingWidth*1.25)/2*i,(wingWidth/-2.7),0]) cylinder(r = wingWidth, h = commonThickness*2, $fn=sfn, center=true);
        }
    }
}

module wings() {
    translate([commonThickness/-1.25,(mainWidth-commonThickness)/-2, commonThickness/4.5]) rotate([60, 0,0]) translate([0,(wingWidth)/-2,0]) wing();
     translate([commonThickness/-1.25,(mainWidth-commonThickness)/2,commonThickness/4.5]) rotate([120, 0,0]) translate([0,wingWidth/-2,0]) wing();
}

main();


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
    // still not really the picture but seems ok 
    minkowski() {
        cube([length, indentWidth, commonThickness*2], center=true);
        cylinder(r = indentRadius, h=commonThickness*2, center=true, $fn = sfn);
    }
}
