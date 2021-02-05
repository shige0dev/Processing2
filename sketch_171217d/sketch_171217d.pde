void setup() {
  size(900, 300, P3D);
  background(0);
  noStroke();

}

void draw() {
  // Include lights() at the beginning
  // of draw() to keep them persistent 
  //lights();
  lights();
  pointLight(51, 102, 126, mouseX, mouseY, 36);
  translate(width/2,height/2,0);
  textSize(100);
    text("test",-100,0,0);
  translate(-100, 0, 0);
  shininess(5.0);
  sphere(30);
  translate(100, 0, 0);
  pushMatrix();
  rotateY(radians(45));
  rotateX(radians(45));
  box(30,30,30);
  popMatrix();
  translate(100,0,0);
  shininess(1.0);
  sphere(30);  
}