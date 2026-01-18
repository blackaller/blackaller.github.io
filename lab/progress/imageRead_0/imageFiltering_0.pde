//by luis blackaller


PImage pic1; 


int halfImage; 
int i = 1, j,k;
float var = 0;
int imgCenter, imgNorth, imgSouth, imgWest, imgEast;
boolean vuelta = true;
int voltear=1;
color[] temp ; 


 
void setup() { 
  size(200,200);
  halfImage = width*height/4; 
  j = i+2*width;
  k = i+4*width;
  imgCenter= (width*height-width)/2 -1;
   
  
 
  pic1 = loadImage("imageTest_7.tga"); 
  image(pic1, 0, 0,width,height); 
  temp = new color[width*height];
  
  
  
  
  
  
  
    for(int i=0;i<width*height;i++){
    
       if ( floor(i/(width)) % 2 == 0){
         temp[i] = pic1.pixels[  i ];
         //println ( i + ": " + floor(i/(width-1))%2  );
       }
       else{
         temp[i] = pic1.pixels[  ( (floor(i/(width))*width)  +    ((width-1) - i%(width)) )  ]; // esto parece voltear efectivamente un renglon
       //println ( i + ": " +     (floor(i/(width))*width +    ((width-1) - i%(width)) )                    );
        }
   
    } 
  //noLoop(); 
  
  
  
  
  
  
} 
 
void draw() { 
 
    loadPixels();
  
   //for(int j = 0; j <  width; j++){
   //pixels[ (i*j+i) % (  width*height-1  )] = pixels[  ( (  width*height/2-1  ) +i+j*i  ) % (  width*height-1  )];}

   //println ( i + ": " + floor(i/(width-1))%2  );
    
    
   if ( !(floor(i/(width)) % 2 == 0))  {
    
       //for( int j =0; j < height; j++){ 
          
    
         pixels[i] = temp[i];
          // pixels[i+ (j*width % height)] = temp[i+ (j* width % height)];
         //pixels[i+ (j*width % height)] = temp[0];
       
       //}
    }

   //if ( i % width == 190) println ( i + ": " +     (floor(i/(width))*width +    ((width-1) - i%(width)) )                    );

   
   /*if ((i % 4) == 0)
      {for(int k = 0; k<= i; k++)
      pixels[  (imgCenter+ (k)) % (width*height-1) ] = pixels[k]; delay(10);}
   else //if ((i % 4) == 1)
           {for(int k = 0; k<= i; k++)
           pixels[ abs((imgCenter -  k*(width-1) -k )) % (width*height-1)] = pixels[k];delay(10);}
        //else if ((i % 4) == 2)
                 //{pixels[  abs((imgCenter- (i))) % (width*height-1) ] = pixels[i];delay(10);}
             //else if ((i % 4) == 3)
                     //{pixels[ (imgCenter + i*(width-1) +i) % (width*height-1)] = pixels[i];delay(10);}*/
         
          
           
             
 
  updatePixels(); 
  
 
  if (i<width*height) {i = i+1; }
  else i = 0;
  
} 
