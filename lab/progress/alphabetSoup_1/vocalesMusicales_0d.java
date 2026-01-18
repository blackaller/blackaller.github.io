import processing.core.*; import java.applet.*; import java.awt.*; import java.awt.image.*; import java.awt.event.*; import java.io.*; import java.net.*; import java.text.*; import java.util.*; import java.util.zip.*; public class vocalesMusicales_0d extends PApplet {// scroll.



PFont font; 

int brincoChar = 0;
int brincoLine = 0;

int aPixel = 0;
int aLine = 0;
int aScreen = 0;






int agris = 0, egris = 70, igris = 120, ogris =170, ugris = 255;
int W = 400, H = 400, Wentre10 =W/10;

int eleccion = 0;
boolean arranque = false;

String letrasElegidas ="aeiou";




byte book[];




public void setup(){
  size(400,400);
  background(255,20,30);
  // framerate(24);
  noStroke();
  
  
  font = loadFont("Monaco-24.vlw"); 
  textFont(font, 8); 
  
  book = loadBytes("alice.txt"); 
  

  
   println(book.length); // book.length = 1221069

  
}

public void keyPressed(){
  eleccion = (eleccion+1) %5;
  
  if(eleccion == 1)letrasElegidas ="\r\t- \n";
  else if(eleccion == 2)letrasElegidas ="bcdfg";
       else if(eleccion == 3)letrasElegidas ="pqrst";
            else if(eleccion == 4)letrasElegidas ="jklmn";
                 else if(eleccion == 0)letrasElegidas ="aeiou";



}



public void mousePressed(){

  if(!arranque) arranque = true;
  else noLoop();

}
public void mouseReleased(){
  loop();
}







public void draw(){
  background(255,20,30);
    

  
  
  for (int i = 0; i < H/20; i++){ // i is height
  
  
     for(int j = 0; j< W/10;j++){ // j  is width
     
     
     if(  (j+Wentre10*i) >  book.length) break; // le paramos al final del archivo
     
     
     
     
     fill(agris);
     if(PApplet.toChar(book[j+(40*i)+aLine]) == letrasElegidas.charAt(0)) rect( j*10, (20*(i) % H)-aPixel,10,10); 
     
     fill(egris);
     if(PApplet.toChar(book[j+(40*i)+aLine]) == letrasElegidas.charAt(1)) rect( j*10, (20*(i) % H)-aPixel,10,10); 
     
     fill(igris);
     if(PApplet.toChar(book[j+(40*i)+aLine]) == letrasElegidas.charAt(2)) rect( j*10, (20*(i) % H)-aPixel,10,10);
     
     fill(ogris);
     if(PApplet.toChar(book[j+(40*i)+aLine]) == letrasElegidas.charAt(3)) rect( j*10, (20*(i) % H)-aPixel,10,10);
     
     fill(ugris);
     if( PApplet.toChar(book[j+(40*i)+aLine]) == letrasElegidas.charAt(4) ) rect( j*10, (20*(i) % H)-aPixel,10,10); 
     
     fill(0);
     
     
          
     if    (  PApplet.toChar(book[j+(40*i)+aLine]) != letrasElegidas.charAt(0)
           && PApplet.toChar(book[j+(40*i)+aLine]) != letrasElegidas.charAt(1)  
           && PApplet.toChar(book[j+(40*i)+aLine]) != letrasElegidas.charAt(2)
           && PApplet.toChar(book[j+(40*i)+aLine]) != letrasElegidas.charAt(3)  
           && PApplet.toChar(book[j+(40*i)+aLine]) != letrasElegidas.charAt(4)  )

          text(PApplet.toChar(book[j+(40*i)+aLine]), 2+j*10, ((20*(i+1)) % H)-10-aPixel ); // trasladar la distancia deseada menos el tama\u00f1o de la letra   
     
     
         // print(char(book[j+(40*i)+aLine]));
     
          
   }
  
  
  
  
  
  
  
  }
  
  if(arranque){
  
    aPixel =(aPixel +1) % 20;
  
    if(aPixel == 0 % 20) aLine = aLine+40;
  }
  
  

}
}