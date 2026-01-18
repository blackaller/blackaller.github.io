import processing.core.*; import java.applet.*; import java.awt.*; import java.awt.image.*; import java.awt.event.*; import java.io.*; import java.net.*; import java.text.*; import java.util.*; import java.util.zip.*; public class drawColors_0 extends PApplet {//pixel pollock

PFont font;
int cell = 1;
int miColor = (int)random(0xff000000, 0xffFFFFFF);
boolean start =  true;

public void setup(){
  size(400,400);
  background(0xffDDDDCC);
  
  font = loadFont("Monaco-12.vlw");
  
  noFill();
  
  textFont(font, 12);
  fill(0);
      
  
  text("draw here", width/2-30, height/2);
  
  fill(miColor);
  noStroke();
  
  
  

  
  int a = 2; 
  int b = 3;
  print (" original: " + a + ", " + b + " and swap: ");
  swap(a,b);
  print (a + ", " + b);
  
  }
  
  
  
  
  
  public void draw(){
    

    
    if (mousePressed){
      if(start == true){ background(0xffDDDDCC); start = false;}
      pxLine(pmouseX,mouseX, pmouseY,mouseY, cell);}
    
    //pxLine(200,mouseX, 200,mouseY);
    
    if (keyPressed) {
      miColor = (int)random(0xff000000, 0xffFFFFFF);
     
      if (key == ' ') clear();
      if (key == '1') {fill(miColor);cell = 1;}
      if (key == '2') {fill(miColor);cell = 2;}
      if (key == '3') {fill(miColor);cell = 4;}
      if (key == '4') {fill(miColor);cell = 5;}
      if (key == '5') {fill(miColor);cell = 8;}
      if (key == '6') {fill(miColor);cell = 10;}
      if (key == '7') {fill(miColor);cell = 16;}
      if (key == '8') {fill(miColor);cell = 20;}
      if (key == '9') {fill(miColor);cell = 25;}
      if (key == '0') {miColor = 0xffFFFFFF;fill(miColor);}
      
    
    
    
    }
    }
    
    
    
    
    
    
     public void pxLine( int x0, int x1, int y0, int y1, int cell){
       boolean steep = abs(y1 - y0) > abs(x1 - x0);
       if (steep){
         int temp0 = x0;
         int temp1 = x1;
         x0 =  y0;
         y0 = temp0;
         x1 =  y1;
         y1 = temp1;
      
         //swap(x0, y0);
         //swap(x1, y1);
       }
       if (x0 > x1){
         int tempX = x0;
         int tempY = y0;
         x0 =  x1;
         x1 = tempX;
         y0 =  y1;
         y1 = tempY;
            
         //swap(x0, x1);
         //swap(y0, y1);
       }
       int deltax = x1 - x0;
       int deltay = abs(y1 - y0);
       int error = 0;
       int ystep;
       int y = y0;
       if (y0 < y1) 
         ystep = 1; 
       else 
         ystep = -1;
       for (int x = x0; x<= x1; x++){
         if (steep)  rect(y - (y % cell)  ,x - (x % cell)  ,cell,cell);
         else rect(x - (x % cell)  ,y - (y % cell),cell,cell);
         error = error + deltay;
         if (2*error >= deltax){
             y = y + ystep;
             error = error - deltax;
         }
       }
     }
     
       
     public void clear(){
       background(0xffDDDDCC);
       
       }
       
       
     
     public void swap (int x, int y){ // doesnt work
       int tempX =x;
       int tempY =y;
       
       x=tempY;
       y=tempX;
       }
static public void main(String args[]) {   PApplet.main(new String[] { "drawColors_0" });}}