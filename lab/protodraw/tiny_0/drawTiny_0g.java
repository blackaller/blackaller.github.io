import processing.core.*; import java.net.HttpURLConnection; import java.applet.*; import java.awt.*; import java.awt.image.*; import java.awt.event.*; import java.io.*; import java.net.*; import java.text.*; import java.util.*; import java.util.zip.*; public class drawTiny_0g extends PApplet {



int num = 10000;
int i=0;
int r = 0, g = 0, b = 0;
PFont font;
int strokew = 1;
boolean elgrid = true;
Canvas paper;
Palette palette;
Icon iconito;

public void setup(){
   size(470,440);
   //framerate(30);//this stops svg from being saved
   background(0xffDDDDCC);
   font = loadFont("Monaco-12.vlw");
   iconito = new Icon();
   paper = new Canvas();
   palette = new Palette();
   paper.paperColor(255);
   paper.displayCanvas(40,60);
   palette.displayPalette(360,60);
   strokeWeight(1); 
 }



public void draw() {
  
  stroke(0);
  if (iconito.paint) fill(0);
  else fill(255);
  rect (180,400,40,20);
  noStroke();
  
  if(mousePressed) {
    noStroke();
    fill(r,g,b);
    iconito.update(paper.inCanvas(mouseX, mouseY) && paper.inCanvas(pmouseX, pmouseY));
  }
    //this should happen only if the corresponding cell is clear
    
    /*if (paper.inCanvas(mouseX, mouseY) && paper.inCanvas(pmouseX, pmouseY)){
      int resX, resY, nuX, nuY;
      resX = mouseX % 20;
      resY = mouseY % 20;
      rect(mouseX-resX,mouseY-resY,20,20);  }*/
    iconito.display();
    iconito.displayThumb();
    
    noSmooth();paper.displayMargin(40,60);

    if (elgrid) paper.displayGrid(40,60);
  
    if(keyPressed){
      if (key == ' '){
         
         iconito.clear();
      
         strokeWeight(1);
         background(0xffDDDDCC);
         palette.displayPalette(360,60); 
         noSmooth();
         paper.paperColor(255);
         paper.displayCanvas(40,60);
          if (elgrid) paper.displayGrid(40,60);
         stroke(0);
         if (iconito.paint) fill(0);
         else fill(255);
         rect (180,400,40,20);
         noStroke();
       }
       
       
    }

}



public void mouseReleased() {
  i=0;

}


public void keyReleased(){
  
  
  if(key =='g'){
    
         elgrid = !elgrid;
         background(0xffDDDDCC);
         palette.displayPalette(360,60); 
         noSmooth();
         paper.paperColor(255);
         paper.displayCanvas(40,60);
         iconito.display();
         iconito.displayThumb();
         if (elgrid) paper.displayGrid(40,60);
         noSmooth();paper.displayMargin(40,60);
         stroke(0);
         if (iconito.paint) fill(0);
         else fill(255);
         rect (180,400,40,20);
         noStroke();
   }
         
   if (key == 'c')iconito.paint=!iconito.paint; println(iconito.paint);
   
   if(key =='p'){iconito.iconPrint();

   
   
   }
  
 }



public void clear() {
   
   noSmooth();
   strokeWeight(1);
   paper.displayCanvas(40,60);
  

}







  
  
  
  class Canvas{
  int canvasSize = 13;
  int cellSize = 20;  
  int posX, posY;
  int canvasColor;
  int sizeCanvas = cellSize * canvasSize; 
  
 Canvas(){
    }
    
    public void paperColor(){
      canvasColor = 255;
      }

   public void paperColor(int x){
     canvasColor = x;
     }

    
  //boolean onLoad(){ return true;}
  
  //boolean onSave(){return true;}
  
  
  public void displayCanvas(int x, int y){
      posX=x;
      posY=y;
      strokeWeight(1);
      stroke(0);
      //noStroke();
      fill(canvasColor);
      rect(posX, posY, sizeCanvas, sizeCanvas);
      stroke(20,200,200);
      /*for (int i = 1; i < canvasSize; i = i+1){
        line(posX, posY+cellSize*i, posX+sizeCanvas, posY+cellSize*i);
        line(posX+cellSize*i, posY, posX+cellSize*i, posY+sizeCanvas);
        
        
        }*/
        
        
        
        
      /*  
      noStroke();
      fill(canvasColor);
     
      
      
      rect(340, 60, 13, 13);
      rect(340, 90, 26, 26);
      rect(340, 140, 52, 52);   
      rect(340, 220, 91, 91); */ 
        
        
        
        
        
        
        
 
        
      noStroke();
      noFill(); 
      
  
  }
  
  
  
   public void displayMargin(int x, int y){
      posX=x;
      posY=y;
      strokeWeight(1);
      stroke(0);
      noFill();
      rect(posX, posY, sizeCanvas, sizeCanvas);
      noStroke();
      noFill(); 
      
  
  }
  
    public void displayGrid(int x, int y){
      posX=x;
      posY=y;
      strokeWeight(1);
      stroke(20,200,200);
      for (int i = 1; i < canvasSize; i = i+1){
        line(posX, posY+cellSize*i, posX+sizeCanvas, posY+cellSize*i);
        line(posX+cellSize*i, posY, posX+cellSize*i, posY+sizeCanvas);
        
        
        }
      noStroke();
      noFill(); 
      
  
  }
  
  
  
  
  
  
  
  public void updateActions(){}
  
    public boolean inCanvas(int x, int y){
    //if ( posX <= x - (cellSize/2) && x + (cellSize/2) <= posX + sizeCanvas && posY  <= y - (cellSize/2) && y + (cellSize/2) <= posY + sizeCanvas) return true;
    if ( posX <= x  && x < posX + sizeCanvas && posY  <= y  &&  y  < posY + sizeCanvas) return true;
    else return false;
    
    
    }
  
 
  
  
}

class Icon{
  int posX =  40;
  int posY =  60;
  int iconSize = 13;
  int cellSize = 20;
  boolean paint = true;
  boolean iconArray[] = new boolean[ iconSize * iconSize ];
  String iconString = new String();
  
  
  Icon(){
    for (int i = 0; i < ( iconSize * iconSize ); i = i+1){     
      iconArray[i] = false;
      
    }
  }
  
  public void update( boolean overCell){
    
    if (overCell){

      if (paint)iconArray[    ( iconSize * ( (mouseY - posY ) / cellSize) ) + floor((mouseX - posX ) / cellSize)    ] = true;
      else iconArray[    ( iconSize * ( (mouseY - posY ) / cellSize) ) + floor((mouseX - posX ) / cellSize)    ] = false;
    }
    
    }
  
  public void display(){
     posX =  40;
     posY =  60;
 
     cellSize = 20;    
    
     for (int i = 0; i < ( iconSize * iconSize ); i = i+1){     
      

      if (iconArray[i] == false)  {fill(255);
      rect(posX + (i * cellSize) % (iconSize * cellSize), posY + cellSize * floor(i/iconSize ), cellSize, cellSize);
      }
      else{ fill(0);
      
     rect(posX + (i * cellSize) % (iconSize * cellSize), posY + cellSize * floor(i/iconSize ), cellSize, cellSize);}
      
    }
   }
   
   
    public void displayThumb(){
       posX =  340;
       posY =  60;
       cellSize = 1;
      
      
     for (int i = 0; i < ( iconSize * iconSize ); i = i+1){     
      

      if (iconArray[i] == false)  {fill(0xffDDDDCC);
      rect(posX + (i * cellSize) % (iconSize * cellSize), posY + cellSize * floor(i/iconSize ), cellSize, cellSize);
      }
      else{ fill(0);
      
     rect(posX + (i * cellSize) % (iconSize * cellSize), posY + cellSize * floor(i/iconSize ), cellSize, cellSize);}
      
    }
    
    
    
     
       posY =  90;
       cellSize = 2;
      
      
     for (int i = 0; i < ( iconSize * iconSize ); i = i+1){     
      

      if (iconArray[i] == false)  {fill(0xffDDDDCC);
      rect(posX + (i * cellSize) % (iconSize * cellSize), posY + cellSize * floor(i/iconSize ), cellSize, cellSize);
      }
      else{ fill(0);
      
     rect(posX + (i * cellSize) % (iconSize * cellSize), posY + cellSize * floor(i/iconSize ), cellSize, cellSize);}
      
    }
      
      
      
      
      
       
       posY =  140;
       cellSize = 4;
      
      
     for (int i = 0; i < ( iconSize * iconSize ); i = i+1){     
      

      if (iconArray[i] == false)  {fill(0xffDDDDCC);
      rect(posX + (i * cellSize) % (iconSize * cellSize), posY + cellSize * floor(i/iconSize ), cellSize, cellSize);
      }
      else{ fill(0);
      
     rect(posX + (i * cellSize) % (iconSize * cellSize), posY + cellSize * floor(i/iconSize ), cellSize, cellSize);}
      
    }
    
    
   
       posY =  220;
       cellSize = 7;
      
      
     for (int i = 0; i < ( iconSize * iconSize ); i = i+1){     
      

      if (iconArray[i] == false)  {fill(0xffDDDDCC);
      rect(posX + (i * cellSize) % (iconSize * cellSize), posY + cellSize * floor(i/iconSize ), cellSize, cellSize);
      }
      else{ fill(0);
      
     rect(posX + (i * cellSize) % (iconSize * cellSize), posY + cellSize * floor(i/iconSize ), cellSize, cellSize);}
      
    }
    
    
   
     posX =  40;
     posY =  60;
     cellSize = 20;   
   }
   
   
    
     public void clear(){
      for (int i = 0; i < ( iconSize * iconSize ); i = i+1){     
      iconArray[i] = false;      
      }
      iconString = "";
    }
    
    
    
      
    
  




  
  public void iconPrint(){
    iconString = "";
    for (int i = 0; i < ( iconSize * iconSize ); i = i+1){     
     if (iconArray[i] == false) iconString  = iconString + "0";
     else iconString  = iconString + "1";
     
    }
    println("data: " + iconito.iconString);
    
    
    }
  
  
  
  }


  
  
  
  class Palette{
  int posX, posY;

  
Palette(){
   

    }
    
    

   

    
  //boolean onLoad(){ return true;}
  
  //boolean onSave(){return true;}
  
  
  public void displayPalette(int x, int y){
       posX=x;
      posY=y;
      
      
      
      textFont(font, 12);
      fill(0);
      
      
      text("13 by 13 equals tiny", 50, posY-20);
      
      
      
      text("space bar to clear", 50, posY+290);
      
      
      
      text("g for grid", 50, posY+320);
      text("c to flip colors", 50, posY+350);
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      

      
      
      
      
      
      noStroke();
      fill(0); 
      
  
  }
  
  public void updateActions(){}
  
 
  
  
}

  
  
static public void main(String args[]) {   PApplet.main(new String[] { "drawTiny_0g" });}}