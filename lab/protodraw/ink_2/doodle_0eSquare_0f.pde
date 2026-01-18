doodle myDoodles[] = new doodle[3000];

pen myPen;
doodle myDoodle;
boolean reset=true;
int doodlePointer = 0;
boolean start = true;
int doodlesPointer = 0;
boolean inkOut = false;

InkPad redInk,greenInk,blueInk,mixInk, blackInk, whiteInk;
fillStatus inkBar;
color colorMix;
int inkX,inkY;
int i = 0;
int inkRemain;



void setup(){
  size (900,600);
  background(255);
  stroke(0);
  smooth();
  colorMix = color(255,0,0);  
  inkX=100;
  inkY=500;
  inkBar = new fillStatus(300,20,300,20,red(colorMix), green(colorMix), blue(colorMix));
  redInk = new InkPad(300,300,50,255,0,0);
  greenInk = new InkPad(300,300,50,0,255,0);
  blueInk = new InkPad(300,300,50,0,0,255);
  blackInk = new InkPad(300,300,50,0,0,0);
  whiteInk = new InkPad(300,300,50,255,255,255); 
  mixInk = new InkPad(300,300,50,red(colorMix), green(colorMix), blue(colorMix));
 
  
 
  redInk.centerX = inkX;
  redInk.centerY = inkY;
  
  greenInk.centerX = inkX;
  greenInk.centerY = inkY-200;
  
  blueInk.centerX = inkX;
  blueInk.centerY = inkY-400;
    
  mixInk.centerX = inkX+700;
  mixInk.centerY = inkY-400;
  
  blackInk.centerX = inkX+700;
  blackInk.centerY = inkY-200;
  
  whiteInk.centerX = inkX+700;
  whiteInk.centerY = inkY;
  
  inkBar.stat = 300;
  inkBar.display();
  redInk.display();
  greenInk.display();
  blueInk.display();
  mixInk.display(); 
  blackInk.display();
  whiteInk.display();
    
} // close setup

void draw(){

  if (doodlePointer > 0){
    //background(255);
    
    
    redInk.display();
    greenInk.display();
    blueInk.display();
    mixInk.r = red(colorMix);
    mixInk.g = green(colorMix);
    mixInk.b = blue(colorMix);
    inkBar.inkColor = colorMix;
    inkBar.display();
    mixInk.display();
    blackInk.display();
    whiteInk.display();   
  }
    
  if ( (redInk.inside()||greenInk.inside()||blueInk.inside()||mixInk.inside()||blackInk.inside()||whiteInk.inside() ) && 300-i < 300 ){ i = i - 4; inkBar.stat =  300-i;}
  else if(mousePressed && 300-i > 0) {i = i + 4; inkBar.stat = 300 - i;}
      
  if(  greenInk.inside() && (green(colorMix) < 255 && 300-i < 300) ) { 
    colorMix = color ( red(colorMix), green(colorMix) +2, blue(colorMix) ); 
  }
  if(  redInk.inside() && (red(colorMix) < 255 && 300-i < 300)) { 
    colorMix = color ( red(colorMix) +2, green(colorMix) , blue(colorMix) ); 
  } 
  if(  blueInk.inside() && (blue(colorMix) < 255 && 300-i < 300) ) { 
    colorMix = color ( red(colorMix), green(colorMix) , blue(colorMix) +2 ); 
  }
  if(  blackInk.inside() && 300-i < 300)  { 
    if (red(colorMix) > 0) colorMix = color ( red(colorMix) -2, green(colorMix) , blue(colorMix)  );
    if (green(colorMix) > 0) colorMix = color ( red(colorMix), green(colorMix) -2, blue(colorMix)  ); 
    if (blue(colorMix) > 0) colorMix = color ( red(colorMix), green(colorMix) , blue(colorMix) -2 );  
  }
  if(  whiteInk.inside() && 300-i < 300)  { 
    if (red(colorMix) < 255) colorMix = color ( red(colorMix) +2, green(colorMix) , blue(colorMix)  );
    if (green(colorMix) < 255) colorMix = color ( red(colorMix), green(colorMix) +2, blue(colorMix)  ); 
    if (blue(colorMix) < 255) colorMix = color ( red(colorMix), green(colorMix) , blue(colorMix) +2 );  
  }
  if(  greenInk.inside() && (green(colorMix) == 255 && 300-i  < 300 ) ) { 
    colorMix = color ( red(colorMix) -2, green(colorMix) , blue(colorMix) -2 ); 
  }
  if(  redInk.inside() && (red(colorMix) == 255 && 300-i < 300)) { 
    colorMix = color (red(colorMix) , green(colorMix) -2 , blue(colorMix) -2 ); 
  } 
  if(  blueInk.inside() && (blue(colorMix) == 255 && 300-i < 300)) { 
    colorMix = color ( red(colorMix) -2, green(colorMix) -2, blue(colorMix) ); 
  }   
  

  mixInk.r = red(colorMix);
  mixInk.g = green(colorMix);
  mixInk.b = blue(colorMix);
  
  //if ( (redInk.inside()||greenInk.inside()||blueInk.inside()||mixInk.inside()||blackInk.inside()||whiteInk.inside() ) && 300-i < 300){ inkBar.stat =  300-i;}
  inkBar.inkColor = colorMix;
  inkBar.display();
    
 
  redInk.display();
  greenInk.display();
  blueInk.display();
  mixInk.display();
  blackInk.display();
  whiteInk.display();  
  mixInk.display();
    
    
    
    
    
    
  if(mousePressed && 300 - i >= 0 ){
    if ( reset){

      reset=false;
      myDoodles[doodlesPointer]=new doodle();
    }
    
    // dirty solution to the bug... since i couldnt separate the out of ink and the create doodle actions properly
    // im just creating doodles that wont get drawn in case ink is out, thus avouding null pointer exception
    if(inkOut){
        myDoodles[doodlesPointer].mstroke[doodlePointer] = 0; // try 40 or 200 (have to make this dynamic)
        myDoodles[doodlesPointer].mcolor[doodlePointer] = color(0);
        myDoodles[doodlesPointer].mx[doodlePointer] = 0;
        myDoodles[doodlesPointer].my[doodlePointer] = 0;
        doodlePointer = doodlePointer+1;
      }
    // dirty solution finishes here 
    
    else{
      myDoodles[doodlesPointer].mstroke[doodlePointer] = doodlePointer % 10; // try 40 or 200 (have to make this dynamic)
      myDoodles[doodlesPointer].mcolor[doodlePointer] = colorMix;
      myDoodles[doodlesPointer].mx[doodlePointer] = mouseX;
      myDoodles[doodlesPointer].my[doodlePointer] = mouseY;
      doodlePointer = doodlePointer+1;
      //println (myDoodles[doodlesPointer].mx[0] + "," + myDoodles[doodlesPointer].my[0] ); // debug
    }
  }

  if ( doodlePointer > 0 ){ 
   
      
      //println(doodlesPointer + "," + doodlePointer + "," + myDoodles[doodlesPointer].mx[doodlePointer-1] + "," + myDoodles[doodlesPointer].my[doodlePointer-1]);
      //background(255);
      myDoodles[doodlesPointer].display();
     
    
  
     inkBar.display();
     redInk.display();
     greenInk.display();
     blueInk.display();
     mixInk.display();
     blackInk.display();
     whiteInk.display();  
    
  }
      if (i == 300)  inkOut = true; else inkOut = false;
      //println(inkOut);
} // closes draw
    
    
    
/******** global methods ********/   


void mousePressed(){start = true;}

    
void mouseReleased(){

  reset = true; 
  doodlePointer = 0;
  if ( 300 - i >= 0 )  doodlesPointer = doodlesPointer + 1;
  
  
  
}
      
boolean inside (int x, int y, int radius){
  //if (( sq(x + mouseX) + sq(y + mouseY) ) <= radius) // fix this calculation
  if ((mouseX > x - radius/2 && mouseY > y - radius/2) && (mouseX < x + radius/2 && mouseY< y + radius/2)){
    return (true);
  }
    else
      return(false);    
}

