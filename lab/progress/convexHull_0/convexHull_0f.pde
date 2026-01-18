import java.util.*;

// almost convex hull
// this version is a little wrong. my current lack of ability to manipulate linked lists made me unable to
// properly perform the little back and forth jumps dictated by graham's algorithm, and i had to develop an
// "almost convexator" method, that when applied a number of times eventually delivers you the convex hull, sometimes. i will fix this in finite time.

// by luisBlackaller.com

float x0, y0;
boolean clear;
Vector v;



void setup() {

  size(400, 400);
  background(255,20,30);
  framerate(24);
  
  smooth();
  v = new Vector();

  clear = true;

   
}

void draw() {
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

        //for (int i = 0; i < n; i++){ line(Puntos[i].x,Puntos[i].y,Puntos[(i+1)%n].x,Puntos[(i+1)%n].y);  } // this displays the angle ordered polygon
        
        DashLine[] Edges = new DashLine[n];
        for (int i = 0; i < n; i++){ 
          Edges[i] = new DashLine((int)Puntos[i].x, (int)Puntos[(i+1)%n].x, (int)Puntos[i].y, (int)Puntos[(i+1)%n].y, 2);
          Edges[i].display();
          
          }
        
        
        

        Point2D[] CasiConvexo1 = new Point2D[0];
        CasiConvexo1 =  casiConvexador (Puntos);
       
        Point2D[] CasiConvexo2 = new Point2D[0];  
        CasiConvexo2 =  casiConvexador (CasiConvexo1);
        
       for(int i = 1; i < 20; i++){
           CasiConvexo1 =  casiConvexador (CasiConvexo2);
           CasiConvexo2 =  casiConvexador (CasiConvexo1);
       
       }
       

        Point2D[] Convexo = new Point2D[0];
        Convexo =  casiConvexador (CasiConvexo2);

       //noStroke();
       stroke(0,0,255,100);
       //stroke(0,0,255);
       for (int i = 0; i < Convexo.length; i++){ 
         fill(0,0,255);
         ellipse(Convexo[i].x,Convexo[i].y,5,5); 
        }
       
       fill(0,0,255,100);    
       beginShape(POLYGON); 
       for (int i = 0; i < Convexo.length; i++){ 
         vertex(Convexo[i].x,Convexo[i].y);  
       }
       endShape();   
            
  }

  fill(0);
		
	   

}


void mousePressed() 
{ int xA = mouseX, yA = mouseY;
  
  
  
  if(clear) { 
  
    v.removeAllElements();

    clear = false;
    background(255,20,30);   
  } 
 
  if( v.size() > 0 && keyPressed==true )
  {  
     
      //clear = true;
  }
  else { 
    
    v.addElement(new Point2D (xA, yA));

  } 
}



void keyPressed() {clear = true;}


void intercambio(Point2D[] P, int a, int b){ //este metodo parece que si funciona
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


class DashLine
{ 
  int xA;
  int xB;
  int yA;
  int yB; 
  int dashLenght;
  
  DashLine (int startX,int endX,int startY,int endY, int dashLn)
  {  
    xA=startX;
    xB=endX;
    yA=startY;
    yB=endY;
    dashLenght=dashLn;
  
  }
  
  void display(){
    float lineLenghtX = xB-xA;
    float lineLenghtY = yB-yA; 
    float lineLenght = sqrt( sq(lineLenghtX) + sq(lineLenghtY) );
    int n = floor( ((lineLenght/dashLenght)+1)/2    ); 
    float dashX = lineLenghtX /(2*n - 1); 
    float dashY = lineLenghtY /(2*n - 1);
  
   
    for(int i=0;i<=n-1;i++){     
       line(xA+(2*i*dashX), yA+(2*i*dashY), xA+((2*i+1)*dashX), yA+((2*i+1)*dashY));
  
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
	// ABC is assumed to be counterclockwise
  return
	area2(A, B ,P ) >= 0 &&
	area2(B, C, P) >= 0 &&
	area2(C, A, P) >= 0; 
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


boolean insidePolygon (Point2D[] P, Point2D A){ //this one not yet implemented
  int n = P.length, j = n - 1;
  

  return (true);

}




	
boolean triangulate (Point2D[] P,Triangle2D[] tr)
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

float distance2(Point2D P, Point2D Q)
{	float	dx = P.x = Q.x, dy = P.y = Q.y;
	return dx * dx + dy * dy;
}
	

/************ aqui armo la implementacion para sacar el convex hull *************/

Point2D[] casiConvexador (Point2D[] Puntos){
      Stack myStack = new Stack();

      myStack.push(Puntos[0]);
      myStack.push(Puntos[1]);
      int precola = 0, cola = 1, centro = 2, cabeza = 3, brinco = 1;
      
      println(precola+", "+cola+", "+centro+", "+cabeza);
      while (centro < Puntos.length){
      
        if ( myStack.search (Puntos[centro]) < 0 ){ 
        
          myStack.push(Puntos[centro]);
          //println("ya meti este: " +  Puntos[centro]);  
        }
        
        //(Point2D)elementAt(myStack.size()-2)
        
        
        if ( area2(Puntos[cola], Puntos[centro], Puntos[(cabeza % Puntos.length)]) > 0 ){
        //if ( area2(   (Point2D) myStack.elementAt(myStack.size()-1), (Point2D) myStack.elementAt(myStack.size()-2), Puntos[(cabeza % n)]   ) > 0 ){
           
           
           //precola = cola;
           cola = centro;
           centro = cabeza;
           cabeza = cabeza + 1;        
        }
        else{
          if( area2(Puntos[cola], Puntos[centro], Puntos[(cabeza % Puntos.length)]) <= 0 ) {
          //if(  myStack.size() >= 3) {
          myStack.pop();
          //println("ya saque este: " +Puntos[centro]);   
              
        
        
          centro = cabeza;
          cabeza = cabeza + 1; 
          // cola = cola-1; // asi no sirve, tiene que retroceder un indice en el estac, no en el array
          //cola = precola;
          //}
          }
          
                
        }
        
         
        
        
      }
      
      println(precola+", "+cola+", "+centro+", "+cabeza);
      
      //println(Puntos.length);
      //println(myStack.size());
      
      
      
      
      Point2D[] CasiConvexo = new Point2D[myStack.size()];
      //println(Convexo.length);
      
        
      for(int i =0; i<myStack.size(); i++){      
        CasiConvexo[i] = (Point2D) myStack.toArray()[i];
        
      }
      

      
      myStack.removeAllElements();
      
      return(CasiConvexo);


}

void ordenadorPolar(Point2D[] P){
     int n = P.length;
     int menor;
     int primero = indexMinY(P);
     
     
     
     //println("antes:");
     //println("P[0] "+ P[0].x + ", " + P[0].y+" P[primero] "+ P[primero].x +", " + P[primero].y);  // for debugging   

     // ahora si a ordenar
     
     
     
     intercambio(P,0,primero); //parece que funciona
     
     
     
     //println("despues:");
     //println("P[0] "+ P[0].x + ", " + P[0].y+" P[primero] "+ P[primero].x +", " + P[primero].y);  // for debugging   
     
     // ordenaci—n por seleccion
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








int indexMinX (Point2D[] P)
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



int indexMinY (Point2D[] P)
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












