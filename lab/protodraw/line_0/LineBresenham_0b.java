import processing.core.*; import java.applet.*; import java.awt.*; import java.awt.image.*; import java.awt.event.*; import java.io.*; import java.net.*; import java.text.*; import java.util.*; import java.util.zip.*; public class LineBresenham_0b extends PApplet {int grid =40;
boolean drawing =true;
int x0=0;int y0= 0;
int x1=0;int y1= 0;
int dropx0=0;int dropy0= 0;
int dropx1=0;int dropy1= 0;

public void setup(){
  size(400,400);
  background(0xffDDDDCC);
  ellipseMode(CORNER);
  stroke(255);
  for (int i=1; i< width/grid; i++){
      line(0, (i)*grid,width,(i)*grid);
      line( (i)*grid, 0, (i)*grid, width);
    }
  
  
  }
  
  
  public void draw(){
    
    
    //ellipse(grid,grid,grid,grid);
    
    if (mousePressed){
      if (drawing){x0 = mouseX; y0 = mouseY; }
      refresh();
      stroke(0);
      drawing = false;
      x1 = mouseX; y1 = mouseY;
      line(x0,y0,x1,y1);
      
      }
    
    
    
     if (keyPressed) {
         
      if (key == ' ') clear();
    
     }
  }
    
    
    
   
    public void mouseReleased(){ 
      //these have to jump tp the other grid
      dropx0 = floor(x0 / grid);  
      dropy0 = floor(y0 / grid);
      dropx1 = floor(x1 / grid);
      dropy1 = floor(y1 / grid);
      drawing = true;
      runLine(dropx0, dropx1, dropy0,  dropy1, grid);
      stroke(0);
      line(x0,y0,x1,y1);
    }
    
    
   
    
    
  public void clear(){
    
    
     background(0xffDDDDCC);
  stroke(255);
  for (int i=1; i< width/grid; i++){
      line(0, (i)*grid,width,(i)*grid);
      line( (i)*grid, 0, (i)*grid, width);
    }
    
  } 
    public void refresh(){
    
    
     background(0xffDDDDCC);
  stroke(255);
  for (int i=1; i< width/grid; i++){
      line(0, (i)*grid,width,(i)*grid);
      line( (i)*grid, 0, (i)*grid, width);
    }
    
    
    
    } 
    
    
    public void runLine( int x0, int x1, int y0, int y1, int big){
      noStroke();
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
         if (steep)  ellipse(y*big,x*big,big,big);
         else ellipse(x*big,y*big,big,big);
         error = error + deltay;
         if (2*error >= deltax){
             y = y + ystep;
             error = error - deltax;
         }
       }
     }
    

     
    
    
   
static public void main(String args[]) {   PApplet.main(new String[] { "LineBresenham_0b" });}}