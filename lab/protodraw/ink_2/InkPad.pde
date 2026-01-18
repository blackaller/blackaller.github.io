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
    //if (( sq(x + mouseX) + sq(y + mouseY) ) <= radius) // this formula needs to get done
    if ((mouseX > centerX - radius && mouseY > centerY - radius) && (mouseX < centerX + radius && mouseY< centerY + radius)){
      return (true);
    }
    else
      return(false);
  }
    
  void display(){
  color inkColor = color(r, g, b);   
  fill(inkColor); 
  stroke(0);
  strokeWeight(6);
  //ellipseMode(CENTER_RADIUS);
  //ellipse(centerX, centerY, radius, radius);
  rectMode(CENTER_RADIUS);
  rect(centerX, centerY, radius, radius);
  }
}
