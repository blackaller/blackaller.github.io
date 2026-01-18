class pen{ 
  //not workin
  pen(){}
  void display(int i, color inkColor){
     
      
      translate(mouseX,mouseY);
      if(mouseX>0 && mouseY>0){
        rotate(-3*PI/4);
  
        stroke(0); 
        strokeWeight(6); 
        fill(255);
        rect(0,0,20,200); 

        fill(inkColor);
        rect(0,0,20,190-i);
      }
    
 }
  
  
  
  
}
