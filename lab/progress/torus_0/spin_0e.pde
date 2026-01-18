
// live in a torus
// daddydaddy im here!
// pacman or ultraman


int selector = -1;
int num = 17; // 1 y 10 son buenos
//int num = 3; //carambola
int piso, techo, pizq, pdere;
int veladura = 50;

float gravedad = 0.1; // .8 es bueno pero probaremos definir una gravedad local  
//float gravedad = 0.0;   // mesa de billar                     
float elasticidad = 0.84;  // afecta el rebote en general                        
float friccion = 1; // controla la horizontal del rebote   

Pelota[] pelotas = new Pelota[num];                     
                                              
                                                                     
                                                                                            
                                                                                                                                          

void setup()
{
  size(400,400);
  background(255,20,30);
  framerate(24);
  smooth();
  ellipseMode(CENTER_RADIUS);
  
  piso = height;
  //techo = height - 15*height/16;
  techo = 0;
  pdere = width;
  pizq = 0;
  
  
  //noStroke();

  for ( int i=0; i<num; i++ )
  {
    pelotas[i] = new Pelota();
  }

}

void draw()
{



  /*if ( keyPressed ){
    if (veladura == 50) veladura = 2;
    else if(veladura == 2) veladura =50;
  }*/
  
  background(255);

 
  
  
  if ( mousePressed){
    pezcar();
  }
  
  
  pelotas[0].radio=60;
  
  
  

  for ( int i=0; i<num; i++ )
  {
    pelotas[i].caida();
    pelotas[i].desviacion();
    pelotas[i].rebote();
    pelotas[i].choque();
    
    pelotas[i].desplazamiento();
    //stroke(0, 255 - sqrt( sq (pelotas[i].x-pelotas[0].x) + sq(pelotas[i].y-pelotas[0].y)       ));
    //line(pelotas[0].x, pelotas[0].y, pelotas[i].x, pelotas[i].y);
    
    //stroke(255, 255 - sqrt( sq (pelotas[i].x-pelotas[0].x) + sq(pelotas[i].y-pelotas[0].y)       ));
    //for(int j = 1; j < i; j++){line(pelotas[j].x, pelotas[j].y, pelotas[i].x, pelotas[i].y);}
    
    
    //if (i>0)
    pelotas[i].display();
    
    
    
    
  }
  //pelotas[0].display();
  
  
  pelotas[0].x=width/2;
  pelotas[0].y=height/2;
  
  
}

void mousePressed(){

  for ( int i=1; i<num; i++ ){
    if ( abs(mouseX-pelotas[i].x) < pelotas[i].radio && abs(mouseY-pelotas[i].y) < pelotas[i].radio ) selector = i;
  }
}

void mouseReleased(){selector = -1;}



void pezcar(){
  if ( selector >= 0 ){
    pelotas[selector].x = mouseX;
    pelotas[selector].y = mouseY;
  
    pelotas[selector].vely = mouseY-pmouseY;
    pelotas[selector].velx = mouseX-pmouseX;
  }
}



class Pelota{
  float c =random(1,1);
  float radio;
  float masa;
  float atraccion;
  
  float x;
  float y;
  
  float velx;
  float vely;
  
  Pelota(){
    radio = int(random(20,20));
    masa = radio;
    atraccion = masa;
    x = random(radio,width-radio);
    y = random(radio,techo );
    velx = random(-2,2);
  }
  
  void caida(){
    vely += gravedad;
  }
  
  
  void desviacion(){
    for ( int i=0; i<num; i++ ){
      float X = pelotas[i].x;
      float Y = pelotas[i].y;
      float vX = pelotas[i].velx;
      float vY = pelotas[i].vely;
      float R = pelotas[i].radio;
      float M = pelotas[i].masa;
      float A = pelotas[i].atraccion;
      
      float deltax = (vX-velx);
      float deltay = (vY-vely);
      float d = sqrt(sq(deltax)+sq(deltay));
      
      if ( d < sqrt(atraccion + A) && d > 0 ){
        float dD = d;
        float theta = atan2(y-Y,x-X);
        
        
        if(((vX>velx)&&(vY>vely))||(R>radio)){
          velx += -dD*cos(theta)*M/(masa+M);
          vely += -dD*sin(theta)*M/(masa+M);
        }
        else{
          //velx += dD*cos(theta)*M/(masa+M)/2;
          //vely += dD*sin(theta)*M/(masa+M)/2;
          velx = velx;
          //vely = vely;
        }
        
        
        
        
        
      }
    }
  }
  
  
  
  
  void rebote(){
    if ( y   > piso ){ // el piso la orilla es igual a width
      /*y = piso - radio;
      velx *= friccion;
      vely *= -elasticidad;*/
       y = techo;
      velx *= friccion;
      vely *= elasticidad;
      
      
      
      
    }
    if ( y  < techo ){ // el techo en la orilla es igual a cero
      y = piso ;
      velx *= friccion;
      vely *= elasticidad;
    }
    if ( x  > width ){
      /*x = width - radio;
      velx *= -elasticidad;
      vely *= friccion;*/
      
      x = 0;
      velx *= elasticidad;
      vely *= friccion;
      
      
      
    }
    if ( x  < 0 ){
      x = width ;
      velx *= elasticidad;
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
  
  
  void spin(){
    
    
  }
  
  
  void display(){
    //float c =random(0,1);
    stroke(0);
    
    
    //noStroke();
    if (c<0.75f)  fill(0,100);
    else if (c>=0.45f) fill(255,20,30,200);
    ellipse(x,y,radio,radio);
    fill(255,255,255,100);
    ellipse(x+radio/2,y+radio/2,radio/4,radio/4);
    ellipse(x-radio/2,y-radio/2,radio/4,radio/4);
    line(x+radio, y, x,y);
    line(x, y-radio, x,y);
    
    
  }
}



