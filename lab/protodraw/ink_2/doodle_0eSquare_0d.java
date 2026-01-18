import processing.core.*; import java.applet.*; import java.awt.*; import java.awt.image.*; import java.awt.event.*; import java.io.*; import java.net.*; import java.text.*; import java.util.*; import java.util.zip.*; public class doodle_0eSquare_0d extends PApplet {doodle myDoodles[] = new doodle[3000];

pen myPen;
doodle myDoodle;
boolean reset=true;
int doodlePointer = 0;
boolean start = true;
int doodlesPointer = 0;
boolean inkOut = false;

InkPad redInk,greenInk,blueInk,mixInk, blackInk, whiteInk;
fillStatus inkBar;
int colorMix;
int inkX,inkY;
int i = 0;
int inkRemain;



public void setup(){
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

public void draw(){

  if (doodlePointer > 0){
    background(255);
    
    
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
    for (int i=0; i<= doodlesPointer; i = i + 1){
      //println(doodlesPointer + "," + doodlePointer + "," + myDoodles[doodlesPointer].mx[doodlePointer-1] + "," + myDoodles[doodlesPointer].my[doodlePointer-1]);
      myDoodles[i].display();
     
    }
  
     inkBar.display();
     redInk.display();
     greenInk.display();
     blueInk.display();
     mixInk.display();
     blackInk.display();
     whiteInk.display();  
    
  }
      if (i == 300)  inkOut = true; else inkOut = false;
      println(inkOut);
} // closes draw
    
    
    
/******** global methods ********/   


public void mousePressed(){start = true;}

    
public void mouseReleased(){

  reset = true; 
  doodlePointer = 0;
  if ( 300 - i >= 0 )  doodlesPointer = doodlesPointer + 1;
  
  
  
}
      
public boolean inside (int x, int y, int radius){
  //if (( sq(x + mouseX) + sq(y + mouseY) ) <= radius) // fix this calculation
  if ((mouseX > x - radius/2 && mouseY > y - radius/2) && (mouseX < x + radius/2 && mouseY< y + radius/2)){
    return (true);
  }
    else
      return(false);    
}


class InkPad{
  int centerX;
  int centerY;
  int radius;
  float r, g, b;
    
  InkPad(int x, int y, int rad, float R, float G, float B){
     centerX=x;
     centerY=y;
     radius=rad;
     r=R; 
     g=G;
     b=B;
  }
    

  public boolean inside (){
    //if (( sq(x + mouseX) + sq(y + mouseY) ) <= radius) // this formula needs to get done
    if ((mouseX > centerX - radius && mouseY > centerY - radius) && (mouseX < centerX + radius && mouseY< centerY + radius)){
      return (true);
    }
    else
      return(false);
  }
    
  public void display(){
  int inkColor = color(r, g, b);   
  fill(inkColor); 
  stroke(0);
  strokeWeight(6);
  //ellipseMode(CENTER_RADIUS);
  //ellipse(centerX, centerY, radius, radius);
  rectMode(CENTER_RADIUS);
  rect(centerX, centerY, radius, radius);
  }
}

class doodle{
  int num = 10000;
  float mx[] = new float[num];
  float my[] = new float[num];
  int mstroke[] = new int[num];
  int mcolor[] = new int[num];
  
  doodle(){
  }

  public void display(){
    for(int i=0; i<num-1; i++) {
      strokeWeight(mstroke[i]);
      stroke(mcolor[i]);
      if (mx[i] > 0 && my[i] > 0 && mx[i+1] > 0 && my[i+1] > 0)line(mx[i],my[i],mx[i+1],my[i+1]);
    }
  }
}

class drawing{
}

class fillStatus{ 
  int cornerX;
  int cornerY;
  int lengthX;
  int lengthY;
  int stat;  
  float r, g, b;
  int inkColor = color(r, g, b); 
  
  
  fillStatus(int x, int y, int lenX, int lenY, float R, float G, float B){
     cornerX=x;
     cornerY=y;
     lengthX=lenX;
     lengthY=lenY;
     r=R; 
     g=G;
     b=B;
     inkColor = color(r, g, b); 
     
  }
  
  public void display(){
  
  

  stroke(0);
  strokeWeight(6);
  fill(255);
  rectMode(CORNER);
  rect(cornerX, cornerY, lengthX, lengthY);

  fill(inkColor); 
  rect(cornerX, cornerY, stat, lengthY);
  
  

  }
  
  
 
  
  
  
  
}

class pen{ 
  //not workin
  pen(){}
  public void display(int i, int inkColor){
     
      
      translate(mouseX,mouseY);
      if(mouseX>0 && mouseY>0){
        rotate(-3*PI/4);
  
        stroke(0); 
        strokeWeight(6); 
        fill(255);
        rect(0,0,20,200); 

        fill(inkColor);
        rect(0,0,20,190-i);
      }
    
 }
  
  
  
  
}
static public void main(String args[]) {   PApplet.main(new String[] { "doodle_0eSquare_0d" });}}