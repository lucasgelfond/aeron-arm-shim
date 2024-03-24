
// all units in mm 
mainWidth = 20;
mainLength = 70;
commonThickness = 3;

indentWidth = 7;
indent1Length = 20;
indent2Length = 25;




// TK - corner rounding

difference() {
    cube([mainLength, mainWidth, commonThickness], center=true);
    indents();
}





module indents() {
    
}

module indent(length) {
    // tk corner rounding
    cube([length, indentWidth, commonThickness*2], center=true);
}
