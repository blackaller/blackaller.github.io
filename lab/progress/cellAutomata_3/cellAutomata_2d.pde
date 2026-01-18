// one dimensional cellular automata that resembles the sierpinski gasket
// simple feedback system
// based on the rule of two neighbours: if we all agree we turn orange, if someone doesn't we turn black
// By blackaller


// Created October 29 2005





int gridsize = 2, numcells = 400, W = numcells * gridsize;
int i = 0;
int j = 0;
boolean transparente = true;



boolean[] past = new boolean[numcells];
boolean[] present = new boolean[numcells];

 
void setup()
{
  size(800, 800);
  background(0);
  noStroke();
  
  
  
  for (int i = 0; i < present.length; i++){
    past[i] = false;
    if ( (i != 398 )  )present[i] = false;
    else present[i] = true;
    println(i + ": " + past[i] + " " + present[i]);
    
  
    
    
    
  
  }
  

}

void mousePressed(){
 int randomInit = int(random(0,numcells - 1));

  background(0);
  i = 0;
  j = 0;
 
  makeAllFalse(past);
  reset(present,randomInit);

}

void keyPressed(){

  transparente = !transparente;
  
 }

void draw(){
  
  
  
  
 
 displayRow( present,j,transparente);
 
 
 
 for(int i = 0; i < numcells; i++){
     past[i] = present[i];
     
    
     
     if ( past[i] == past[ (i+1) % (numcells-1) ] == past[ (i+2) % (numcells-1) ]) 
       present[i] =true ;
     else 
       present[i] =false;
     
     
     
 }

   
  delay(20);
 
  
  
  j = (j+1) % numcells;
 
  
}

void displayRow (boolean array[], int column, boolean transparency){
  int maketransparent;

  for(int i = 0; i < array.length; i++){
    
    if (transparency) maketransparent = 50 + i/2;
    else maketransparent = 255;
  
     noStroke();
   
    if (array[i]) {fill(255,20,30,maketransparent);}
    else {fill(0,maketransparent);  }
    rect(i*(width/array.length), column*(width/array.length), (width/array.length), (width/array.length));   
  }

}


void reset(boolean array[], int numtrue){

   for (int i = 0; i < array.length; i++){
    //past[i] = false;
    if ( (i != numtrue )  )array[i] = false;
    else array[i] = true;
     }
}

void makeAllFalse(boolean array[]){

   for (int i = 0; i < array.length; i++){
    array[i] = false;    
     }
}

void makeAllTrue(boolean array[]){

   for (int i = 0; i < array.length; i++){
    array[i] = true;    
     }
}











