class InkPad{
  int centerX;
  int centerY;
  int radius;
  float r, g, b;
  
  
  InkPad(int x, int y, int rad, float R, float G, float B){
    
     centerX=x;
     centerY=y;
     radius=rad;
     r=R; 
     g=G;
     b=B;
 

    }
    

    boolean inside (){
    //if (( sq(x + mouseX) + sq(y + mouseY) ) <= radius)
    if ((mouseX > centerX - radius && mouseY > centerY - radius) && (mouseX < centerX + radius && mouseY< centerY + radius)){
      //rect(0,0,100,100); to debug
      return (true);
      
      }
    else
      return(false);    
    }
    
    
    
    void display(){
    color inkColor = color(r, g, b);   
    fill(inkColor); 

    stroke(0);
    ellipseMode(CENTER_RADIUS);
    ellipse(centerX, centerY, radius, radius);
   
 
      
      
      
      
    }
  
  }
