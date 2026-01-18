import processing.core.*; import java.applet.*; import java.awt.*; import java.awt.image.*; import java.awt.event.*; import java.io.*; import java.net.*; import java.text.*; import java.util.*; import java.util.zip.*; public class spin_1 extends PApplet {// who is the leader
// they all attract each other, but they dont want to stay too close
// they dont want to stay still, yet sometimes they have to.


int selector = -1;
int num = 40; // 1 y 10 son buenos
//int num = 3; //carambola
int piso, techo, pizq, pdere;
int veladura = 50;

float gravedad = 0.2f; // .8 es bueno pero probaremos definir una gravedad local  
//float gravedad = 0.0;   // mesa de billar                     
float elasticidad = 0.82f;  // afecta el rebote en general                        
float friccion = 0.82f; // controla la horizontal del rebote   

Pelota[] pelotas = new Pelota[num];                     
                                              
                                                                     
                                                                                            
                                                                                                                                          

public void setup()
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

public void draw()
{



  /*if ( keyPressed ){
    if (veladura == 50) veladura = 2;
    else if(veladura == 2) veladura =50;
  }*/
  
  background(255,20,30);
   //fill(255,20,30,1); // supereslinkis
   //fill(255,20,30,veladura); // eslinkis
  // fill(255,20,30,100);//pelotas
  //fill(255,20,30,250);//pelotas
  
  stroke(0);
  //line(pizq,piso,pdere,piso);
  //rect(0,0,width,height);
  
  
  if ( mousePressed){
    pezcar();
  }
  
  

  for ( int i=0; i<num; i++ )
  {
    pelotas[i].caida();
    pelotas[i].desviacion();
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



class Pelota{
  Polygon p;
  float c =random(1,1);
  float radio;
  float masa;
  float atraccion;
  
  float x;
  float y;
  
  float velx;
  float vely;
  
  Pelota(){
    p = new Polygon();
    p.vertices=PApplet.toInt(random(3,8));
    
    radio = PApplet.toInt(random(10,20));
    masa = radio;
    atraccion = masa;
    x = random(radio,width-radio);
    y = random(radio,techo );
    velx = random(-2,2);
  }
  
  public void caida(){
    vely += gravedad;
  }
  
  
  public void desviacion(){
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
  
  
  
  
  public void rebote(){
    if ( y + vely + radio > piso ){ // el piso la orilla es igual a width
      y = piso - radio;
      velx *= .4f+friccion;
      vely *= -.4f-elasticidad;
    }
    if ( y + vely - radio < techo ){ // el techo en la orilla es igual a cero
      y = techo + radio;
      velx *= friccion;
      vely *= -elasticidad;
    }
    if ( x + velx + radio > width ){
      x = width - radio;
      velx *= -.4f-elasticidad;
      vely *= .4f+friccion;
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
    //p.rotation=p.rotation + 1/(sq(velx)+sq(vely));
    p.rotation=p.rotation + 1/(sq(velx)-sq(vely));
    
    
  }
  
  
   
  public void display(){
    
    p.centerx=x;
    p.centery=y;
    p.radius=radio;
    //p.rotation=PI/3;
  
  
    //float c =random(0,1);
    stroke(0);
    
    //noStroke();
    if (c<0.75f)  fill(0,100);
    else if (c>=0.45f) fill(255,255,255,200);
    ellipse(x,y,radio/3,radio/3);
    //line(x+radio, y, x,y);
    //line(x, y-radio, x,y);
    noStroke();
    p.displayFill();
   
    
  }
}


class Polygon
{
	int vertices;
	float centerx;
	float centery;
	float radius;
	float rotation;

	Polygon (int ivert, float ictrx, float ictry, float irad, float irot)
	{	
			vertices = ivert;
			centerx = ictrx;
			centery = ictry;
			radius =  irad;
			rotation = irot;
	}
        Polygon ()
	{	
			vertices = this.vertices;
			centerx = this.centerx;
			centery = this.centery;
			radius =  this.radius;
			rotation = this.rotation;
	}

        







	public void display() {
        //println(vertices+","+centerx+","+centery+","+radius+","+rotation);
           for (int i = 0; i<vertices; i++) {
           //println(i);
           line(centerx+radius*cos(i*(2*PI/vertices)+rotation), centery+radius*sin(i*(2*PI/vertices)+rotation), centerx+radius*cos((i+1)*(2*PI/vertices)+rotation), centery+radius*sin((i+1)*(2*PI/vertices)+rotation));
        //println(centerx+radius*sin(i*(2*PI/vertices))+","+ centery+radius*cos(i*(2*PI/vertices))+","+ centerx+radius*sin((i+1)*(2*PI/vertices))+","+ centery+radius*cos((i+1)*(2*PI/vertices)));
           }
        }
        public void displayFill() {
          beginShape(POLYGON); 
            for (int i = 0; i<vertices; i++) {
            vertex(centerx+radius*cos(i*(2*PI/vertices)+rotation), centery+radius*sin(i*(2*PI/vertices)+rotation)); 
            //vertex(centerx+radius*cos((i+1)*(2*PI/vertices)+rotation), centery+radius*sin((i+1)*(2*PI/vertices)+rotation));
             }
         endShape();
      
        }

}










static public void main(String args[]) {   PApplet.main(new String[] { "spin_1" });}}