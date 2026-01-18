//mouse listener methods for all classes


class Actions{
  int posX, posY;
  String loader, saver; 
  
  Actions(){
    posX=60;
    posY=30;
    loader = "load";
    saver = "save";
    }
    
    
   void loads(){} 
    
   void saves(){} 
   
   

    
  //boolean onLoad(){ return true;}
  
  //boolean onSave(){return true;}
  
  
  void displayActions(){
      fill(255);
      stroke(0);
      rect(posX, posY, 40, 40);
     rect(posX+60, posY, 40, 40);
      noStroke();
      fill(0); 
      textFont(font, 12);
      text(loader, posX+5, posY+23);
      text(saver, posX+66, posY+23);
  
  }
  
  
    void displayActions(int x, int y){
      posX = x;
      posY = y;
      fill(255);
      stroke(0);
      rect(posX, posY, 40, 40);
      rect(posX+60, posY, 40, 40);
      noStroke();
      fill(0); 
      textFont(font, 12);
      text(loader, posX+5, posY+23);
      text(saver, posX+66, posY+23);
  
  }
  
  void updateActions(){}
  
 
  
  
}
