// separate bright from dark


// grayscale reordering from dark to bright
//
// 

/*
interesting values:
50%: #808080, #7F7F7F
75%: gray75 #BFBFBF gray76 #C2C2C2 gray77 #C4C4C4 gray78 #C7C7C7
25%: gray22 #383838 gray23 #3B3B3B gray24 #3D3D3D gray25 #404040 gray26 #424242 gray27 #454545 gray28 #474747 gray29 #4A4A4A
*/



//by luis blackaller


//PImage pic1; 
PFont font; 


int white = 0, black = 0;
float averageWhite, averageBlack;

color[] picValues;
int[] order;

int picLength = 112000;


int stepX=0;
int stepY=0;
int numBlack=0;
int numWhite=0;
int numBright=0;
int numDark=0;
int stepW=0;
int stepB=0;

int numSetup=0;
int stepSetup=0;




int imageChoice = int(random(0f,2.99999f));
//int imageChoice = 3;

void setup() {
 
  size(560,400);
  background(255,20,30);

  line(width/2,0,width/2,height);
  ellipseMode(CENTER_RADIUS);
  rectMode(CENTER_RADIUS);
  font = loadFont("Monaco-12.vlw"); 

  
   
  println(imageChoice);
  
  //pic1 = loadImage("image_"+imageChoice+".jpg"); 
  //image(pic1, 0, 0,width/2,height); 
  noLoop();
  
  
   //picValues = new color[pic1.pixels.length];
   //order = new int[pic1.pixels.length];
   picValues = new color[picLength];
   order = new int[picLength];

   
   String toGetColors[] =loadStrings("image_"+imageChoice+".txt");
  
  
  
    for(int i=0;i< picLength;i++){
      
  
        String list[] = split(toGetColors[i], ';');
        picValues[i]=int(list[0]);
        order[i]=int(list[1]);
        
        
      
      noStroke();
      fill(picValues[i]);

      
      rect(width - (numSetup % (width/2)), height - stepSetup,1,1);
      numSetup = numSetup + 1;
      if((numSetup !=0) && (numSetup % (width/2) == 0)) stepSetup = stepSetup+1;
      
        
        
       
     }
      
      

    
    
    
  
} 

void mousePressed(){noLoop();}


void mouseReleased(){
  if(stepX < 111998)loop();
  
  
  }



 
void draw() { 
  //image(pic1, 0, 0,width/2,height);
  

  if(stepX >= 111998){println("*****"+stepX+"*****");  /*image(pic1, 0, 0,width/2,height);*/ noLoop();}
  

  
  
  //fill(picValues[stepX]);
  //noStroke();
  //rect( (order[stepX] % (width/2)), (order[stepX]/(width/2)),1,1);
  
  
  noFill();
  stroke(picValues[stepX]);
  ellipse( (order[stepX] % (width/2)), (order[stepX]/(width/2)),4,4);     
  

  

    
      fill(255,20,30);
      rect(width - (numBlack % (width/2)) , 1+height-stepB,6,2);

      fill(picValues[stepX]);
      rect(width - ((numBlack-2) % (width/2)) + 6,1+ height-stepB,2,2);

      numBlack = numBlack + 1;
      if((numBlack !=0)&&(numBlack % (width/2) == 0))stepB=stepB+1;
      
      
    if( picValues[stepX] >= #808080){ 
      numBright = numBright + 1;
    }
      
      
   if( picValues[stepX] < #808080){ //#808080    
      numDark = numDark + 1;
  }
  
  
  stepX = stepX + 1;
  if((stepX !=0)&&(stepX % (width/2) == 0))stepY=stepY+1;
  
  
 
  
  
    noStroke();
    if(stepX>1){ 
      fill(255);
      rect(17*width/24-18,45,60,25);    
      fill(0);
      textFont(font, 10); 
    
      text("pixel: "+(stepX+1), 14*width/24, 34);
 
    fill(0);
    textFont(font, 10);  
  
      text("bright:"+nfs(float(100*numBright)/float(picLength),2,4)+" %", 14*width/24, 48);  
  
    fill(0);
    textFont(font, 10); 
  
    
    text("dark:"+nfs(float(100*numDark)/float(picLength),2,4)+" %", 14*width/24, 62); 
    }
    
           
             
  
  
    
    stroke(0);
    fill(0);
    rect(width/2,height/2,5,height);
    
    
    //line(width/2+1,0,width/2+1,height);
    //line(width/2+2,0,width/2+2,height);
    //stroke(255,20,30);
    //line(width/2,0,width/2,height);
    
       
} 


int[] ordenadorBrillo2(color[] P){
     int[] orden =  new int[P.length];
     int n = P.length;
     int menor;
     int primero = indexMinC(P);
     
     for(int i = 0; i < P.length; i++){  orden[i]= -1; }
     
     
     println("antes:");
     println("P[0] "+ P[0] + ", "+" P[primero] "+ P[primero] );  // for debugging   

     // ahora si a ordenar
     
     
     
     intercambio(P,0,primero); //parece que funciona
     orden[0]=primero;
     
     
     println("despues:");
     println("P[0] "+ P[0] + ", "+" P[primero] "+ P[primero] );  // for debugging
     
     // ordenacion por seleccion
     for(int i = 1; i < n; i++){
       menor = i; // aparentemente el uso de la variable menor como puente le daba en la madre a todo
       orden[i]=i;
       
       
       for(int j =i+1; j < n; j++){
       
       
         if (  P[j] < P[i]  ) {
            menor = j;
            intercambio(P, j, i);
            orden[i]=j;
            
         }
       
       }
        
     
  
     }
     
     //for(int i = 1; i < n; i++){println("atan("+i+")= " +atan2(  (P[i].y-P[0].y), (P[i].x-P[0].x))+ ", P[" + i +"]= "+ P[i].x+", "+P[i].y);}//debug
     return orden;

}






void ordenadorBrillo(color[] P){
     int n = P.length;
     int menor;
     int primero = indexMinC(P);
     
     
     
     //println("antes:");
     //println("P[0] "+ P[0].x + ", " + P[0].y+" P[primero] "+ P[primero].x +", " + P[primero].y);  // for debugging   

     // ahora si a ordenar
     
     
     
     intercambio(P,0,primero); //parece que funciona
     
     
     
     //println("despues:");
     //println("P[0] "+ P[0].x + ", " + P[0].y+" P[primero] "+ P[primero].x +", " + P[primero].y);  // for debugging   
     
     // ordenaci?n por seleccion
     for(int i = 1; i < n; i++){
       menor = i; // aparentemente el uso de la variable menor como puente le daba en la madre a todo
       
       for(int j =i+1; j < n; j++){
       
       
         if (  P[j] < P[i]  ) {
            menor = j;
            intercambio(P, j, i);
         }
       
       }
        
     
  
     }
     
     //for(int i = 1; i < n; i++){println("atan("+i+")= " +atan2(  (P[i].y-P[0].y), (P[i].x-P[0].x))+ ", P[" + i +"]= "+ P[i].x+", "+P[i].y);}//debug
     

}



int indexMinC (color[] P)
{	int n = P.length, k=0, contador = 0;

	for (int i=0; i< n; i++){

           for (int j=0; j< n; j++) {
           
	     if ( P[i] < P[j] ) contador = contador+1;
             
             
          }
          if (contador < n-1) contador = 0;
          else if (contador == n-1) {k=i;break;}
          
        }
        
       
	return(k); 
}





void intercambio(color[] P, int a, int b){ //este metodo parece que si funciona
  int n = P.length;
  
  if((a < n) && (b < n)){
    color Temp = P[a];
    
    //println("antes");
    //println("P[a] "+ P[a].x + ", " + P[a].y+" P[b] "+ P[b].x +", " + P[b].y+" Temp "+ Temp.x+", "+Temp.y);  // for debugging   
    
    
    P[a] = P[b];
    P[b] = Temp;  
    
    //println("despues");
    //println("P[a] "+ P[a].x + ", " + P[a].y+" P[b] "+ P[b].x +", " + P[b].y+" Temp "+ Temp.x+", "+Temp.y);  // for debugging   
     
       
  }
}
