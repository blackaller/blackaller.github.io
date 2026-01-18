class fillStatus{ 
  int cornerX;
  int cornerY;
  int lengthX;
  int lengthY;
  int stat;  
  float r, g, b;
  color inkColor = color(r, g, b); 
  
  
  fillStatus(int x, int y, int lenX, int lenY, float R, float G, float B){
     cornerX=x;
     cornerY=y;
     lengthX=lenX;
     lengthY=lenY;
     r=R; 
     g=G;
     b=B;
     inkColor = color(r, g, b); 
     
  }
  
  void display(){
  
  

  stroke(0);
  strokeWeight(6);
  fill(255);
  rectMode(CORNER);
  rect(cornerX, cornerY, lengthX, lengthY);

  fill(inkColor); 
  rect(cornerX, cornerY, stat, lengthY);
  
  

  }
  
  
 
  
  
  
  
}
