import processing.core.*; import java.applet.*; import java.awt.*; import java.awt.image.*; import java.awt.event.*; import java.io.*; import java.net.*; import java.text.*; import java.util.*; import java.util.zip.*; public class imageBolita_0c extends PApplet {// noviembre 1
// laberintos 1 (rorschach)

/* Notas: en principio quiero hacer una  bolita que camine aleatoriamente por la parte blanca de una imagen 
y que no pueda entrar a la negra pero que esto la haga cambiar de direcci\u00f3n, o mejor, que se mueva libremente en lo blanco y cautelosamente en lo negro.
despu\u00e9s pens\u00e9 que la imagen podr\u00eda ser definida por las trayectorias de la misma bolita, de manera que la bolita cambie de
comportamiento cuando pase por un lugar del canvas donde ya estuvo suficientemente cercano para que se acuerde (loadPixels() en cada loop y usar
s\u00f3lamente los pixels cercanos a d\u00f3nde anda la bolita. necesito AI para la bolita*/

// tons a veces entra de un color a otro y a veces no puede cambiar de color
// radar para tratar de permanecer en blanco?
// la bolita debe ser un vector es decir por lo menos (posici\u00f3n, direcci\u00f3n, velocidad) + memoria, percepcion, y accion-opcion
   

// the creation of a simple world from a black and white image and a tangerine particle
// tangerine dream
// black and white could mean open and closed

PImage world; 

int W = 400, H = 400;
int eX  = W/2; int eY = W/2;
int peX  = W/2; int peY = W/2;
float proba = 0.6f;
int keyCont = 0;
int relleno = 1;




 
public void setup(){  
  // size(W,H);
  size(400,400);
  
  background(255,20,30);
  ellipseMode(CENTER_RADIUS);
  smooth();
 
  stroke(0);
  world = loadImage("horizontal.tga"); 
  //world = loadImage("bitmap_0.tga"); 
  
  //image(world, 0, 0, W,H); 

  
  


  

}




public void mousePressed(){  background(255,20,30);}
 
public void keyPressed(){

  relleno = (relleno+1) % 2;
   
  keyCont = (keyCont+1) % 3;
  println(keyCont);

  if(keyCont==1)proba = 0.8f;
  
  else if (keyCont==2)proba = 0.4f;  
  
        else if (keyCont==0)proba = 0.6f;
        
        
   

}


public void draw(){
    //float r = random(-0.1f,1.1f);
    float r = random(-0.1f,1.2f);
    int direccion;
    
    

    
    if(eX==0) eX=eX+1;
    if(eY==0) eY=eY+1;
    
    
    
    if (r < proba) direccion = 2; 
    else direccion = -3;

    
    /*scale(1/sqrt(2));
    translate(sqrt(2)*width/2,sqrt(2)*height/2-(height/sqrt(2))    );
    rotate(PI/4);*/
    

    fill(0,0,255*relleno);
    //println( eX + " " + eY   );
    ellipse(abs(eX),abs(eY),5*r,5*r);
    
    
    
    
    
    fill(255*relleno);
    
    ellipse(abs(eY),abs(eX),5*r,5*r); 

    peX=eX;
    peY=eY;
    
    
             
    
      if ( red (world.pixels[ abs(eX*eY)   ])<=120)
              //eX= abs(eX-direccion) % width;
              //eX= abs(eX-direccion) % width;
              eX= (eX-direccion) % width;
             
             
        else
        if ( red (world.pixels[ abs(eX*eY)   ])>120)
             //eY= abs(eY-direccion) % height;
             //eY= abs(eY-direccion) % height; 
             eY= (eY-direccion) % height;    
        //println(eX+" " +eY);       
    

}
}