import processing.core.*; import java.applet.*; import java.awt.*; import java.awt.image.*; import java.awt.event.*; import java.io.*; import java.net.*; import java.text.*; import java.util.*; import java.util.zip.*; public class sierpinski_0 extends PApplet {//import processing.opengl.*;

// sierpinski_0 ()
// by Blackaller


Point2D A;
Point2D B;
Point2D C;

Point2D P1;
Point2D P2;
Point2D temp;

int acelere;

public void setup() {
  size(400, 400/*, OPENGL*/);
  background(210,20,20);
  ellipseMode(CENTER_RADIUS);
  int rx = PApplet.toInt(random(0, 400));
  int ry = PApplet.toInt(random(0, 400));
  acelere = 0;
  //smooth();
  A = new Point2D (20,20);
  B = new Point2D (380,20); 
  C = new Point2D (200,380);  
  P1 = new Point2D (rx,ry);
  temp = new Point2D(0,0); 
}

public void draw() {
  //background(210,20,20);
  noFill();
  acelere = acelere+1;
   
  // stroke(0);
  // triangle(A.x, A.y, B.x, B.y, C.x, C.y);
 
  stroke(0);
  ellipse(P1.x, P1.y, 1, 1);
  // point(P1.x, P1.y);
        
  temp = randomPoint( A,B,C);  
  P2 = midPoint (P1, temp);
  /*if( 255-diluyente > 50)
  stroke(210, 255 - diluyente, 255 - diluyente);
  else
    stroke(210, 50, 50);*/
    
                  
    
  stroke(210, 70, 70);
  if (keyPressed == true) { } else {
    fill(210,20,30,2);
    rect(0,0,400,400);
    line(P1.x, P1.y, P2.x, P2.y); 
   } 
     
  stroke(0);
  ellipse(P2.x, P2.y, 1, 1);
  // point(P2.x, P2.y);
     
  P1 = P2;
  delay(250-acelere);
}



public Point2D randomPoint(Point2D X, Point2D Y, Point2D Z){
  float r = random(0,3);
  Point2D rand;
  
  if (r < 1f)
    rand = new Point2D( Y.x, Y.y );
  else{
    if(r < 2f) 
      rand = new Point2D( X.x, X.y );
    else
      rand = new Point2D( Z.x, Z.y );
  }
  return (rand);
}


public Point2D midPoint(Point2D X,Point2D Y){
  Point2D mid;
  mid = new Point2D( X.x +( (Y.x-X.x)/2 ), X.y +( (Y.y-X.y)/2 ) ); // fun to change any of this 2 for a 3
  return (mid);
}


class Point2D
{ 
  int x;
  int y;
  
  Point2D (int X,int Y){  
    x=X;
    y=Y;
  }
}


}