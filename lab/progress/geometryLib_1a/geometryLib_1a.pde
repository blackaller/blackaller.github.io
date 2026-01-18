// import processing.opengl.*;

// test library of simple geometric objects and methods
// thought or emotion
// erratic and predictable
// by luisBlackaller.com


Point2D p1, p2, p3;
Triangle2D t, t2;
Vector2D v;
Polygon2D p;


float vueltas;


void setup() {
  framerate(24);
  vueltas = 0;
  size(400, 400 /*, OPENGL*/);
  background(210,20,30);
  p1 = new Point2D(200,200);
  p2 = new Point2D(200,100);
  p3 = new Point2D(100,200);
  t =  new Triangle2D (p1,p2,p3);
  t2 = new Triangle2D (10,10,10,100,100,100 );
  
  Point2D[] puntos = new Point2D[4];
  puntos[0] = new  Point2D(10,10);
  puntos[1] = new  Point2D(10,390);
  puntos[2] = new  Point2D(390,390);
  puntos[3] = new  Point2D(390,10);
  
  p = new Polygon2D (4, puntos);
  v = new Vector2D(width/2,height/2,PI/3,5);
  /* t.display();
  v.display();
  v.displayEnd();
  t2.displayFill(); */
  
   
}

void draw() {
  fill(210,20,30,20);
  rect(0,0,400,400);
  
   fill(255);
  
  v.angle = v.angle + PI/12;
  if ( v.magnitude < width/2)
    v.magnitude = v.magnitude + 0.1f;
  v.display();
  v.displayEnd();
  
  p1 = randomPoint();
  line(p1.x,p1.y,p2.x,p2.y);
  p3 = v.endPoint();
  line(p3.x, p3.y, p1.x,p1.y);
  p1.display();
  
  t = new Triangle2D(p1,p2,p3); 
  fill(255);
  // noStroke(); // comment this line if u want
  t.displayFill();
  
  p2 = p1;
  
  p.display();
 
  
  //delay(200);
  
  


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






