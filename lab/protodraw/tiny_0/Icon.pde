class Icon{
  int posX =  40;
  int posY =  60;
  int iconSize = 13;
  int cellSize = 20;
  boolean paint = true;
  boolean iconArray[] = new boolean[ iconSize * iconSize ];
  String iconString = new String();
  
  
  Icon(){
    for (int i = 0; i < ( iconSize * iconSize ); i = i+1){     
      iconArray[i] = false;
      
    }
  }
  
  void update( boolean overCell){
    
    if (overCell){

      if (paint)iconArray[    ( iconSize * ( (mouseY - posY ) / cellSize) ) + floor((mouseX - posX ) / cellSize)    ] = true;
      else iconArray[    ( iconSize * ( (mouseY - posY ) / cellSize) ) + floor((mouseX - posX ) / cellSize)    ] = false;
    }
    
    }
  
  void display(){
     posX =  40;
     posY =  60;
 
     cellSize = 20;    
    
     for (int i = 0; i < ( iconSize * iconSize ); i = i+1){     
      

      if (iconArray[i] == false)  {fill(255);
      rect(posX + (i * cellSize) % (iconSize * cellSize), posY + cellSize * floor(i/iconSize ), cellSize, cellSize);
      }
      else{ fill(0);
      
     rect(posX + (i * cellSize) % (iconSize * cellSize), posY + cellSize * floor(i/iconSize ), cellSize, cellSize);}
      
    }
   }
   
   
    void displayThumb(){
       posX =  340;
       posY =  60;
       cellSize = 1;
      
      
     for (int i = 0; i < ( iconSize * iconSize ); i = i+1){     
      

      if (iconArray[i] == false)  {fill(#DDDDCC);
      rect(posX + (i * cellSize) % (iconSize * cellSize), posY + cellSize * floor(i/iconSize ), cellSize, cellSize);
      }
      else{ fill(0);
      
     rect(posX + (i * cellSize) % (iconSize * cellSize), posY + cellSize * floor(i/iconSize ), cellSize, cellSize);}
      
    }
    
    
    
     
       posY =  90;
       cellSize = 2;
      
      
     for (int i = 0; i < ( iconSize * iconSize ); i = i+1){     
      

      if (iconArray[i] == false)  {fill(#DDDDCC);
      rect(posX + (i * cellSize) % (iconSize * cellSize), posY + cellSize * floor(i/iconSize ), cellSize, cellSize);
      }
      else{ fill(0);
      
     rect(posX + (i * cellSize) % (iconSize * cellSize), posY + cellSize * floor(i/iconSize ), cellSize, cellSize);}
      
    }
      
      
      
      
      
       
       posY =  140;
       cellSize = 4;
      
      
     for (int i = 0; i < ( iconSize * iconSize ); i = i+1){     
      

      if (iconArray[i] == false)  {fill(#DDDDCC);
      rect(posX + (i * cellSize) % (iconSize * cellSize), posY + cellSize * floor(i/iconSize ), cellSize, cellSize);
      }
      else{ fill(0);
      
     rect(posX + (i * cellSize) % (iconSize * cellSize), posY + cellSize * floor(i/iconSize ), cellSize, cellSize);}
      
    }
    
    
   
       posY =  220;
       cellSize = 7;
      
      
     for (int i = 0; i < ( iconSize * iconSize ); i = i+1){     
      

      if (iconArray[i] == false)  {fill(#DDDDCC);
      rect(posX + (i * cellSize) % (iconSize * cellSize), posY + cellSize * floor(i/iconSize ), cellSize, cellSize);
      }
      else{ fill(0);
      
     rect(posX + (i * cellSize) % (iconSize * cellSize), posY + cellSize * floor(i/iconSize ), cellSize, cellSize);}
      
    }
    
    
   
     posX =  40;
     posY =  60;
     cellSize = 20;   
   }
   
   
    
     void clear(){
      for (int i = 0; i < ( iconSize * iconSize ); i = i+1){     
      iconArray[i] = false;      
      }
      iconString = "";
    }
    
    
    
      
    
  




  
  void iconPrint(){
    iconString = "";
    for (int i = 0; i < ( iconSize * iconSize ); i = i+1){     
     if (iconArray[i] == false) iconString  = iconString + "0";
     else iconString  = iconString + "1";
     
    }
    println("data: " + iconito.iconString);
    
    
    }
  
  
  
  }
