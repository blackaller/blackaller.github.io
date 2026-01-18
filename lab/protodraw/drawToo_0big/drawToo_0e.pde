import candy.*;

// us this are
//import java.util.*;

import svgimport.*;
import prosvg.*;
import proxml.*;

int num = 10000;
//float mx[] = new float[num];
//float my[] = new float[num];
Vector mx = new Vector();
Vector my = new Vector();



int i=0;
int r = 20, g = 200, b = 200;
PFont font;
int strokew = 1;
//svgpath loaded;


Canvas paper;
Actions active;
ColorPalette palette;

void setup(){
   size(920,700,"prosvg.SVGOut");
   //framerate(30);//this stops svg from being saved
   //background(205);
   background(#DDDDCC);
   font = loadFont("Monaco-12.vlw");
   //smooth();
  
  
     
   paper = new Canvas();
   active = new Actions();
   palette = new ColorPalette();
   paper.paperColor(240);
   paper.displayCanvas(40,60);
   //active.displayActions(60,30);
   palette.displayColorPalette(660,60);
   //loaded = new svgpath("test.svg",this);
   strokeWeight(1); 

 }



void draw() {
  smooth();
  //loaded.draw(LINE_STRIP,100,200);
  //stroke(255,20,20);
  stroke(r,g,b);
  fill(0);
  strokeWeight(strokew); 
  
  if(mousePressed) {
   
    
    //mx.addElement(mouseX) ; 
    //my.addElement(mouseY) ;
    
    line(mouseX, mouseY, pmouseX, pmouseY);
    
    for(int j = 0; j <=  i; j = j + 1){
      //print(mx[j] + ", "+ my[j]);
    }
    //print("\n");
    i=i+1;
    //println(i +": "+ mouseX + ", " + mouseY + ", " +  pmouseX + ", " +  pmouseY);
   
  }
  
 
  
  
  //mouseReleased();
  
  if(keyPressed){
  
    if (key == 's'){
      saveFrame("test.svg");
    }
    if (key == 'c'){
      clear();
    }
     if (key == 'q'){
      r =255;g =20;b =20;
    }
     if (key == 'w'){
      r =20;g =200;b =200;
    }
     if (key == 'e'){
      r =0;g =0;b =0;
    }
     if (key == 'r'){
      r = 255;g = 255;b = 255;
    }
    
    if (key == '1'){
        noSmooth();
        strokeWeight(1);
       paper.paperColor(240);
       paper.displayCanvas(40,60);
       //active.displayActions(60,30);
    }
     if (key == '2'){
       noSmooth();
       strokeWeight(1);
       paper.paperColor(180);
       paper.displayCanvas(40,60);
       //active.displayActions(60,30);
    }
     if (key == '3'){
       noSmooth();
       strokeWeight(1);
        paper.paperColor(120);
       paper.displayCanvas(40,60);
       //active.displayActions(60,30);
    }
     if (key == '4'){
       noSmooth();
       strokeWeight(1);
       paper.paperColor(20);
       paper.displayCanvas(40,60);
       //active.displayActions(60,30);
    }
    
     
  }



  
}



void mouseReleased() {
  i=0;

}


void keyReleased(){
 if ((key == 'b') && (strokew < 20)){
 
  
        strokew = strokew+3;
        strokeWeight(strokew);
    
    
    }
    
    if ((key == 'v') && (strokew > 1)){
      strokew = strokew-3;
      strokeWeight(strokew);
    } 
  
  
 }



void clear() {
   
   noSmooth();
   strokeWeight(1);
   paper.displayCanvas(40,60);
   //active.displayActions(60,30);
}





