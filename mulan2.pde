void setup(){
  size(800,800);
background(0,0,0);
for(int i = 0;i < 100; i ++){
  drawShape(int(random(width)), int(random(width)),int(random(1,20)));
}
}

void drawShape(int posX,int posY,int sideLength){
noStroke();
fill(255,255,255);
ellipse(posX,posY,sideLength,sideLength);

rectMode(CENTER);
rect(posX,posY,2*sideLength,sideLength/5);
rect(posX,posY,sideLength/5,2*sideLength);
}
