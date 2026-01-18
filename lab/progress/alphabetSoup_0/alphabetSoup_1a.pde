// information. reading simple relationships.
// letters will read from Moby Dick and grow every time they see themselves until they reach a certain size that fits the canvas.
// this is a visual evidence of the fact that "e" is the most commonly used letter in english.
// and i guess "x" or "z" would be the least. 
// or Herman Melville loved the "e"?





int selector = -1;

//int num = 3; //carambola
int piso, techo, pizq, pdere;


String alfabeto = "abcdefghijklmnopqrstuvwxyz";
String alfabetote = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

int num = alfabeto.length();

int lector = 0;

char letra;
boolean muchoRadio= true;


PFont font; 

byte book[];










float gravedad = 0.8;  
//float gravedad = 0.0;   // mesa de billar                     
float elasticidad = 0.95;   //.95                       
float friccion = 0.75;   //.75



Pelota[] pelotas = new Pelota[num];                     
                                              
                                          
                                                                                            
                                                                                                                                          

void setup()
{
  size(400,400);
  background(255,20,30);
  framerate(24);
  
  
  font = loadFont("Monaco-12.vlw"); 
  
  
  smooth();
  
  book = loadBytes("mobyDick.txt"); // book.length = 1221069
  piso = height;
  //techo = height - 15*height/16;
  techo = 0;
  pdere = width;
  pizq = 0;
  
  letra = char(book[lector]);
  
  
  //noStroke();

  for ( int i=0; i<num; i++ )
  {
    pelotas[i] = new Pelota();
    pelotas[i].x = (i+.75)*2*(pelotas[i].radio); // i+.75 for w=800, i+1.75 for w = 400.
    pelotas[i].y = height/2;
    pelotas[i].letra = alfabeto.charAt(i%alfabeto.length());
    
  }

} 

void draw()
{
  background(255,20,30);
  // fill(255,20,30,1); // supereslinkis
  //fill(255,20,30,10); // eslinkis
  // fill(255,20,30,100);//pelotas
  //fill(255,20,30,250);//pelotas
  
  stroke(0);
  line(pizq,piso,pdere,piso);
  //rect(0,0,width,height);
  
  
  if ( mousePressed){
    pezcar();
  }
  
  if ( keyPressed ){
    // agitar();
  }
  
  float sumRadios=0;
  
  for ( int i=0; i<num; i++ )
  {  
    if (lector+1 < book.length) {lector = (lector+1);}
    
    letra = char(book[lector]);
    
    //if ((letra == pelotas[i].letra) && (muchoRadio)) {pelotas[i].radio = pelotas[i].radio+.4;} // este incremento lee 67210 caracteres de 1221069
    //if ((letra == pelotas[i].letra) && (muchoRadio)) {pelotas[i].radio = pelotas[i].radio+.2;} // este incremento lee 133146 caracteres de 1221069
    if ((letra == pelotas[i].letra) && (muchoRadio)) {pelotas[i].radio = pelotas[i].radio+.1;} // este incremento lee 268554 caracteres de 1221069
    
    
    sumRadios=sumRadios+pelotas[i].radio;
    
    
    pelotas[i].caida();
    pelotas[i].rebote();
    pelotas[i].choque();
    pelotas[i].desplazamiento();
    pelotas[i].display();
  }
  
  // i want PI*SUM(sq(allRadios) <= W*H 1200
  if (sumRadios > 950) {muchoRadio = false;}
  else println("lector is in: "+lector+" and sumradios is: " +sumRadios);
  
  sumRadios=0;
}

void mousePressed(){

  for ( int i=0; i<num; i++ ){
    if ( abs(mouseX-pelotas[i].x) < pelotas[i].radio && abs(mouseY-pelotas[i].y) < pelotas[i].radio ) selector = i;
  }

}

void mouseReleased(){selector = -1;}



void keyPressed(){

noLoop();
}

void keyReleased(){
loop();
}



void pezcar(){
  if ( selector >= 0 ){
    pelotas[selector].x = mouseX;
    pelotas[selector].y = mouseY;
  
    pelotas[selector].vely = mouseY-pmouseY;
    pelotas[selector].velx = mouseX-pmouseX;
  }
}



void agitar(){
  for ( int i=0; i<num; i++ ){
    pelotas[i].velx += random(-4,4);
    pelotas[i].vely += random(-4,4);
  }
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
    radio = width/(2*alfabeto.length());
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
    stroke(0);
    if (c<0.45f)  fill(0,0,255);
    else if (c>=0.45f) fill(255,255,255); 
    //ellipse(x,y,2*radio,2*radio);
    
    if (c<0.45f)  fill(255);
    else if (c>=0.45f) fill(0);
    
    
    textFont(font, radio*2); // good for alone
    text(letra, x-radio/2, y+radio/2);   // good for alone
    
    //textFont(font, radio*1.2); // good for in ellipse
    //text(letra, x-radio/3, y+radio/2.5);   // good for in ellipse
    
    
  }
}



