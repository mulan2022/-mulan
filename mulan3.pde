void setup(){
  size(800,800);
  background(255);
    for(int i = 0;i <5; i ++){
      float a=random(800);
line(a,800,a,0);
strokeWeight(random(5,30));
float b=random(800);
line(800,b,0,b);
strokeWeight(random(5,30));
}
for(int i = 0;i <4; i ++){
  rectMode(CENTER);
  rect(random(800),random(800),random(50,300),random(50,300));
  fill(0,0,255);
    rect(random(800),random(800),random(50,300),random(50,300));
    fill(255,255,0);
      rect(random(800),random(800),random(50,300),random(50,200));
      fill(255,0,0);
}
  }
