import processing.core.*; import java.applet.*; import java.awt.*; import java.awt.image.*; import java.awt.event.*; import java.io.*; import java.net.*; import java.text.*; import java.util.*; import java.util.zip.*; public class cellAutomata_2b extends PApplet {// one dimensional cellular automata that resembles the sierpinski gasket
// simple feedback system
// based on the rule of two neighbours: if we all agree we turn orange, if someone doesn't we turn black
// By blackaller


// Created October 29 2005





int gridsize = 4, numcells = 100, W = numcells * gridsize;
int i = 0;
int j = 0;
boolean transparente = true;


//boolean past =[];
//boolean present[];
boolean[] past = new boolean[numcells];
boolean[] present = new boolean[numcells];

 
public void setup()
{
  size(400, 400);
  background(0);
  
  
  
  for (int i = 0; i < present.length; i++){
    past[i] = false;
    if ( (i != 55 )  )present[i] = false;
    else present[i] = true;
    println(i + ": " + past[i] + " " + present[i]);
    
    // see if arrays are ok
    /*if (present[i]) fill(255);
    else fill(0);  
    rect(i*(width/present.length), 0*(width/present.length), (width/present.length), (width/present.length));  
    
    if (past[i]) fill(255);
    else fill(0);  
    rect(i*(width/past.length), 1*(width/past.length), (width/past.length), (width/past.length)); 
    */
    
    
    
  
  }
  

}

public void mousePressed(){
 int randomInit = PApplet.toInt(random(0,numcells - 1));

  background(0);
  i = 0;
  j = 0;
 
  makeAllFalse(past);
  reset(present,randomInit);

}

public void keyPressed(){
  //background(0);
  transparente = !transparente;
  //i = 0;
  //j = 0;
  //makeAllFalse(past);
  //reset(present,55);
  
 }

public void draw(){
  //fill(0,1);
  //stroke(0 );
  //rect(-1, -1, width + 1, height + 1);
  
  
  
 
 displayRow( present,j,transparente);
 
 
 
 for(int i = 0; i < numcells; i++){
     past[i] = present[i];
     
     // present[i] = past[ (i+2) % (numcells - 1) ]|| !past[i] && past[ (i+1) % (numcells-1) ]; // this is one set of rules. gives nothing
     //present[i] = !past[i] && past[ (i+1) % (numcells-1) ]; // this is one set of rules. gives nothing
     
     if ( past[i] == past[ (i+1) % (numcells-1) ] == past[ (i+2) % (numcells-1) ]) 
       present[i] =true ;
     else 
       present[i] =false;
     
     
     
 }
 //displayRow( past,j+1);
 
 


  /*for(int i = 0; i < numcells; i++){
  
      
     if ( (i==j) || (j == numcells-i) || (i == numcells/2) || (j == numcells/2))fill(0);
     else fill(255);
 
     rect(i*gridsize, j*gridsize, gridsize, gridsize);
   }*/
   
   
  delay(20);
 
  
  
  j = (j+1) % numcells;
 
  
}

public void displayRow (boolean array[], int column, boolean transparency){
  int maketransparent;

  for(int i = 0; i < array.length; i++){
    
    if (transparency) maketransparent = 2*i+50;
    else maketransparent = 255;
  
  
    //println (array[i]);
    if (array[i]) {fill(255,20,30,maketransparent); stroke(0);}
    else {fill(0,maketransparent);  }
    rect(i*(width/array.length), column*(width/array.length), (width/array.length), (width/array.length));   
  }

}


public void reset(boolean array[], int numtrue){

   for (int i = 0; i < array.length; i++){
    //past[i] = false;
    if ( (i != numtrue )  )array[i] = false;
    else array[i] = true;
     }
}

public void makeAllFalse(boolean array[]){

   for (int i = 0; i < array.length; i++){
    array[i] = false;    
     }
}

public void makeAllTrue(boolean array[]){

   for (int i = 0; i < array.length; i++){
    array[i] = true;    
     }
}











}