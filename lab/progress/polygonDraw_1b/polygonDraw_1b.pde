//import processing.opengl.*;
import java.util.*;

// test library of simple geometric objects and methods
// thought or emotion
// erratic and predictable
// by luisBlackaller.com

float x0, y0;
boolean ready;
Vector v;
Vector vrand;
float[] randarray;

void setup() {
  framerate(24);
 
  // size(400, 400, OPENGL);
  size(400, 400);
  background(210,20,30);
  v = new Vector();
  vrand = new Vector();
  float[] randarray = new float[500]; 
  for (int i = 0; i < randarray.length;i++){ randarray[i] = random(0,1);
    //println(randarray[i]);
  }
  
  ready = true;
  
  
 
  
   
}

void draw() {
  float r =random(0,1);
  
  
  int n = v.size();
  if (n == 0) return;
  Point2D A = (Point2D)(v.elementAt(0));
  // show tiny rectangle around first vertex
  fill(255);
  stroke(0);		
  // println("A.x:"+A.x+" A.y:"+A.y); // line used for debugging
  rect(A.x-2, A.y-2, 4, 4);
  			
  
			
  for (int i = 1; i <= n; i++){
    if ( i == n && !ready ) break;
      Point2D B = (Point2D)(v.elementAt(i % n));
    line(A.x, A.y, B.x, B.y);
     A = B;
  }
  
  
  if (n > 3 && ready)
  {	Point2D[] P = new Point2D[n];
	for (int i=0; i<n; i++) P[i] = (Point2D)v.elementAt(i);
	// if not CCW reverse the order
	if (!ccw(P))
		for (int i = 0; i < n; i++)
			P[i] = (Point2D)v.elementAt( n-i-1 );
	int ntr = n-2;
	Triangle2D[] tr = new Triangle2D[ntr];
	triangulate(P, tr);
		
					
	for (int j = 0; j < ntr; j++)
  
	{	Point2D ptemp = new Point2D(0,0);
                ptemp = (Point2D)vrand.elementAt(j);
                if (j+1<=255) 
                  //fill(int( 255 * ptemp.x ),int( 255 * ptemp.x ),int( 255 * ptemp.x ),j+20);
                   fill(0,0,int( 255 * ptemp.x ),j+20);
                else  
                  fill(0,0,int( 255 * ptemp.x ));
                
		float[] x = new float[3], y = new float[3];
		x[0] = (tr[j].A.x);	y[0] = (tr[j].A.y);
		x[1] = (tr[j].B.x);	y[1] = (tr[j].B.y);
		x[2] = (tr[j].C.x);	y[2] = (tr[j].C.y);
		tr[j].displayFill();
	}
  }
  fill(0,0,0);
		
	   
		
	
  

}


void mousePressed() 
{ float xA = mouseX, yA = mouseY;
  
  if(ready) { 
  
    v.removeAllElements();
    vrand.removeAllElements();
    x0 = xA; y0 = yA;
    ready = false;
    background(210,20,30);   
  } 
  float dx = xA - x0, dy = yA - y0;
  if( v.size() > 0 && dx * dx + dy * dy < 5)
    ready = true;
  else { 
    
    v.addElement(new Point2D (xA, yA));
    vrand.add(new Point2D ( random(.3,1), 0) );
  } 
}

boolean ccw (Point2D[] P)
{	int n = P.length, k=0;
	for (int i=0; i<n; i++)
	if ( P[i].x <= P[k].x && ( P[i].x < P[k].x ) || P[i].y < P[k].y )
		k = i;
	// P[k] is a convex vertex
        int prev = k - 1, next = k + 1;
	if ( prev == -1 ) prev = n - 1;
	if ( next == n ) next = 0;
	return area2(P[prev], P[k], P[next]) > 0;
}









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
               System.exit(1);
		
	}	
  }
}

float distance2(Point2D P, Point2D Q)
{	float	dx = P.x = Q.x, dy = P.y = Q.y;
	return dx * dx + dy * dy;
}
	








