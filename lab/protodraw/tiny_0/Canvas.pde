
  
  
  
  class Canvas{
  int canvasSize = 13;
  int cellSize = 20;  
  int posX, posY;
  int canvasColor;
  int sizeCanvas = cellSize * canvasSize; 
  
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
      strokeWeight(1);
      stroke(0);
      //noStroke();
      fill(canvasColor);
      rect(posX, posY, sizeCanvas, sizeCanvas);
      stroke(20,200,200);
      /*for (int i = 1; i < canvasSize; i = i+1){
        line(posX, posY+cellSize*i, posX+sizeCanvas, posY+cellSize*i);
        line(posX+cellSize*i, posY, posX+cellSize*i, posY+sizeCanvas);
        
        
        }*/
        
        
        
        
      /*  
      noStroke();
      fill(canvasColor);
     
      
      
      rect(340, 60, 13, 13);
      rect(340, 90, 26, 26);
      rect(340, 140, 52, 52);   
      rect(340, 220, 91, 91); */ 
        
        
        
        
        
        
        
 
        
      noStroke();
      noFill(); 
      
  
  }
  
  
  
   void displayMargin(int x, int y){
      posX=x;
      posY=y;
      strokeWeight(1);
      stroke(0);
      noFill();
      rect(posX, posY, sizeCanvas, sizeCanvas);
      noStroke();
      noFill(); 
      
  
  }
  
    void displayGrid(int x, int y){
      posX=x;
      posY=y;
      strokeWeight(1);
      stroke(20,200,200);
      for (int i = 1; i < canvasSize; i = i+1){
        line(posX, posY+cellSize*i, posX+sizeCanvas, posY+cellSize*i);
        line(posX+cellSize*i, posY, posX+cellSize*i, posY+sizeCanvas);
        
        
        }
      noStroke();
      noFill(); 
      
  
  }
  
  
  
  
  
  
  
  void updateActions(){}
  
    boolean inCanvas(int x, int y){
    //if ( posX <= x - (cellSize/2) && x + (cellSize/2) <= posX + sizeCanvas && posY  <= y - (cellSize/2) && y + (cellSize/2) <= posY + sizeCanvas) return true;
    if ( posX <= x  && x < posX + sizeCanvas && posY  <= y  &&  y  < posY + sizeCanvas) return true;
    else return false;
    
    
    }
  
 
  
  
}
