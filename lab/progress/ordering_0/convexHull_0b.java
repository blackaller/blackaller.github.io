import processing.core.*; import java.util.*; import java.applet.*; import java.awt.*; import java.awt.image.*; import java.awt.event.*; import java.io.*; import java.net.*; import java.text.*; import java.util.*; import java.util.zip.*; public class convexHull_0b extends PApplet {


// test library of simple geometric objects and methods

// by luisBlackaller.com

float x0, y0;
boolean clear;
Vector v;
Vector vrand;


public void setup() {
  
 
  
  size(400, 400);
  background(255,20,30);
  framerate(24);
  
  smooth();
  v = new Vector();
  vrand = new Vector();
  
  
  clear = true;
  
  
 
  
   
}

public void draw() {
  background(255,20,30);
  float r =random(0,1);
  boolean reset;
  
  
  int n = v.size();
  if (n == 0) return;
  Point2D A = (Point2D)(v.elementAt(0));
  
  fill(255);
  stroke(0);		
  // println("A.x:"+A.x+" A.y:"+A.y); // line used for debugging
  A.display();
  			
  
			
  for (int i = 1; i <= n; i++){
    if ( i == n && !clear ) break;
    Point2D B = (Point2D)(v.elementAt(i % n));
    B.display();
  
  }
  
  
  if (n >= 3 && clear)
  {	Point2D[] Puntos = new Point2D[n];
	for (int i=0; i<n; i++) Puntos[i] = (Point2D)v.elementAt(i);
	
        ordenadorPolar(Puntos);
        
        
        
        fill(255);
        stroke(255);
        
        ellipse(Puntos[indexMinY(Puntos)].x,Puntos[indexMinY(Puntos)].y,10,10);
        
        
        
        fill(0);
        ellipse(Puntos[0].x,Puntos[0].y,5,5);
        
        for (int i = 0; i < n-1; i++){ line(Puntos[i].x,Puntos[i].y,Puntos[i+1].x,Puntos[i+1].y);  }
        stroke(0);
        line(Puntos[n-1].x,Puntos[n-1].y,Puntos[0].x,Puntos[0].y);
        
        
        
       
        
        
        


	
        
        
  }
  fill(0);
		
	   

}


public void mousePressed() 
{ int xA = mouseX, yA = mouseY;
  
  if(clear) { 
  
    v.removeAllElements();
    vrand.removeAllElements();
  
    clear = false;
    background(255,20,30);   
  } 
 
  if( v.size() > 0 && keyPressed==true )
  {  
      
      //clear = true;
  }
  else { 
    
    v.addElement(new Point2D (xA, yA));
    //println(  xA + " "  + yA );
    vrand.add(new Point2D ( random(0.3f,1), 0) );
  } 
}



public void keyPressed() {clear = true;}
/*void keyPressed() 
{ 
  
  if(clear) { 
  
    v.removeAllElements();
    vrand.removeAllElements();
    
    clear = false;
    background(210,20,30);   
  } 
  
  else { 

  } 
}*/










public void intercambio(Point2D[] P, int a, int b){ //este metodo parece que si funciona
  int n = P.length;
  
  if((a < n) && (b < n)){
    Point2D Temp = new Point2D(P[a].x,P[a].y);
    
    //println("antes");
    //println("P[a] "+ P[a].x + ", " + P[a].y+" P[b] "+ P[b].x +", " + P[b].y+" Temp "+ Temp.x+", "+Temp.y);  // for debugging   
    
    
    P[a] = P[b];
    P[b] = Temp;  
    
    //println("despues");
    //println("P[a] "+ P[a].x + ", " + P[a].y+" P[b] "+ P[b].x +", " + P[b].y+" Temp "+ Temp.x+", "+Temp.y);  // for debugging   
     
       
  }
}




public void ordenadorPolar(Point2D[] P){
     int n = P.length;
     int menor;
     int primero = indexMinY(P);
     
     
     
     //println("antes:");
     //println("P[0] "+ P[0].x + ", " + P[0].y+" P[primero] "+ P[primero].x +", " + P[primero].y);  // for debugging   

     // ahora si a ordenar
     
     
     
     intercambio(P,0,primero); //parece que funciona
     
     
     
     //println("despues:");
     //println("P[0] "+ P[0].x + ", " + P[0].y+" P[primero] "+ P[primero].x +", " + P[primero].y);  // for debugging   
     
     // ordenaci\u00f3n por seleccion
     for(int i = 1; i < n; i++){
       menor = i; // aparentemente el uso de la variable menor como puente le daba en la madre a todo
       
       for(int j =i+1; j < n; j++){
       
       
         if (  atan2((P[j].y-P[0].y), (P[j].x-P[0].x)) < atan2((P[i].y-P[0].y), (P[i].x-P[0].x))  ) {
            menor = j;
            intercambio(P, j, i);
         }
       
       }
        
     
  
     }
     
     //for(int i = 1; i < n; i++){println("atan("+i+")= " +atan2(  (P[i].y-P[0].y), (P[i].x-P[0].x))+ ", P[" + i +"]= "+ P[i].x+", "+P[i].y);}//debug
     

}








public int indexMinX (Point2D[] P)
{	int n = P.length, k=0, contador = 0;

	for (int i=0; i< n; i++){

           for (int j=0; j< n; j++) {
           
	     if ( P[i].x < P[j].x ) contador = contador+1;
             
             
          }
          if (contador < n-1) contador = 0;
          else if (contador == n-1) {k=i;break;}
          
        }
        
        
	return(k); 
}



public int indexMinY (Point2D[] P)
{	int n = P.length, k=0, contador = 0;

	for (int i=0; i< n; i++){

           for (int j=0; j< n; j++) {
           
	     if ( P[i].y < P[j].y ) contador = contador+1;
             
             
          }
          if (contador < n-1) contador = 0;
          else if (contador == n-1) {k=i;break;}
          
        }
        
       
	return(k); 
}









public boolean ccw (Point2D[] P)
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
  
  Point2D(){
    this.x = x;
    this.y = y;
  
  
  }
  
  
  
  
  Point2D (float X,float Y){  
    x = X;
    y = Y;
  }
  public void display(){
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
        public void display(){
          line(A.x, A.y, B.x, B.y);
          line(B.x, B.y, C.x, C.y);
          line(C.x, C.y, A.x, A.y);
          A.display();
          B.display();
          C.display();
        }
         public void displayLines(){
          line(A.x, A.y, B.x, B.y);
          line(B.x, B.y, C.x, C.y);
          line(C.x, C.y, A.x, A.y);
        }
         public void displayPoints(){
          A.display();
          B.display();
          C.display();
        }
        public void displayFill(){
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
        public void display(){          
          line(A.x, A.y, A.x + ( magnitude * sin(angle) ), A.y + ( magnitude * cos(angle) ) );
          A.display();         
        }
        public void displayEnd(){
          Point2D B;
          B = new Point2D(A.x + ( magnitude * sin(angle) ), A.y + ( magnitude * cos(angle) ) );
          B.display();        
        }
        public Point2D startPoint(){
          return (A);
        }
        public Point2D endPoint(){
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

        public void display(){
          for (int i = 0; i < vertices; i++){
           
            int k = (i + 1) % (vertices);         
            line(A[i].x, A[i].y, A[k].x , A[k].y  );
            A[i].display();        
          } 
        }
        
  

} 

















/*************** METHODS ***************/

public Point2D midPoint(Point2D X,Point2D Y){
  Point2D mid;
  mid = new Point2D( X.x +( (Y.x-X.x)/2 ), X.y +( (Y.y-X.y)/2 ) ); // fun to change any of this 2 for a 3
  return (mid);
}


public Point2D randomChoice(Point2D X, Point2D Y, Point2D Z){
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


public Point2D randomPoint(){
  float rx = random(0,1);
  float ry = random(0,1);
  Point2D rand;
  
  
   rand = new Point2D( width * rx, height * ry );
  
  return (rand);
}


public float area2(Point2D A, Point2D B, Point2D C)
{
  return (A.x - C.x) * (B.y - C.y) - (A.y - C.y) * (B.x - C.x);
}
	
public boolean insideTriangle(Point2D A, Point2D B, Point2D C,  Point2D P){
	// ABC is assumed to be counterclockwise
  return
	area2(A, B ,P ) >= 0 &&
	area2(B, C, P) >= 0 &&
	area2(C, A, P) >= 0; 
}
	
public boolean triangulate (Point2D[] P,Triangle2D[] tr)
{
  // P contains all n polygon vertices in ccw order
  // the resulting triangles will be stored in array tr
  // this array tr must have lenght n-2
  boolean salir= false;
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
	if (count >= n)
	{	//println("not a simple polygon" +
		//" or vertex sequence not counterclockwise");
                salir =true;
               //System.exit(1);	
	}	
        
  }
  
  return(salir);
}

public float distance2(Point2D P, Point2D Q)
{	float	dx = P.x = Q.x, dy = P.y = Q.y;
	return dx * dx + dy * dy;
}
	








}