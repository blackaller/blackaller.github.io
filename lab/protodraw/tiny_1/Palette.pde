
  
  
  
  class Palette{
  int posX, posY;

  
Palette(){
   

    }
    
    

   

    
  //boolean onLoad(){ return true;}
  
  //boolean onSave(){return true;}
  
  
  void displayPalette(int x, int y){
       posX=x;
      posY=y;
      
      
      
      textFont(font, 12);
      fill(0);
      
      
      text("13 by 13 equals tiny", 50, posY-20);
      
      
      
      text("space bar to clear", 50, posY+290);
      
      
      
      text("g for grid and i to invert", 50, posY+320);
      text("c to flip colors", 50, posY+350);
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      

      
      
      
      
      
      noStroke();
      fill(0); 
      
  
  }
  
  void updateActions(){}
  
 
  
  
}

  
  
