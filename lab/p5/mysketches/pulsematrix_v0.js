// by blackaller 2005

let value = true;

function setup()
{
  createCanvas(400, 400);
  frameRate(30);
  noStroke();
  k = 4;
  a =0.01;
}

function draw(){
  background(0);
  translate(width/2, height/2);
  for ( i = 0; i < 1+width/(k*2); i++){
    for ( j = 0; j < 1+width/(k*2); j++){
      if(false)
        fill((sq(i)+sq(j)+j*i)*a  % 255, 20, 30);
      else
        fill((sq(i)*a+sq(j)*a)*a  % 255);
      rect(i*k,j*k,k,k);
      rect(-i*k,j*k,k,k);
      rect(i*k,-j*k,k,k);
      rect(-i*k,-j*k,k,k);
     }
   }
  if (value){
    a = a+0.005;
  }
  
}

function mousePressed() {
    value = !(value);
}