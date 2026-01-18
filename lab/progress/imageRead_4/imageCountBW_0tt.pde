// white #FFFFFF against black #000000
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

int randomImage = int(random(0f,3.99f));


void setup() {
 
  size(560,400);
  background(255,20,30);
  line(width/2,0,width/2,height);
  ellipseMode(CENTER_RADIUS);
  font = loadFont("Monaco-12.vlw"); 

  halfImage = width*height/4; 
  imgCenter= (width*height-width)/2 -1;
   
  
  
  pic1 = loadImage("image_"+randomImage+".tga"); 
  image(pic1, 0, 0,width/2,height); 
  noLoop();
  
  

  
  
  
    for(int i=0;i< pic1.pixels.length;i++){
      
       if( pic1.pixels[i] == #FFFFFF){ white = white + 1;}
       else if( pic1.pixels[i] == #000000){ black = black + 1;}
       
     }
      
      
    averageWhite = 100 * float (white) / float ( pic1.pixels.length);
    averageBlack = 100 * float (black) / float ( pic1.pixels.length);
      
       
    println ("280(width) X 400(height): "+ (280*400));
    println ("total pixels: "+ pic1.pixels.length );   
    println ("white: "+ white);
    println ("black: "+ black);
    println (white + black);
    println ("averageWhite: "+ averageWhite);
    println ("averageBlack: "+ averageBlack);
    println ("sum: "+(averageBlack+averageWhite));
      
    
    
  
} 

void mousePressed(){noLoop();}


void mouseReleased(){
  if(stepX < 111998)loop();
  
  
  }



 
void draw() { 
  
  
  //if(stepX >= pic1.pixels.length-1){noLoop();}
  if(stepX >= 111998){println("*****"+stepX+"*****");noLoop();}
  
  //if(stepX >= 4){noLoop();println("*****"+stepX+"*****");}
  
  
  fill(255,20,30,50);
  noStroke();
  ellipse(stepX % width/2, stepY-1,1,1);
  
  stepX = stepX + 1;
  if((stepX !=0)&&(stepX % width/2 == 0))stepY=stepY+1;
  
  
  
  
  if( pic1.pixels[stepX] == #FFFFFF){ 
      numWhite = numWhite + 1;
      fill(255);
      if((numWhite !=0)&&(numWhite % width/2 == 0))stepW=stepW+1;
      
      
      ellipse(width/2+1 + numWhite % width/2, stepW-1,1,1);
  }
  
  
  
  if( pic1.pixels[stepX] == #000000){ 
      numBlack = numBlack + 1;
      fill(0);
      if((numBlack !=0)&&(numBlack % width/2 == 0))stepB=stepB+1;
      
      
      ellipse(width - (numBlack % width/2), height-stepB,1,1);
  }
  
 
    //println ("stepX: "+ stepX);
    //println ("numBlack: "+ numBlack);
    //println ("numWhite: "+ numWhite);
    noStroke();
    if(stepX>1){ 
      fill(255);
      rect(14*width/24-10,20,120,50);    
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
    
      text("white:"+nfs(float(100*numWhite)/float(pic1.pixels.length),2,4)+" %", 14*width/24, 48);  
    //}
    //if(numBlack>0){
    //fill(255);
    //rect(14*width/24-10,45,120,16);    
    fill(0);
    textFont(font, 10); 
    //text("black precentage: "+numBlack, 17*width/24, 75);  
    
    text("black:"+nfs(float(100*numBlack)/float(pic1.pixels.length),2,4)+" %", 14*width/24, 62); 
    }
    
           
             
  
  
    stroke(0);
    //line(width/2-1,0,width/2-1,height);
    line(width/2,0,width/2,height);
       
} 
