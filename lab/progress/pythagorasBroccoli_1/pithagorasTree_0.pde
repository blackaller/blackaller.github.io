//import processing.opengl.*;
import java.util.*;


// test library for simple geometric objects and methods
// recursion
// exploring self similarity
// by luisBlackaller.com

//click two times inside the rectangles

Point2D A;
Point2D B;
Vector Base;

float depth = 10, x0,y0;


float angle;

boolean ready = true;
float cont = 1;


void setup() {
  angle= 0.2f;
  framerate(24);
 
  size(400, 400/*, OPENGL*/);
  background(210,20,30);
  noStroke();
  A = new Point2D(185,360);
  B = new Point2D(245,365);
  Base = new Vector();
  ready = true;
  
  
 
  
   
}

void draw() {
  
   boolean crecer =true;
   //cont = cont+0.08f;
   
  //angle = random(0.2f, 0.6f);
  if(( angle <= 0.58f) && (crecer ==true))
    {angle = (angle + (0.01f/cont));
     //depth = depth+0.3f;
    
    if( angle == 0.6f) crecer = false;
      
    }
  
  
  
  //background(210,20,30);
  fill(210,20,30,50/cont);
  rect(0,0,400,400);
  
  
  fill(230);
  rect(125,20,150,40);
  rect(125,340,150,40);
  
  rect(20,125,40,150);
  rect(340,125,40,150);
  
  
 
  
  
  
  
    if ( !ready && ( Base.size() == 2)) 
    {  A = (Point2D)(Base.elementAt(0 ));
       B = (Point2D)(Base.elementAt(1 ));
       angle= 0.2f;
       cont = 1;
       //depth = 1;
       ready = true;}
    
    
    if ((A.x >= 125) && (A.x <= 275) && (B.x >= 125) && (B.x <= 275) && (A.y >= 20) && (A.y <= 60) && (B.y >= 20) && (B.y <= 60)) {
     
      if ((A.x > B.x) ) {broccoli(B, A, depth,  angle );}
      else{broccoli(A, B, depth,  angle);}
      A.display();B.display();
      
    }
    else{
      if ((A.x >= 125) && (A.x <= 275) && (B.x >= 125) && (B.x <= 275) && (A.y >= 340) && (A.y <= 380) && (B.y >= 340) && (B.y <= 380)) {
        if ((A.x > B.x) ) {broccoli(A, B, depth,  angle );}
        else{broccoli( B,A, depth,  angle);}
        A.display();B.display();
      }
      else{
        if ((A.x >= 20) && (A.x <= 60) && (B.x >= 20) && (B.x <= 60) && (A.y >= 125) && (A.y <= 275) && (B.y >= 125) && (B.y <= 275)) {
          if ((A.y > B.y) ) {broccoli(A, B, depth,  angle );}
          else{broccoli( B,A, depth, angle);}
          A.display();B.display();
        }
        else{
        if ((A.x >= 340) && (A.x <= 380) && (B.x >= 340) && (B.x <= 380) && (A.y >= 125) && (A.y <= 275) && (B.y >= 125) && (B.y <= 275)) {
          if ((A.y > B.y) ) {broccoli( B, A,depth,  angle );}
          else{broccoli( A,B, depth,  angle );}
          A.display();B.display();
        }  
      }  
      }
      A.display();B.display();
    }
    
    
    
    
 	  
}


void mousePressed() 
{ float xA = mouseX, yA = mouseY;
  
  
  
  if(ready) { 
    
  
    Base.removeAllElements();
   
    x0 = xA; y0 = yA;
    ready = false;
    //background(210,20,30);   
  } 
  
  if( Base.size() == 2)
  {  
      
      ready = true;
  }
  else { 
    
    Base.addElement(new Point2D (xA, yA));
    println(  xA + " "  + yA );
    
   
  } 
}










/*************** specific methods for this project ***************/

/*Triangle2D rectTriangleCW (Point2D C, Point2D D, float angle){ // clockwise recangle triangle with A, B in it. angle is the angle EDC in (0,PI)
  Point2D E;
  E = new Point2D(  D.x + ( cos(angle) * C.x ), D.y + ( cos(angle) * C.y ) );
  return(new Triangle2D(C,D,E));
}

Polygon2D squareCW (Point2D A, Point2D B){ // clockwise square with A, B in it
  Point2D C;
  Point2D D;
  Point2D[] SQ;

  D = new Point2D(10,10);
  C = new Point2D(10,10);
  SQ = new Point2D[4];
  SQ[0] = A;
  SQ[1] = B;
  SQ[2] = C;
  SQ[3] = D;
  
  return(new Polygon2D( 4, SQ));
}*/

void broccoli(Point2D A, Point2D B, float depth, float angle){ // recursive method
  Point2D C;
  Point2D D;
  Point2D E;
  float u0 = ( B.x - A.x), u1 = ( B.y - A.y);

  Square2D mySquare;
  Triangle2D myTriangle;
  C = new Point2D(-u1  + A.x + u0, u0 + A.y + u1);
  D = new Point2D(-u1 + A.x, u0 + A.y);
   /*casi sirve pero no*/  //E = new Point2D( -u1  + midPoint(A,B).x + 0.5f*cos(angle)*( u0 - u1 ) , +u0 + midPoint(A,B).y + 0.5f*sin(angle)*( u1 + u0 ) );
  //descompuesto pero interesante: E = new Point2D( -u1  + midPoint(A,B).x + 0.5f*cos(angle)*( B.x-A.y ) , +u0 + midPoint(A,B).y + 0.5f*sin(angle)*( B.y-A.x  ) );
 //trivial con el isosceles E = new Point2D( A.x -u1   + 0.5f*( u0 - u1 ) , A.y + u0  + 0.5f*( u1 + u0 ) );
  E = new Point2D( A.x -u1   + angle*( u0 - u1 ) , A.y + u0  + angle*( u1 + u0 ) );
  
  
  mySquare = new Square2D ( A, B, C, D);
  
  
 
  myTriangle = new Triangle2D (C, D , E);
  
  //println (E.x +", "+ E.y);
  
  
  fill(0,0,255-18*(depth));
  //mySquare.display();
  mySquare.displayFill();
 //myTriangle.display();
  myTriangle.displayFill();
  
  
  if (depth > 1){
     depth = depth-1;
     broccoli(E, C, depth, angle);
     broccoli(D, E, depth, angle);
  }
}

float espejoVertical(float y){  return( height-y );}















/*************** START LIBRARY OF CLASSES ***************/


class Point2D
{ 
  float x;
  float y;
  
  Point2D (float X,float Y){  
    x = X;
    y = Y;
  }
  void display(){
    ellipseMode(CENTER_RADIUS);
    ellipse(x, y, 2, 2);
  }
}


class Triangle2D
{	
	Point2D A, B, C;
	Triangle2D (Point2D A, Point2D B, Point2D C){ // constructor
	  this.A = A;
	  this.B = B;
	  this.C = C;
	} // closes method
        Triangle2D (float x1, float y1, float x2, float y2, float x3, float y3){ // constructor
	  this.A = new Point2D(x1,y1);
	  this.B = new Point2D(x2,y2);
	  this.C = new Point2D(x3,y3);
	} // closes method
        void display(){
          line(A.x, A.y, B.x, B.y);
          line(B.x, B.y, C.x, C.y);
          line(C.x, C.y, A.x, A.y);
          A.display();
          B.display();
          C.display();
        }
         void displayLines(){
          line(A.x, A.y, B.x, B.y);
          line(B.x, B.y, C.x, C.y);
          line(C.x, C.y, A.x, A.y);
        }
         void displayPoints(){
          A.display();
          B.display();
          C.display();
        }
        void displayFill(){
          triangle(A.x, A.y, B.x, B.y, C.x, C.y);
        }
}


class Square2D
{	
	Point2D A, B, C, D;
	Square2D (Point2D A, Point2D B, Point2D C, Point2D D){ // constructor
	  this.A = A;
	  this.B = B;
	  this.C = C;
          this.D = D;
	} // closes method
        Square2D (float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4){ // constructor
	  this.A = new Point2D(x1,y1);
	  this.B = new Point2D(x2,y2);
	  this.C = new Point2D(x3,y3);
          this.D = new Point2D(x4,y4);
	} // closes method
        void display(){
          line(A.x, A.y, B.x, B.y);
          line(B.x, B.y, C.x, C.y);
          line(C.x, C.y, D.x, D.y);
          line(D.x, D.y, A.x, A.y);
          A.display();
          B.display();
          C.display();
          D.display();
        }
         void displayLines(){
          line(A.x, A.y, B.x, B.y);
          line(B.x, B.y, C.x, C.y);
          line(C.x, C.y, D.x, D.y);
          line(D.x, D.y, A.x, A.y);
        }
         void displayPoints(){
          A.display();
          B.display();
          C.display();
          D.display();
        }
        void displayFill(){
          triangle(A.x, A.y, B.x, B.y, C.x, C.y);
          triangle(A.x, A.y, C.x, C.y, D.x, D.y);
        }
}

 
class Vector2D
{	
	Point2D A;
        float angle, magnitude;
	Vector2D (Point2D A, float angle, float magnitude){ // constructor
	  this.A = A;
	  this.angle = angle;
	  this.magnitude = magnitude;
	} // closes method
        Vector2D (float x,float y, float angle, float magnitude){ // constructor
	  this.A = new Point2D(x,y);
	  this.angle = angle;
	  this.magnitude = magnitude;
	} // closes method
        void display(){          
          line(A.x, A.y, A.x + ( magnitude * sin(angle) ), A.y + ( magnitude * cos(angle) ) );
          A.display();         
        }
        void displayEnd(){
          Point2D B;
          B = new Point2D(A.x + ( magnitude * sin(angle) ), A.y + ( magnitude * cos(angle) ) );
          B.display();        
        }
        Point2D startPoint(){
          return (A);
        }
        Point2D endPoint(){
          Point2D B;
          B = new Point2D(A.x + ( magnitude * sin(angle) ), A.y + ( magnitude * cos(angle) ) );
          return (B);
        }
}  


class Polygon2D
{	int vertices;
	Point2D[] A;
       
       
	Polygon2D (int vertices, Point2D[ ]A ){ // constructor
	  this.vertices = vertices;
          this.A = new Point2D[vertices];
          for (int i = 0; i < vertices; i++){
            this.A[i] = A[i];
                             
          }                   
	} // closes method

        void display(){
          for (int i = 0; i < vertices; i++){
           
            int k = (i + 1) % (vertices);         
            line(A[i].x, A[i].y, A[k].x , A[k].y  );
            A[i].display();        
          } 
        }
        void displayFill(){ // work it out this one
         
        }
} 

















/*************** METHODS ***************/

Point2D midPoint(Point2D X,Point2D Y){
  Point2D mid;
  mid = new Point2D( X.x +( (Y.x-X.x)/2 ), X.y +( (Y.y-X.y)/2 ) ); // fun to change any of this 2 for a 3
  return (mid);
}


Point2D randomChoice(Point2D X, Point2D Y, Point2D Z){
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


Point2D randomPoint(){
  float rx = random(0,1);
  float ry = random(0,1);
  Point2D rand;
  
  
   rand = new Point2D( width * rx, height * ry );
  
  return (rand);
}


float area2(Point2D A, Point2D B, Point2D C)
{
  return (A.x - C.x) * (B.y - C.y) - (A.y - C.y) * (B.x - C.x);
}
	
boolean insideTriangle(Point2D A, Point2D B, Point2D C,  Point2D P){
	// ABC is assumed to be c ounterclockwise
  return
	area2(A, B ,P ) >= 0 &&
	area2(B, C, P) >= 0 &&
	area2(C, A, P) >= 0; 
}
	
void triangulate (Point2D[] P,Triangle2D[] tr)
{
  // P contains all n polygon vertices in ccw order
  // the resulting triangles will be stored in array tr
  // this array tr must have lenght n-2
	
  int n = P.length, j = n - 1, iA = 0, iB, iC;
  int[] next = new int[n];
  for (int i= 0; i < n; i++)
  {	next[j] = i;
	j = i;
  }
  for (int k = 0; k < n-2; k++)
  {	// find a suitable triangle consisting of
	// two edges and an internal diagonal
	Point2D A, B, C;
	boolean triaFound = false;
	int count = 0;
	while (!triaFound && ++count < n)
	{	iB = next[iA];
		iC = next[iB];
		A = P[iA];
		B = P[iB];
		C = P[iC];
		if(area2(A, B, C) >= 0)
		{	// edges AB and BC, diagonal AC
			// test to see if no other polygon vertex
			// lies within triangle ABC:
			j = next[iC];
			while( j != iA && !insideTriangle(A, B, C, P[j]))
				j = next[j];
			if ( j == iA)
			{	// then triangle ABC contains no other vertex:
				tr[k] = new Triangle2D(A, B, C);
				next[iA] = iC;
				triaFound = true;
			}
		}
		iA = next[iA];
	}
	if (count == n)
	{	println("not a simple polygon" +
		" or vertex sequence not counterclockwise");
		
	}	
  }
}

float distance2(Point2D P, Point2D Q)
{	float	dx = P.x = Q.x, dy = P.y = Q.y;
	return dx * dx + dy * dy;
}
	








