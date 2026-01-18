import processing.core.*; import java.applet.*; import java.awt.*; import java.awt.image.*; import java.awt.event.*; import java.io.*; import java.net.*; import java.text.*; import java.util.*; import java.util.zip.*; public class drawInk_0a extends PApplet {int num = 201;
float mx[] = new float[num];
float my[] = new float[num];
boolean mdraw[] = new boolean[num];

float i=0;
int inkX,inkY;

public void setup(){
  size(600,600); 
 smooth(); 
 fill(255,20,30);
  stroke(0); 
 inkX=100;
 inkY=500;
 strokeWeight(6);
   for(int i=0; i<num-1; i++) {
     mdraw[i]=false;
   }
  
  
}




public void draw(){
  background(255);
  stroke(0); 
  ellipse(inkX,inkY,100,100);
 
  
  
  
  
  
 if(mousePressed && 190-i>0){
   
   // Reads throught the entire array
  // and shifts the values to the left
    for(int i=1; i<num; i++) {
      mx[i-1] = mx[i];
      my[i-1] = my[i];
      
    } 
  // Add the new values to the end of the array
    mx[num-1] = mouseX;
    my[num-1] = mouseY;
    
    
    
    
   }
     
     
   stroke(255,20,30);  
   for(int i=0; i<num-1; i++) {
     if (mx[i] > 0 && my[i] > 0 && mx[i+1] > 0 && my[i+1] > 0)line(mx[i], my[i], mx[i+1], my[i+1]);
   }
  



  translate(mouseX,mouseY);
  if(mouseX>0 && mouseY>0){
  rotate(-3*PI/4);
  
 stroke(0);  
  fill(255);
  rect(0,0,20,200); 

   fill(255,20,30);
  rect(0,0,20,190-i);
 
  

  
  
  
  
  
  
  }
  
  
  if (inside(inkX,inkY,100) && 190-i< 200){i=i-1;}
  
  
  if ((mousePressed && 190-i>0) && (!inside (inkX,inkY,100))) {
    i=i+0.5f;
    }
  
  

  
  }
  
  
  public boolean inside (int x, int y, int radius){
    //if (( sq(x + mouseX) + sq(y + mouseY) ) <= radius)
    if ((mouseX > x - radius/2 && mouseY > y - radius/2) && (mouseX < x + radius/2 && mouseY< y + radius/2)){
      //rect(0,0,100,100); to debug
      return (true);
      
      }
    else
      return(false);    
  }

class Point2D
{ 
  float x;
  float y;
  
  Point2D (float X,float Y){  
    x = X;
    y = Y;
  }
  public void display(){
    ellipseMode(CENTER_RADIUS);
    ellipse(x, y, 2, 2);
  }
}
static public void main(String args[]) {   PApplet.main(new String[] { "drawInk_0a" });}}