// import processing.opengl.*;
// cyclops
// by luis blackaller


PImage pic1; 


int halfImage; 
int i = 0, j = 0;
float var = 0;
int imgCenter, imgNorth, imgSouth, imgWest, imgEast;
boolean vuelta = true;
int voltear=1;
int[][]punto = new int[200][200]; 

 
 color[][] colores = new color[200][200];   
 
 



 
void setup() { 
  size(200,200);
  halfImage = width*height/4; 

  imgCenter= (width*height-width)/2 -1;
   
  rectMode(CENTER_RADIUS);
 noStroke();
  
  
 
  pic1 = loadImage("imageTest_7.tga"); 
  //image(pic1, 0, 0,width,height); 
  //temp = new point[width*height]; 
  
  
  
  
  
  for(int i=0;i<width;i++){
    for(int j=0;j<width;j++){
  
      punto[i][j]= pic1.pixels[i*200 + j];
    }
  }
 
  
 
  
  
  
  
  
  
  
  //floor(i/(width))
   /* for(int i=0;i<width*height;i++){
    
       if ( floor(i/(width)) % 2 == 0){
         temp[i] = pic1.pixels[  i ];
         //println ( i + ": " + floor(i/(width-1))%2  );
       }
       else{
         temp[i] = pic1.pixels[  ( (floor(i/(width))*width)  +    ((width-1) - i%(width)) )  ]; 
      
        }
   
    } */
 
  
  
  
  
  
  
} 
 
void draw() { 
  
  //translate(width/2,width/2);
  
  float r, g, b;

 //for( int i =0; i<width/2;i++  ){
     for( int j =0; j < width;j++  ){
          r = red(punto[j][i]);
          g = green(punto[j][i]);
          b = blue(punto[j][i]);
          
          //println(i+" "+j+" "+r+" "+g+" "+b);
          fill(r,g,b);

          
          stroke(r,g,b);
          
          line(i,j,width/2,j);
          
          
          //rect(i*2,j*2,2,2);
  
      }
      
      
       for( int j =0; j < width;j++  ){
          r = red(punto[j][i]);
          g = green(punto[j][i]);
          b = blue(punto[j][i]);
          
          //println(i+" "+j+" "+r+" "+g+" "+b);
          fill(r,g,b);

          //if (r<100) r=r/2;
          //else r = 2*r;
          
          
          stroke(r,g,b);
          
          line(width-i,j,width/2,j);
          
          
          //rect(i*2,j*2,2,2);
  
      }
      
      
      
         
     
           
       
 // }
  
  
          
 //change =change+ 1;           
 
   
  if ((i <= width/2-1) && (vuelta)) i=i+1;
  else 
    if (i > width/2-1) {i=i-1; vuelta=false;}
    else
    if (i > 1) {i=i-1;}
    else
      if ((i == 0)|| !(vuelta)) vuelta = true;
  
  
  delay(50);
  
  


  
} 
