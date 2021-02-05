void setup(){
  size(640, 480);
  strokeWeight(4);
  frameRate(120);
  cursor(CROSS);
};

void draw(){
  //noStroke();
  //background(0);
  /*
  ellipse(mouseX, mouseY,100,100);
  for(int i=0;i<50;i=i+4){
    ellipse(100+i*10,100,100,100);
  };
  */
  line(mouseX, mouseY, pmouseX, pmouseY);
};


void mousePressed() {
  loop();      
}

void mouseReleased() {
  noLoop();        
}