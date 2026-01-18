
  
  
  
  class Canvas{
  int posX, posY;
  int canvasColor;
  int sizeCanvas = 400; 

  
 Canvas(){
   

    }
    
    void paperColor(){
      canvasColor = 255;
      }

   void paperColor(int x){
     canvasColor = x;
     }


  
  void displayCanvas(int x, int y){
      posX=x;
      posY=y;
      strokeWeight(1);
      stroke(0);
      fill(canvasColor);
      rect(posX, posY, sizeCanvas, sizeCanvas);
      noStroke();
      noFill(); 
      
  
  }
  
  void updateActions(){}
  
  boolean inCanvas(int x, int y){
    if ( posX <= x && x <= posX + sizeCanvas && posY <= y && y <= posY + sizeCanvas) return true;
    else return false;
    
    
    }

  
}
