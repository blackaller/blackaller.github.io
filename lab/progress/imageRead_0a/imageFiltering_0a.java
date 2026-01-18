import processing.core.*; import java.applet.*; import java.awt.*; import java.awt.image.*; import java.awt.event.*; import java.io.*; import java.net.*; import java.text.*; import java.util.*; import java.util.zip.*; public class imageFiltering_0a extends PApplet {//by luis blackaller


PImage pic1; 


int halfImage; 
int i = 1;
float var = 0;
int imgCenter, imgNorth, imgSouth, imgWest, imgEast;
boolean vuelta = true;

int[] temp ; 
int[] volteados ;
int[] vertical ; 
  
public void setup() { 
  size(200,200);

 
  
 
  pic1 = loadImage("imageTest_7.tga"); 
  image(pic1, 0, 0,width,height); 
  temp = new int[width*height];
  volteados = new int[width*height];
  vertical = new int[height];
  for(int i=0;i<width*height;i++){
    if ( floor(i/(width)) % 2 == 0){
       temp[i] = pic1.pixels[  i ];
       }
     else{
         temp[i] = pic1.pixels[  ( (floor(i/(width))*width)  +    ((width-1) - i%(width)) )  ]; 
     } 
  }   
  
  
  for(int i=0;i<width*height;i++){
    
      
      
    
         volteados[i] = pic1.pixels[  ( (floor(i/(width))*width)  +    ((width-1) - i%(width)) )  ]; 
     
  } 
  
  for( int j =0; j < height; j++){ 

         vertical[j] =j* width % height;  
  }
  
  
  
  
  
  
} 
 
public void draw() { 
  loadPixels();
  
  
  
  
  /*if ( !(floor(i/(width)) % 2 == 0))  {
    pixels[i] = volteados[i];
       for( int j =0; j < height; j++){ 
          
         pixels[i+ vertical[j]] = volteados[i+ vertical[j]];
         //pixels[ i+(j*width % height) ] = temp[0];
       
      }
  }*/
  
  for( int j =0; j < height*height-1; j++){ 
    if 
      ( !(floor(j/(width)) % 4 == (i % 4)   ))  {    pixels[j] = volteados[j];  }
    else
      pixels[j] = pic1.pixels[j];
    
    }
  
  
  
  
  
   
  
  
  
  
  
  //delay(20);
  
  updatePixels(); 
 
  if (i<width*height-1) {
  i = i+1; 
  }
  else i = 1;
  
} 
}