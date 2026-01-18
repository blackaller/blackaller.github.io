import processing.core.*; import java.applet.*; import java.awt.*; import java.awt.image.*; import java.awt.event.*; import java.io.*; import java.net.*; import java.text.*; import java.util.*; import java.util.zip.*; public class drawToo_0eSmall extends PApplet {int num = 10000;
//float mx[] = new float[num];
//float my[] = new float[num];


int i=0;
int r = 20, g = 200, b = 200;
PFont font;
int strokew = 1;



Canvas paper;
Actions active;
ColorPalette palette;

public void setup(){
   size(720,500);
   framerate(30);

   background(0xffDDDDCC);
   font = loadFont("Monaco-12.vlw");

  
  
     
   paper = new Canvas();
   active = new Actions();
   palette = new ColorPalette();
   paper.paperColor(240);
   paper.displayCanvas(40,60);
   //active.displayActions(60,30);
   palette.displayColorPalette(460,60);
   //loaded = new svgpath("test.svg",this);
   strokeWeight(1); 

 }



public void draw() {
  smooth();

  stroke(r,g,b);
  fill(0);
  strokeWeight(strokew); 
  
  if(mousePressed) {

    line(mouseX, mouseY, pmouseX, pmouseY);
    
    for(int j = 0; j <=  i; j = j + 1){
    //print(mx[j] + ", "+ my[j]);
    }
    //print("\n");
    i=i+1;
    //println(i +": "+ mouseX + ", " + mouseY + ", " +  pmouseX + ", " +  pmouseY);
   
  }

  
  if(keyPressed){
  
    if (key == 's'){
      saveFrame("test.svg");
    }
    //if (key == 'c'){
      //clear();
    //}
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
       
        strokeWeight(1);
         background(0xffDDDDCC);
       palette.displayColorPalette(460,60); 
        noSmooth();
       paper.paperColor(240);
       paper.displayCanvas(40,60);
       //active.displayActions(60,30);
    }
     if (key == '2'){
       
       strokeWeight(1);
        background(0xffDDDDCC);
       palette.displayColorPalette(460,60);
        noSmooth();
       
       paper.paperColor(180);
       paper.displayCanvas(40,60);
       //active.displayActions(60,30);
    }
     if (key == '3'){
       noSmooth();
       strokeWeight(1);
        background(0xffDDDDCC);
       palette.displayColorPalette(460,60);
        noSmooth();
       paper.paperColor(120);
       paper.displayCanvas(40,60);
       //active.displayActions(60,30);
    }
     if (key == '4'){
       noSmooth();
       strokeWeight(1);
        background(0xffDDDDCC);
       palette.displayColorPalette(460,60);
        noSmooth();
       paper.paperColor(20);
       paper.displayCanvas(40,60);
       //active.displayActions(60,30);
    }
    
     
  }



  
}



public void mouseReleased() {
  i=0;

}


public void keyReleased(){
 if ((key == 'b') && (strokew < 20)){
 
  
        strokew = strokew+3;
        strokeWeight(strokew);
    
    
    }
    
    if ((key == 'v') && (strokew > 1)){
      strokew = strokew-3;
      strokeWeight(strokew);
    } 
  
  
 }



public void clear() {
   
   noSmooth();
   strokeWeight(1);
   paper.displayCanvas(40,60);
   //active.displayActions(60,30);
}






//mouse listener methods for all classes


class Actions{
  int posX, posY;
  String loader, saver; 
  
  Actions(){
    posX=60;
    posY=30;
    loader = "load";
    saver = "save";
    }
    
    
   public void loads(){} 
    
   public void saves(){} 
   
   

    
  //boolean onLoad(){ return true;}
  
  //boolean onSave(){return true;}
  
  
  public void displayActions(){
      fill(255);
      stroke(0);
      rect(posX, posY, 40, 40);
     rect(posX+60, posY, 40, 40);
      noStroke();
      fill(0); 
      textFont(font, 12);
      text(loader, posX+5, posY+23);
      text(saver, posX+66, posY+23);
  
  }
  
  
    public void displayActions(int x, int y){
      posX = x;
      posY = y;
      fill(255);
      stroke(0);
      rect(posX, posY, 40, 40);
      rect(posX+60, posY, 40, 40);
      noStroke();
      fill(0); 
      textFont(font, 12);
      text(loader, posX+5, posY+23);
      text(saver, posX+66, posY+23);
  
  }
  
  public void updateActions(){}
  
 
  
  
}


  
  
  
  class Canvas{
  int posX, posY;
  int canvasColor;

  
 Canvas(){
   

    }
    
    public void paperColor(){
      canvasColor = 255;
      }

   public void paperColor(int x){
     canvasColor = x;
     }


  
  public void displayCanvas(int x, int y){
      posX=x;
      posY=y;
      strokeWeight(1);
      stroke(0);
      fill(canvasColor);
      rect(posX, posY, 400, 400);
      noStroke();
      noFill(); 
      
  
  }
  
  public void updateActions(){}
  
 
  
  
}


  
  
  
  class ColorPalette{
  int posX, posY;

  
  ColorPalette(){
   

    }
    
    


  
  public void displayColorPalette(int x, int y){
       posX=x;
      posY=y;
      
      
      
      textFont(font, 12);
      fill(0);
      
      
      text("the mouse is your pencil / the keyboard is your piano", 50, posY-12);
      
      
      
      text("keys for color", posX+13, posY-12);
      
      noFill();
      strokeWeight(2);
      stroke(255,20,20);
      rect(posX, posY, 40, 40);
      stroke(20,200,200);
      rect(posX+60, posY, 40, 40);
      stroke(0);
      rect(posX+120, posY, 40, 40);
      stroke(255);
      rect(posX+180, posY, 40, 40);
      
      
      
      textFont(font, 24);
      fill(0);
      text("q", posX+13, posY+27);
      text("w", posX+74, posY+27);
      fill(0);
      text("e", posX+133, posY+27);
      fill(0);
      text("r", posX+194, posY+27);
      
      
      
      
      
      
      
      
      
      
      
      textFont(font, 12);
      fill(0);
      text("keys for clear / paper color", posX+13, posY+118);
      
      
      //noStroke();
      fill(240);
      noStroke();
      rect(posX, posY+130, 40, 40);
      fill(180);
      rect(posX+60, posY+130, 40, 40);
      fill(120);
      rect(posX+120, posY+130, 40, 40);
      fill(20);
       rect(posX+180, posY+130, 40, 40);
      
      
      
      textFont(font, 24);
      fill(0);
      text("1", posX+13, posY+159);
      text("2", posX+74, posY+159);
      fill(0);
      text("3", posX+133, posY+159);
      fill(255);
      text("4", posX+194, posY+159);
      
      
      
      
      
      
      
      
      
      
      textFont(font, 12);
      fill(0);
      text("keys for stroke weight", posX+13, posY+242);
      
      noFill();
      stroke(0);
      strokeWeight(1);
      //rect(posX, posY+140, 40, 40);
      strokeWeight(12);
      //rect(posX+180, posY+140, 40, 40);
      
      textFont(font, 24);
      fill(0);
      text("v", posX+13, posY+273);

      text("b", posX+194, posY+273);
      
        textFont(font, 12);
      text("<", posX+74, posY+270);

      text(">", posX+133, posY+270);
      
      strokeWeight(1);
      line(posX,posY+290,posX+60,posY+290);
      
      strokeWeight(3);
      line(posX+60,posY+290,posX+120,posY+290);
      strokeWeight(6);
      line(posX+120,posY+290,posX+170,posY+290);
       strokeWeight(10);
      line(posX+170,posY+290,posX+220,posY+290);
      
      
      
      //text("clear / set background", posX+13, posY+197);
      
      
      
      
      
      
      
      noStroke();
      fill(0); 
      
  
  }
  
  public void updateActions(){}
  
 
  
  
}

  
  

class Shape{
  Shape(){}
  
  }

class Tools{
  Tools(){}
  
  }
}