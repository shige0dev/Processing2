float x,y,r;

void setup() {
  size(400, 400);
  background(128);
}

void draw() {
    background(128);
  translate(width/2, height/2);
  stroke(255);
  for (float i=0; i<2*PI; i+=0.01) {
    x = map(mouseX,0,width,0,1);
    y = map(mouseY,0,height,0,10);
    r = 1 + x*cos(i*y);
    point(100*sin(i)*r, 100*cos(i)*r);
  }
}
