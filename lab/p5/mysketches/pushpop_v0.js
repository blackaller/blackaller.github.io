// simple pushpop 2006
// by blackaller

let value = true;

function setup() {
    createCanvas(400, 400);
    fill(255); // Processing color literal
    noStroke();
    i=0;
    frameRate(30);
}

function draw() {
    background(0);
    
        translate(width/2,width/2);

        for( j = 1; j < 50; j = j+1){
            push();
            if (j % 2==1)
                rotate((i*j)/10);
            else
                rotate(-(i*j)/11);
            translate(-0.31*(width/(j)),-0.31*(width/(j)));
            if (j % 2==1)
                fill(255);
            else
                fill(0);
            ellipse(0,0,width/(1*j),width/(1*j));
            pop();
        }
    if (value){
        i = i+0.05;
    }
}

function mousePressed() {
    value = !(value);
}