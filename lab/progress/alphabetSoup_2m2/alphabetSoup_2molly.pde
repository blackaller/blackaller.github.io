// information. reading a simple relation. alphabet city.
// leopold bloom is in manhattan.
// typewriter.
// letters will read from Ulysses last chapter and try to remember their neighbours.
// it seems molly bloom never used the "z"


int piso, techo, pizq, pdere;


//  String alfabeto = "!ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz?1234567890";
//  String alfabeto = "QWERTYUIOPASDFGHJKLZXCVBNM?qwertyuiopasdfghjklzxcvbnm!1234567890";
    String alfabeto = "QqWwEeRrTtYyUuIiOoPpAaSsDdFfGgHhJjKkLlZzXxCcVvBbNnMm?!1234567890";
//  String alfabeto = "qwertyuiopasdfghjklzxcvbnm";

String alfabetote = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

int num = alfabeto.length();

int lector = 0;
  
float gravedad = 0;
float elasticidad = 0;
float friccion = 0;


boolean arrancar = false;


PFont font; 

byte book[];


Pelota[] pelotas = new Pelota[num];                     
                                              
                                 
                                                                                            
                                                                                                                                          

void setup()
{
  size(400,400);
  background(255,20,30);
  framerate(30);
  ellipseMode(CENTER_RADIUS);
  noLoop();
  
  
  font = loadFont("Monaco-12.vlw"); 
  
  
  
  
  book = loadBytes("mollyBloom.txt"); // book.length = 120366

  piso = height;

  techo = 0;
  pdere = width;
  pizq = 0;
  


  for ( int i=0; i<num; i++ )
  {    
      float cambio = random(0f,1.9f);
      int valor = (1)*(i+1);
   
      pelotas[i] = new Pelota();
     
      
      pelotas[i].x = coordenadas(valor).x * width/10;
      pelotas[i].y = coordenadas(valor).y * height/10;
      pelotas[i].letra = alfabeto.charAt(i%alfabeto.length());
    
    
  }

  

  

} 

void draw()
{

  fill(255,20,30,1); 
  stroke(0);
  rect(0,0,width,height);
  
  char letra;
  char siguiente;
  
  fill(255);noStroke();
  rect(0,15*height/16,width,height/16);
  
  letra = char(book[lector]);
  siguiente = char(book[(lector+1) % book.length]);
  
  for ( int i=0; i<num; i++ )
  {  
    
    
    letra = char(book[lector]);
    siguiente = char(book[(lector+1) % book.length]);
    
    for ( int j=0; j<num; j++ ){
      if (i!=j && letra == pelotas[i].letra && siguiente == pelotas[j].letra) {
      
        conexion( pelotas[i], pelotas[j]);
        noStroke();
        fill(0);
        smooth();
        ellipse( pelotas[i].x, pelotas[i].y, pelotas[i].radio + 3, pelotas[i].radio + 3);
       }
    
    
    }  

    
    if (letra == pelotas[i].letra) {pelotas[i].display();}
    
    for ( int j=0; j<num; j++ ){
      if (i!=j && letra == pelotas[i].letra && siguiente == pelotas[j].letra) {
        /*pelotas[i].display();*/
        pelotas[j].display();
        pelotas[i].radio = pelotas[i].radio;
        }
    
    
    }
    if (letra == pelotas[i].letra) {pelotas[i].display();}
    
    
    
  }
  
  
  
   for ( int j=0; j<num; j++ ){
   
    fill(0);
    textFont(font, 10); 
    text(char(book[lector+j]), (j+1)*10, height -10);   
   
   
   }
  if (lector+1 < book.length) {lector = (lector+1);} 
  
  println("lector is in: "+lector);
  

}

void mousePressed(){

   if(!arrancar) {
     loop();
   }

   else{
     if(mouseY < 15*height/16){
       background(255,20,30);
     }
   }
   arrancar = true;

}



void keyPressed(){

noLoop();
}

void keyReleased(){
loop();
}
     

void conexion(Pelota A, Pelota B){
  float mirand = random(-1,1);

  stroke(0,50);
  line (A.x + A.radio*mirand/2, A.y+A.radio*mirand/2, B.x+B.radio*mirand/2, B.y+B.radio*mirand/2);

}

// hacer una clase conector(Alambre). una vez que dos nodos est‡n relacionados conserva esa relaci—n. y tiene su propio radio y su propio mŽtodo display,
// de manera que en lugar de dibujar rayitas a lo wei cada vez que una conexion vuelve a aparecer, lo que hago es engrosar el radio del Alambre que une ambos nodos.





Point2D coordenadas(int i){
    Point2D A =  new Point2D();
    
 
    if (i % 9 != 0){
       A.x = i % 9;
       A.y = ceil(i/9f);
     
    }
    else{
      A.x = 9;
      A.y = ceil(i/9f);
    
    }
    
    return(A);

}









class Pelota{
  float c =random(0,1);
  float radio;
  float masa;
  
  float x;
  float y;
  
  float velx;
  float vely;
  
  char letra;
  
  Pelota(){
   // radio = width/(2*alfabeto.length());
    radio = 1.5*width/(alfabeto.length());
    masa = radio;
    //x = random(radio,width-radio);
    //y = random(radio,techo + height/2);
    
    
    
    velx = random(-0,0);
    letra = 'a';
    
  }
  
  void caida(){
    if (radio >= width/8)
    vely += gravedad;
  }
  
  void rebote(){
    if ( y + vely + radio > piso ){ // el piso la orilla es igual a width
      y = piso - radio;
      velx *= friccion;
      vely *= -elasticidad;
    }
    if ( y + vely - radio < techo ){ // el techo en la orilla es igual a cero
      y = techo + radio;
      velx *= friccion;
      vely *= -elasticidad;
    }
    if ( x + velx + radio > width ){
      x = width - radio;
      velx *= -elasticidad;
      vely *= friccion;
    }
    if ( x + velx - radio < 0 ){
      x = radio;
      velx *= -elasticidad;
      vely *= friccion;
    }
  }
  
  void choque(){
    for ( int i=0; i<num; i++ ){
      float X = pelotas[i].x;
      float Y = pelotas[i].y;
      float R = pelotas[i].radio;
      float M = pelotas[i].masa;
      
      float deltax = X-x;
      float deltay = Y-y;
      float d = sqrt(sq(deltax)+sq(deltay));
      
      if ( d < radio + R && d > 0 ){
        float dD = radio + R - d;
        float theta = atan2(deltay,deltax);
        
        velx += -dD*cos(theta)*M/(masa+M);
        vely += -dD*sin(theta)*M/(masa+M);
        
        velx *= elasticidad;
        vely *= elasticidad;
      }
    }
  }
  
  void desplazamiento(){
    x += velx;
    y += vely;
  }
  
  void display(){
    //float c =random(0,1);
    smooth();
    noStroke();
    if (c<0.45f)  fill(0,0,255);
    else if (c>=0.45f) fill(255,255,255); 
    ellipse(x,y,radio,radio);
    
    if (c<0.45f)  fill(255);
    else if (c>=0.45f) fill(0);
    
    
    // textFont(font, radio*2); // good for alone
    // text(letra, x-radio/2, y+radio/2);   // good for alone
    
    textFont(font, radio*1.2); // good for in ellipse
    text(letra, x-radio/3, y+radio/2.5);   // good for in ellipse
    
    
  }
}





class Point2D
{ 
  float x;
  float y;
  
  Point2D (){  
    x = this.x;
    y = this.y;
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








