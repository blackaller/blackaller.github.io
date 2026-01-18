
  
  
  
  class ColorPalette{
  int posX, posY;

  
  ColorPalette(){
   

    }
    
    

   

    
  //boolean onLoad(){ return true;}
  
  //boolean onSave(){return true;}
  
  
  void displayColorPalette(int x, int y){
       posX=x;
      posY=y;
      
      
      
      textFont(font, 12);
      fill(0);
      
      
      text("the mouse is your pencil / the keyboard is your piano", 50, posY-12);
      
      
      
      text("keystroke: color", posX+13, posY-12);
      
      noFill();
      strokeWeight(2);
      stroke(255,20,20);
      rect(posX, posY, 40, 40);
      stroke(20,200,200);
      rect(posX+60, posY, 40, 40);
      stroke(0);
      rect(posX+120, posY, 40, 40);
      stroke(255);
      rect(posX+180, posY, 40, 40);
      
      
      
      textFont(font, 24);
      fill(0);
      text("q", posX+13, posY+27);
      text("e", posX+74, posY+27);
      fill(0);
      text("r", posX+133, posY+27);
      fill(0);
      text("t", posX+194, posY+27);
      
      
      
      
      
      
      
      
      
      
      
      textFont(font, 12);
      fill(0);
      text("keystroke: clear / paper color", posX+13, posY+118);
      
      
      //noStroke();
      fill(240);
      noStroke();
      rect(posX, posY+130, 40, 40);
      fill(180);
      rect(posX+60, posY+130, 40, 40);
      fill(120);
      rect(posX+120, posY+130, 40, 40);
      fill(20);
       rect(posX+180, posY+130, 40, 40);
      
      
      
      textFont(font, 24);
      fill(0);
      text("1", posX+13, posY+159);
      text("2", posX+74, posY+159);
      fill(0);
      text("3", posX+133, posY+159);
      fill(255);
      text("4", posX+194, posY+159);
      
      
      
      
      
      
      
      
      
      
      textFont(font, 12);
      fill(0);
      text("keystroke: stroke", posX+13, posY+242);
      
      noFill();
      stroke(0);
      strokeWeight(1);
      //rect(posX, posY+140, 40, 40);
      strokeWeight(12);
      //rect(posX+180, posY+140, 40, 40);
      
      textFont(font, 24);
      fill(0);
      text("v", posX+13, posY+273);

      text("b", posX+194, posY+273);
      
        textFont(font, 12);
      text("<", posX+74, posY+270);

      text(">", posX+133, posY+270);
      
      strokeWeight(1);
      line(posX,posY+290,posX+60,posY+290);
      
      strokeWeight(3);
      line(posX+60,posY+290,posX+120,posY+290);
      strokeWeight(6);
      line(posX+120,posY+290,posX+170,posY+290);
       strokeWeight(10);
      line(posX+170,posY+290,posX+220,posY+290);
      
      
      
      //text("clear / set background", posX+13, posY+197);
      
      
      
      
      
      
      
      noStroke();
      fill(0); 
      
  
  }
  
  void updateActions(){}
  
 
  
  
}

  
  
