import processing.core.*; import java.applet.*; import java.awt.*; import java.awt.image.*; import java.awt.event.*; import java.io.*; import java.net.*; import java.text.*; import java.util.*; import java.util.zip.*; public class imageCountColor_0correct extends PApplet {// white #FFFFFF against black #000000

//brighter floats and darker sinks

//grayscale and even color... reordering from bright to dark (not yet)
//for now just separating bright from dark
// interesting values:

/*

50%: #808080, #7F7F7F
75%: gray75 #BFBFBF gray76 #C2C2C2 gray77 #C4C4C4 gray78 #C7C7C7
25%: gray22 #383838 gray23 #3B3B3B gray24 #3D3D3D gray25 #404040 gray26 #424242 gray27 #454545 gray28 #474747 gray29 #4A4A4A


*/



//by luis blackaller


PImage pic1; 
PFont font; 

int halfImage; 
int imgCenter;


int white = 0, black = 0;
float averageWhite, averageBlack;


int stepX=0;
int stepY=0;
int numBlack=0;
int numWhite=0;
int stepW=0;
int stepB=0;
int imageChoice = PApplet.toInt(random(0f,2.999f));
//int imageChoice = 2;

public void setup() {
 
  size(560,400);
  background(255,20,30);
  //framerate(60);
  line(width/2,0,width/2,height);
  ellipseMode(CENTER_RADIUS);
  rectMode(CENTER_RADIUS);
  font = loadFont("Monaco-12.vlw"); 

  halfImage = width*height/4; 
  imgCenter= (width*height-width)/2 -1;
   
  
  
  pic1 = loadImage("image_"+imageChoice+".jpg"); 
  image(pic1, 0, 0,width/2,height); 
  noLoop();
  
  

  
  
  
    for(int i=0;i< pic1.pixels.length;i++){
      
       if( pic1.pixels[i] == 0xffFFFFFF){ white = white + 1;}
       else if( pic1.pixels[i] == 0xff000000){ black = black + 1;}
       
     }
      
      
    averageWhite = 100 * PApplet.toFloat (white) / PApplet.toFloat ( pic1.pixels.length);
    averageBlack = 100 * PApplet.toFloat (black) / PApplet.toFloat ( pic1.pixels.length);
      
       
    println ("280(width) X 400(height): "+ (280*400));
    println ("total pixels: "+ pic1.pixels.length );   
    println ("white: "+ white);
    println ("black: "+ black);
    println (white + black);
    println ("averageWhite: "+ averageWhite);
    println ("averageBlack: "+ averageBlack);
    println ("sum: "+(averageBlack+averageWhite));
      
    
    
  
} 

public void mousePressed(){noLoop();}


public void mouseReleased(){
  if(stepX < 111998)loop();
  
  
  }



 
public void draw() { 
  //image(pic1, 0, 0,width/2,height);
  
  //if(stepX >= pic1.pixels.length-1){noLoop();}
  if(stepX >= 111998){println("*****"+stepX+"*****");  image(pic1, 0, 0,width/2,height); noLoop();}
  
  //if(stepX >= 4){noLoop();println("*****"+stepX+"*****");}
  
  
  fill(255,20,30);
  
  noStroke();
  //ellipse(stepX % width/2, stepY-1,2,2);
  //rect(stepX % width/2, stepY-1,2,2); 
  rect( (stepX % (width/2)), stepY-1,2,2);   
  

  
  
  
 
  
  //fill(pic1.pixels[stepX]);
  //rect( 1 + width/2 + (stepX % (width/2)), stepY,1,1);  
  
  
  
  
  
   
  if( pic1.pixels[stepX] >= 0xff808080){ 
      
      
      
      fill(pic1.pixels[stepX]);
      
      ellipse(width/2+1 + (numWhite % (width/2)), stepW-1,1,1);
      
      numWhite = numWhite + 1;
      if((numWhite !=0)&&(numWhite % (width/2) == 0))stepW=stepW+1;
  }
  
  
  
  
  
  if( pic1.pixels[stepX] < 0xff808080){ 
      
      
      
      fill(pic1.pixels[stepX]);
      
      ellipse(width - (numBlack % (width/2)), height-stepB,1,1);
      numBlack = numBlack + 1;
      if((numBlack !=0)&&(numBlack % (width/2) == 0))stepB=stepB+1;
  }
  
  
  stepX = stepX + 1;
  if((stepX !=0)&&(stepX % (width/2) == 0))stepY=stepY+1;
  
  
 
  
  
 
    //println ("stepX: "+ stepX);
    //println ("numBlack: "+ numBlack);
    //println ("numWhite: "+ numWhite);
    noStroke();
    if(stepX>1){ 
      fill(255);
      rect(17*width/24-18,45,60,25);    
      fill(0);
      textFont(font, 10); 
    
      text("pixel: "+(stepX+1), 14*width/24, 34);
    //}
    //if(numWhite>1){
    //fill(255);
    //rect(14*width/24-10,30,120,15);    
    fill(0);
    textFont(font, 10);  
    //text("white precentage: "+numWhite, 17*width/24, 50);
    
      text("bright:"+nfs(PApplet.toFloat(100*numWhite)/PApplet.toFloat(pic1.pixels.length),2,4)+" %", 14*width/24, 48);  
    //}
    //if(numBlack>0){
    //fill(255);
    //rect(14*width/24-10,45,120,16);    
    fill(0);
    textFont(font, 10); 
    //text("black precentage: "+numBlack, 17*width/24, 75);  
    
    text("dark:"+nfs(PApplet.toFloat(100*numBlack)/PApplet.toFloat(pic1.pixels.length),2,4)+" %", 14*width/24, 62); 
    }
    
           
             
  
  
    stroke(0);
    //line(width/2-1,0,width/2-1,height);
    line(width/2,0,width/2,height);
       
} 
static public void main(String args[]) {   PApplet.main(new String[] { "imageCountColor_0correct" });}}