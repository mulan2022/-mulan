PImage img;
void setup(){
  size(640,614);
  img=loadImage("fangao.jpg");
  background(0);
}
void draw(){
  int x=int(random(img.width));
   int y=int(random(img.height));
   int loc=x+y*img.width;
   img.loadPixels();
   float r=red(img.pixels[loc]);
   float g=green(img.pixels[loc]);
   float b=blue(img.pixels[loc]);
   noStroke();
   fill(r,g,b,100);
   rect(x,y,10,random(10,80));
}
