PShape s;
float rotX,rotY;

void setup() {
  size(600, 600, P3D);
  //fullScreen(P3D);
  frameRate(30);
  s = loadShape("prj20171217b.obj");
  s.translate(0,-20,0);
  s.scale(2.2);
  smooth();
  lights();
  //blendMode(ADD);
}

void draw() {
    background(0);

    pushMatrix(); 
    //s.scale(mouseX,mouseX,mouseX);
    //rotateY(radians(rotX));
    //translate(width/2, height/2);
    translate(mouseX,mouseY);
    rotateX(radians(rotY));
    rotateY(radians(rotX));
    shape(s,0,0);
   //box(100,100,100);
    popMatrix();

  //rotX =rotX + 10;
  rotY =rotY + 2;
}