import java.net.HttpURLConnection;



int num = 10000;
int i=0;
int r = 0, g = 0, b = 0;
PFont font;
int strokew = 1;
boolean elgrid = true;
Canvas paper;
Palette palette;
Icon iconito;

void setup(){
   size(470,440);
   //framerate(30);//this stops svg from being saved
   background(#DDDDCC);
   font = loadFont("Monaco-12.vlw");
   iconito = new Icon();
   paper = new Canvas();
   palette = new Palette();
   paper.paperColor(255);
   paper.displayCanvas(40,60);
   palette.displayPalette(360,60);
   strokeWeight(1); 
 }



void draw() {
  
  stroke(0);
  if (iconito.paint) fill(0);
  else fill(255);
  rect (180,400,40,20);
  noStroke();
  
  if(mousePressed) {
    noStroke();
    fill(r,g,b);
    iconito.update(paper.inCanvas(mouseX, mouseY) && paper.inCanvas(pmouseX, pmouseY));
  }
    //this should happen only if the corresponding cell is clear
    
    /*if (paper.inCanvas(mouseX, mouseY) && paper.inCanvas(pmouseX, pmouseY)){
      int resX, resY, nuX, nuY;
      resX = mouseX % 20;
      resY = mouseY % 20;
      rect(mouseX-resX,mouseY-resY,20,20);  }*/
    iconito.display();
    iconito.displayThumb();
    
    noSmooth();paper.displayMargin(40,60);

    if (elgrid) paper.displayGrid(40,60);
  
    if(keyPressed){
      if (key == ' '){
         
         iconito.clear();
      
         strokeWeight(1);
         background(#DDDDCC);
         palette.displayPalette(360,60); 
         noSmooth();
         paper.paperColor(255);
         paper.displayCanvas(40,60);
          if (elgrid) paper.displayGrid(40,60);
         stroke(0);
         if (iconito.paint) fill(0);
         else fill(255);
         rect (180,400,40,20);
         noStroke();
       }
       
       
    }

}



void mouseReleased() {
  i=0;

}


void keyReleased(){
  
  
  if(key =='g'){
    
         elgrid = !elgrid;
         background(#DDDDCC);
         palette.displayPalette(360,60); 
         noSmooth();
         paper.paperColor(255);
         paper.displayCanvas(40,60);
         iconito.display();
         iconito.displayThumb();
         if (elgrid) paper.displayGrid(40,60);
         noSmooth();paper.displayMargin(40,60);
         stroke(0);
         if (iconito.paint) fill(0);
         else fill(255);
         rect (180,400,40,20);
         noStroke();
   }
         
   if (key == 'c')iconito.paint=!iconito.paint; println(iconito.paint);
   
   if(key =='p'){iconito.iconPrint();

   
   
   }
  
 }



void clear() {
   
   noSmooth();
   strokeWeight(1);
   paper.displayCanvas(40,60);
  

}





