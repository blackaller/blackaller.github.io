// noviembre 1
// laberintos 1 (rorschach)

PImage world; 

int W = 400, H = 400;
int eX  = W/2; int eY = W/2;
int peX  = W/2; int peY = W/2;
float proba = 0.6f;
int keyCont = 0;
int relleno = 1;




 
void setup(){  
  // size(W,H);
  size(400,400);
  
  background(255);
  ellipseMode(CENTER_RADIUS);
  smooth();
  fill(255,20,30);
  stroke(0);
  world = loadImage("horizontal.tga"); 
  //world = loadImage("bitmap_0.tga"); 
  
  //image(world, 0, 0, W,H); 

  
  


  

}




void mousePressed(){background(255);}
 
void keyPressed(){

  relleno = (relleno+1) % 2;
   
  keyCont = (keyCont+1) % 3;
  println(keyCont);

  if(keyCont==1)proba = 0.8f;
  
  else if (keyCont==2)proba = 0.4f;  
  
        else if (keyCont==0)proba = 0.6f;
        
        
   

}


void draw(){
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
    

    fill(255*relleno,20*relleno,30*relleno);
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
