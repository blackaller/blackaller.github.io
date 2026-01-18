// unfolding sequences of triangles in kn

//the blue is a band
//the white sometimes
//crystal or flower



int num = int(random(5,17));
int piso, techo, pizq, pdere;
int veladura = 50;


                  
float elasticidad = 0.1;                       
float friccion = 0.1; 
float t = 0;

Pelota[] pelotas = new Pelota[num];    
Pelota[] pelotas2 = new Pelota[num];                     
                                              
                                                                     
                                                                                            
                                                                                                                                          

void setup()
{
  size(400,400);
  background(255,20,30);
  framerate(24);
  smooth();
  ellipseMode(CENTER_RADIUS);
  
  piso = 15*height/16;
  
  techo = height/16;
  pdere = 15*width/16;
  pizq = width/16;
  

  for ( int i=0; i<num; i++ )
  {
    pelotas[i] = new Pelota();
    pelotas2[i] = new Pelota();
    
    pelotas[i].x = width/2+ width/4 * cos(i*(2*PI/num));
    pelotas[i].y = width/2+ width/4 * sin(i*(2*PI/num));
    pelotas2[i].x = width/2+ width/4 * cos( (PI/num) + i*(2*PI/num) );
    pelotas2[i].y = width/2+ width/4 * sin( (PI/num) + i*(2*PI/num) );
   
    
    
  }
  noLoop();
}

void draw()
{


  background(255,20,30);

  
  

  for ( int i=0; i<num; i++ )
  {

    
    if(!keyPressed) {
    pelotas[i].desviacion();
    pelotas2[i].desviacion();
    
    pelotas2[i].rebote();
    pelotas[i].rebote();
    
    pelotas[i].choque();
    pelotas2[i].choque();
    
    
    pelotas[i].desplazamiento();
    pelotas2[i].desplazamiento();
    }
 
  
    for(int j = 0; j < i; j++){
      //stroke(255-4*i,24*(1+i));
      //line(pelotas[j].x, pelotas[j].y, pelotas[i].x, pelotas[i].y);
      //stroke(4*i,24*(1+i));
      //line(pelotas2[j].x, pelotas2[j].y, pelotas2[i].x, pelotas2[i].y);
     }
      
    stroke(0,100);
    fill(0,0,255,(255/(2*num))*(1+i));
      triangle(pelotas[i].x, pelotas[i].y,
               pelotas[(i+1)  % num].x, pelotas[(i+1)  % num].y,
               pelotas[(i+2)  % num].x, pelotas[(i+2)  % num].y);
    //pelotas[i].display();
    
    stroke(0,100);
      fill(255,(255/(2*num))*(1+i));
      triangle(pelotas2[i].x, pelotas2[i].y,
               pelotas2[(i+2)  % num].x, pelotas2[(i+2)  % num].y,
               pelotas2[(i+4)  % num].x, pelotas2[(i+4)  % num].y);
      
    
    //pelotas2[i].display();
    
    
  }
  
  
  
  
  
}

void mousePressed(){
  background(255,20,30);
 for(int i = 0; i < num; i++){
  for(int j = 0; j < i; j++){
      stroke(0,0,255-4*i,120);
      line(pelotas[j].x, pelotas[j].y, pelotas[i].x, pelotas[i].y);
      stroke(255 - 4*i,120);
      line(pelotas2[j].x, pelotas2[j].y, pelotas2[i].x, pelotas2[i].y);
     }
  }


  noLoop();
}

void mouseReleased(){
  loop();
  }


void keyPressed(){ 

  if(t<=1){

  for(int i=0;i<num;i++){
    pelotas[i].x = (1-t)*pelotas[i].x+         t*(width/2+ width/4 * cos(i*(2*PI/num)));
    pelotas[i].y =  (1-t)*pelotas[i].y+       t*(width/2+ width/4 * sin(i*(2*PI/num)));
    pelotas2[i].x =  (1-t)*pelotas2[i].x+       t*(width/2+ width/4 * cos( (PI/num) + i*(2*PI/num) ));
    pelotas2[i].y =   (1-t)*pelotas2[i].y+      t*(width/2+ width/4 * sin( (PI/num) + i*(2*PI/num) ));
    }
    
    t = t+0.01f;
    }
    else noLoop();


}

void keyReleased(){loop();t = 0;}




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
    radio = 2;
    masa = 20;
    atraccion = masa;

    velx = random(-.5f,.5f);
    velx = random(-.2f,.2f);
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
    for ( int i=0; i<num; i++ ){
      float X = pelotas2[i].x;
      float Y = pelotas2[i].y;
      float vX = pelotas2[i].velx;
      float vY = pelotas2[i].vely;
      float R = pelotas2[i].radio;
      float M = pelotas2[i].masa;
      float A = pelotas2[i].atraccion;
      
      float deltax = (vX-velx);
      float deltay = (vY-vely);
      float d = sqrt(sq(deltax)+sq(deltay));
      
      if ( d < sqrt(atraccion + A) && d > 0 ){
        float dD = d;
        float theta = atan2(y-Y,x-X);
        
        
        if(((vX>velx)&&(vY>vely))||(R>radio)){
          velx += dD*cos(theta)*M/(masa+M);
          vely += dD*sin(theta)*M/(masa+M);
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
  
  /****** rebote en redondo (todavia no)******/
 void rebote(){
 
 
   //if(   sq(x)+sq(y)  >   width/2  )
 
 
 
 
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
    if ( x + velx + radio > pdere ){
      x = pdere - radio;
      velx *= -elasticidad;
      vely *= friccion;
    }
    if ( x + velx - radio < pizq ){
      x = pizq + radio;
      velx *= -elasticidad;
      vely *= friccion;
    }
  }
  
  
 /***** rebote viejo *****/
 /* void rebote(){
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
  }*/
  
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
    for ( int i=0; i<num; i++ ){
      float X = pelotas2[i].x;
      float Y = pelotas2[i].y;
      float R = pelotas2[i].radio;
      float M = pelotas2[i].masa;
      
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

    stroke(0);
    

    if (c<0.75f)  fill(0,100);
    else if (c>=0.45f) fill(255,255,255,200);

  }
}



