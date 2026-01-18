
  
  
  
  class Canvas{
  int posX, posY;
  int canvasColor;

  
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
      rect(posX, posY, 400, 400);
      noStroke();
      noFill(); 
      
  
  }
  
  void updateActions(){}
  
 
  
  
}
