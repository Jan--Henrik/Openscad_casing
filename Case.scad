//casing_full(caselenght,casedepth,caseheight,thickness,cutdepthtmp,cutheighthtmp)
casing_full(250,120,150,10,5,5);
//in mm

module casing_full(caselenght,casedepth,caseheight,thickness,cutdepthtmp,cutheighthtmp){
translate([0,0,thickness])
rotate([0,180,0])
casing(caselenght,casedepth,thickness,1,cutdepthtmp,cutheighthtmp); //Boden

translate([0,0,caseheight-thickness])
rotate([0,0,0])
casing(caselenght,casedepth,thickness,1,cutdepthtmp,cutheighthtmp); //Decke

translate([-caselenght/2+thickness,0,caseheight/2])
rotate([0,-90,0])
casing(caseheight,casedepth,thickness,1,cutdepthtmp,cutheighthtmp); //rechts

translate([caselenght/2-thickness,0,caseheight/2])
rotate([0,90,0])
casing(caseheight,casedepth,thickness,1,cutdepthtmp,cutheighthtmp); //rechts

echo("Interior Height ", caseheight-thickness*2, " Interior Lenght", caselenght-thickness*2, " Interior depht", casedepth-26);
echo("Exterior Height ", caseheight, " Exterior Lenght", caselenght, " Depth", casedepth);
echo("Frontplate Dimensions: Height ", caseheight-thickness*2+cutdepthtmp*2, " Lenght", caselenght-thickness*2+cutdepthtmp*2, " Thickness", cutheighthtmp);
echo("All dimensions are shown in mm");
}

module casing (lenght,depth,height,cut,cutdepth,cutheight){
	difference(){
		union(){
		translate([-lenght/2,-depth/2,0])
		cube([lenght,depth,height],center = false); //Basisplatte
		}
	union(){
		translate([lenght/2-height,-depth/2,0])
		rotate([0,45,0])
		translate([0,0,0])
		cube([height,depth,height*1.50],center = false); //Winkel Rechts

		mirror([1,0,0])
		translate([lenght/2-height,-depth/2,0])
		rotate([0,45,0])
		translate([0,0,0])
		cube([height,depth,height*1.50],center = false); //Winkel Links

		translate([0,depth/2-13,cutdepth/2])
		#cube([lenght*cut,cutheight*cut,cutdepth*cut],center = true);
		translate([0,-depth/2+13,cutdepth/2])
		#cube([lenght*cut,cutheight*cut,cutdepth*cut],center = true);
		}
	}
}
