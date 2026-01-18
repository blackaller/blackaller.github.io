

//by luis blackaller
// mouseclick to change resolution
// press any key to reset contrast

PImage pic1; 


int i = 0;
float var = 0;
int cellSize =1;
boolean vuelta = true;
float r, g, b;
int w = 200;

int[][]punto = new int[w][w]; 
float[][] rojos= new float [w][w];
float[][] verdes= new float [w][w];
float[][] azules= new float [w][w];

 

 
 



 
void setup() { 
  size(200, 200);
  ellipseMode(CENTER_RADIUS);
  noStroke();
  
  
 
  pic1 = loadImage("imageTest_7.tga"); 
  image(pic1, 0, 0,width,height); 
  for(int i=0;i<width;i++){
    for(int j=0;j<width;j++){
  
      punto[i][j]= pic1.pixels[i*width + j];
    }
  }
  
  
   for( int i =0; i<width;i++  ){
     for( int j =0; j < width;j++  ){
          rojos[i][j] = red(punto[j][i]);
          verdes[i][j] = green(punto[j][i]);
          azules [i][j] = blue(punto[j][i]);
     }
   }  
} 
 
void draw() { 

 for( int i =0; i<width;i++  ){
     for( int j =0; j < width;j++  ){
         if (cellSize==0){  cellSize =1;  }
             if((i % cellSize == 0)  &&  (j % cellSize == 0)){
                if((rojos[i][j]< 120) && (rojos[i][j]< 120) && (rojos[i][j]< 120)){
                    stroke(rojos[i][j]-var/2,verdes[i][j]-var/2,azules[i][j]-var/2);
                    fill(rojos[i][j]-var/2,verdes[i][j]-var/2,azules[i][j]-var/2);
                }
                else{
                    stroke(rojos[i][j]+var*2,verdes[i][j]+var*2,azules[i][j]+var*2);
                    fill(rojos[i][j]+var*2,verdes[i][j]+var*2,azules[i][j]+var*2);
                }
                float r = random(0.5f,1);
                // float r = 1;
                ellipse(i, j, cellSize*r, cellSize*r);
             }
      }
  }  
  
  delay(500);
  if (var<255) var = var+5;
} 





void mousePressed(){
  cellSize = (cellSize + 5) % 19;
}

void keyPressed(){
  var = 0; 
}
