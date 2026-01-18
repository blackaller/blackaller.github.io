int num = 201;
float mx[] = new float[num];
float my[] = new float[num];
boolean mdraw[] = new boolean[num];
color mcolor[] = new color[num];

doodle shapes[] = new doodle[num];
int doodlecount = 0;

InkPad redInk,greenInk,blueInk;
color colorMix;

boolean pausa =true;


float i=0;
int inkX,inkY;

void setup(){
  size(600,600); 
 smooth(); 
 fill(255,0,0);
  stroke(0); 
 inkX=100;
 inkY=500;
 strokeWeight(6);
   for(int i=0; i<num-1; i++) {
     mdraw[i]=false;
   }
     
     redInk = new InkPad(200,200,50,255,0,0);
     greenInk = new InkPad(200,200,50,0,255,0);
     blueInk = new InkPad(200,200,50,0,0,255);
     
     colorMix = color(255,0,0);   
     
     
     
     for(int i=0; i<num ;i= i+1){
       
       shapes[i] = new doodle();
       
       
     }


  
  
}


 
      
void draw(){
  background(255);
  stroke(0); 
  
  redInk.centerX = inkX;
  redInk.centerY = inkY;
  
  greenInk.centerX = inkX;
  greenInk.centerY = inkY-200;
  
  blueInk.centerX = inkX;
  blueInk.centerY = inkY-400;
  
  
  redInk.display();
  greenInk.display();
  blueInk.display();
  
  
  
  
   /*fill(255,0,0);
  ellipse(inkX,inkY,100,100);

  fill(0,255,0);
  ellipse(inkX,inkY-150,100,100);
  fill(0,0,255);
  ellipse(inkX,inkY-300,100,100);*/
 
  
  
  
  
  
 if(mousePressed && 190-i>0){
     
   // Reads throught the entire array
  // and shifts the values to the left
    for(int i=1; i<num; i++) {
      mx[i-1] = mx[i];
      my[i-1] = my[i];
      
    } 
  // Add the new values to the end of the array
    mx[num-1] = mouseX;
    my[num-1] = mouseY;
    
   
    
    
    
    
   }
     
     
    
   for(int i=0; i<num-1; i++) {
     if( true){
       mcolor[i]=colorMix;
       stroke(mcolor[i]); 
       if (mx[i] > 0 && my[i] > 0 && mx[i+1] > 0 && my[i+1] > 0)line(mx[i], my[i], mx[i+1], my[i+1]);
     }
   }
  



  translate(mouseX,mouseY);
  if(mouseX>0 && mouseY>0){
  rotate(-3*PI/4);
  
 stroke(0);  
  fill(255);
  rect(0,0,20,200); 

   fill(colorMix);
  rect(0,0,20,190-i);
 
  

  
  
  
  
  
  
  }
  
  
  //if (inside(inkX,inkY,100) && 190-i< 200){i=i-1;}
  if ((redInk.inside()||greenInk.inside()||blueInk.inside()) && 190-i< 200){i=i-2;}
  
  
  if(  greenInk.inside() && (green(colorMix)<255 && 190-i< 200)) { 
      colorMix = color (red(colorMix), green(colorMix) +2, blue(colorMix)); 
     }
   if(  redInk.inside() && (red(colorMix)<255 && 190-i< 200)) { 
      colorMix = color (red(colorMix) +2, green(colorMix) , blue(colorMix)); 
     } 
   if(  blueInk.inside() && (blue(colorMix)<255 && 190-i< 200)) { 
      colorMix = color (red(colorMix), green(colorMix) , blue(colorMix) +2); 
     }
  
  
    if(  greenInk.inside() && (green(colorMix)==255 && 190-i< 200 )) { 
      colorMix = color (red(colorMix)-2, green(colorMix) , blue(colorMix)-2); 
     }
   if(  redInk.inside() && (red(colorMix)==255 && 190-i< 200)) { 
      colorMix = color (red(colorMix) , green(colorMix)-2 , blue(colorMix)-2); 
     } 
   if(  blueInk.inside() && (blue(colorMix)==255 && 190-i< 200)) { 
      colorMix = color (red(colorMix)-2, green(colorMix) -2, blue(colorMix) ); 
     }   
     
  
  
  
  
  
  
  if ((mousePressed && 190-i>0) && (!inside (inkX,inkY,100))) {
    i=i+1;
    }
  
  

  
  }
  void mouseReleased() {
    
  } 
  
  
  
  boolean inside (int x, int y, int radius){
    //if (( sq(x + mouseX) + sq(y + mouseY) ) <= radius)
    if ((mouseX > x - radius/2 && mouseY > y - radius/2) && (mouseX < x + radius/2 && mouseY< y + radius/2)){
      //rect(0,0,100,100); to debug
      return (true);
      
      }
    else
      return(false);    
  }
