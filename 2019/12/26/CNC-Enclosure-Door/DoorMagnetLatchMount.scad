
in_to_mm = 25.4;


W = 1 * in_to_mm;
L = 100; 
H = 6.35;


// #4 machine screw
Screw_4_40_MinorDia = 0.0849 * in_to_mm;
Screw_4_40_MajorDia = 0.011 * in_to_mm;
Screw_4_40_ScrewInDia = (Screw_4_40_MinorDia + Screw_4_40_MajorDia) /2; // Just enough to grab the plastic 

// 1/4-20 screw
ScrewHeadHeight = 3.7;
ScrewHeadDiameter = 15.0;
ScrewWidthSmooth = 6.7;
ScrewEdgeOffset = 3.5;

// Door latch magnet
DoorLatchMagnetMountHoleDistance = 70.0;
DoorLatch_L_Offset = (L - DoorLatchMagnetMountHoleDistance)/2;



union(){
        translate ([W/2,0,0]) {

        difference(){
            
            // Rounded edges
            cylinder (h = H, r=(W/2));
            translate ([0,-ScrewEdgeOffset,0]){
                cylinder (h = (H+1.0), r=(ScrewWidthSmooth/2));
                translate ([0,0,(H-ScrewHeadHeight)]) {
                    cylinder (h = (ScrewHeadHeight + 1.0), r=(ScrewHeadDiameter/2));
                }
            }
            }


        }
        translate ([W/2,L,0]) {
            difference(){
            cylinder (h = H, r=(W/2));
            translate ([0,ScrewEdgeOffset,0]){
                cylinder (h = (H+1.0), r=(ScrewWidthSmooth/2));
                translate ([0,0,(H-ScrewHeadHeight)]) {
                    cylinder (h = (ScrewHeadHeight + 1.0), r=(ScrewHeadDiameter/2));
                }
                }
            }
        }
            
    // Main rectangle body
    difference () {
        cube ([W,L,H]);
        
        //1/4-20 screw heads
        translate ([W/2,L,0]) {
            translate ([0,ScrewEdgeOffset,0]){
                 translate ([0,0,(H-ScrewHeadHeight)]) {
                        cylinder (h = (ScrewHeadHeight + 1.0), r=(ScrewHeadDiameter/2));
                    }
                }
        }
        
        translate ([W/2,0,0]) {
            translate ([0,-ScrewEdgeOffset,0]){
                translate ([0,0,(H-ScrewHeadHeight)]) {
                    cylinder (h = (ScrewHeadHeight + 1.0), r=(ScrewHeadDiameter/2));
                }
            }
        }
        
        // 4-40 screw mounting holes
        translate ([W/2,DoorLatch_L_Offset,0]) {
            cylinder (h = (H+1.0), r=(Screw_4_40_ScrewInDia/2));
        }
        
        translate ([W/2,L-DoorLatch_L_Offset,0]) {
            cylinder (h = (H+1.0), r=(Screw_4_40_ScrewInDia/2));
        }
        
        
        
    }
}