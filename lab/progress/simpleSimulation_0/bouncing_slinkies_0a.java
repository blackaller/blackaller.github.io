import processing.core.*; import java.applet.*; import java.awt.*; import java.awt.image.*; import java.awt.event.*; import java.io.*; import java.net.*; import java.text.*; import java.util.*; import java.util.zip.*; public class bouncing_slinkies_0a extends PApplet {int selector = -1;
int num = PApplet.toInt(random(2,9));
//int num = 3; //carambola
int piso, techo, pizq, pdere;

float gravedad = 0.40f;  
//float gravedad = 0.0;   // mesa de billar                     
float elasticidad = 0.95f;                          
float friccion = 0.70f;   

Pelota[] pelotas = new Pelota[num];                     
                                              
                                                                     
                                                                                            
                                                                                                                                          

public void setup()
{
  size(400,400);
  background(255,20,30);
  framerate(24);
  smooth();
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

public void draw()
{
  //background(255,20,30);
  // fill(255,20,30,1); // supereslinkis
  fill(255,20,30,10); // eslinkis
  // fill(255,20,30,100);//pelotas
  //fill(255,20,30,250);//pelotas
  
  stroke(0);
  line(pizq,piso,pdere,piso);
  rect(0,0,width,height);
  
  
  if ( mousePressed){
    pezcar();
  }
  
  if ( keyPressed ){
    agitar();
  }

  for ( int i=0; i<num; i++ )
  {
    pelotas[i].caida();
    pelotas[i].rebote();
    pelotas[i].choque();
    pelotas[i].desplazamiento();
    pelotas[i].display();
  }
}

public void mousePressed(){

  for ( int i=0; i<num; i++ ){
    if ( abs(mouseX-pelotas[i].x) < pelotas[i].radio && abs(mouseY-pelotas[i].y) < pelotas[i].radio ) selector = i;
  }
}

public void mouseReleased(){selector = -1;}



public void pezcar(){
  if ( selector >= 0 ){
    pelotas[selector].x = mouseX;
    pelotas[selector].y = mouseY;
  
    pelotas[selector].vely = mouseY-pmouseY;
    pelotas[selector].velx = mouseX-pmouseX;
  }
}



public void agitar(){
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
  
  Pelota(){
    radio = random(20,50);
    masa = radio;
    x = random(radio,width-radio);
    y = random(radio,techo + height/2);
    velx = random(-2,2);
  }
  
  public void caida(){
    vely += gravedad;
  }
  
  public void rebote(){
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
  
  public void choque(){
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
  
  public void desplazamiento(){
    x += velx;
    y += vely;
  }
  
  public void display(){
    //float c =random(0,1);
    stroke(0);
    if (c<0.45f)  fill(0,0,255,100);
    else if (c>=0.45f) fill(255,255,255,100);
    ellipse(x,y,2*radio,2*radio);
    
  }
}



}