
  
  
  
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

    
  //boolean onLoad(){ return true;}
  
  //boolean onSave(){return true;}
  
  
  void displayCanvas(int x, int y){
      posX=x;
      posY=y;
      
      stroke(0);
      fill(canvasColor);
      rect(posX, posY, 600, 600);
      noStroke();
      noFill(); 
      
  
  }
  
  void updateActions(){}
  
 
  
  
}
