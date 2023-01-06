void setup(){
  size(1000,1000);
  smooth();
}
void draw(){
  background(255);
  translate(width/2,height);
  branch(0);
}
void branch(int level){
  line(0,0,0,-100);
  translate(0,-100);
  level++;
  if(level<10){
    pushMatrix();
    rotate(PI/6);
    branch(level);
    popMatrix();
    pushMatrix();
    rotate(-PI/6);
    branch(level);
    popMatrix();
  }
}
