// scroll.



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




void setup(){
  size(400,400);
  background(255,20,30);
  // framerate(24);
  noStroke();
  
  
  font = loadFont("Monaco-24.vlw"); 
  textFont(font, 8); 
  
  book = loadBytes("alice.txt"); 
  

  
   println(book.length); // book.length = 1221069

  
}

void keyPressed(){
  eleccion = (eleccion+1) %5;
  
  if(eleccion == 1)letrasElegidas ="\r\t- \n";
  else if(eleccion == 2)letrasElegidas ="bcdfg";
       else if(eleccion == 3)letrasElegidas ="pqrst";
            else if(eleccion == 4)letrasElegidas ="jklmn";
                 else if(eleccion == 0)letrasElegidas ="aeiou";



}



void mousePressed(){

  if(!arranque) arranque = true;
  else noLoop();

}
void mouseReleased(){
  loop();
}







void draw(){
  background(255,20,30);
    

  
  
  for (int i = 0; i < H/20; i++){ // i is height
  
  
     for(int j = 0; j< W/10;j++){ // j  is width
     
     
     if(  (j+Wentre10*i) >  book.length) break; // le paramos al final del archivo
     
     
     
     
     fill(agris);
     if(char(book[j+(40*i)+aLine]) == letrasElegidas.charAt(0)) rect( j*10, (20*(i) % H)-aPixel,10,10); 
     
     fill(egris);
     if(char(book[j+(40*i)+aLine]) == letrasElegidas.charAt(1)) rect( j*10, (20*(i) % H)-aPixel,10,10); 
     
     fill(igris);
     if(char(book[j+(40*i)+aLine]) == letrasElegidas.charAt(2)) rect( j*10, (20*(i) % H)-aPixel,10,10);
     
     fill(ogris);
     if(char(book[j+(40*i)+aLine]) == letrasElegidas.charAt(3)) rect( j*10, (20*(i) % H)-aPixel,10,10);
     
     fill(ugris);
     if( char(book[j+(40*i)+aLine]) == letrasElegidas.charAt(4) ) rect( j*10, (20*(i) % H)-aPixel,10,10); 
     
     fill(0);
     
     
          
     if    (  char(book[j+(40*i)+aLine]) != letrasElegidas.charAt(0)
           && char(book[j+(40*i)+aLine]) != letrasElegidas.charAt(1)  
           && char(book[j+(40*i)+aLine]) != letrasElegidas.charAt(2)
           && char(book[j+(40*i)+aLine]) != letrasElegidas.charAt(3)  
           && char(book[j+(40*i)+aLine]) != letrasElegidas.charAt(4)  )

          text(char(book[j+(40*i)+aLine]), 2+j*10, ((20*(i+1)) % H)-10-aPixel ); // trasladar la distancia deseada menos el tama–o de la letra   
     
     
         // print(char(book[j+(40*i)+aLine]));
     
          
   }
  
  
  
  
  
  
  
  }
  
  if(arranque){
  
    aPixel =(aPixel +1) % 20;
  
    if(aPixel == 0 % 20) aLine = aLine+40;
  }
  
  

}
