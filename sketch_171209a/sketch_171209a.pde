  int num = 100;
  float[] x = new float[num];  
  float[] y = new float[num];  
  
void setup(){
  size(400,400);
  noStroke(); 
  frameRate(30);
  background(0);
  //Pimage img = createImage(width,height,ARGB)
  //colorMode(HSB);
  //fill(255,0,0);
  //ellipse(100,100,100,100);
}

void draw(){
  fill(0,2);
  rect(0, 0, width, height);
    fill(255,0,0);
  //ellipse(mouseX,mouseY,100,100);  
  
  translate(width/2,height/2);
  for(int i=0;i < num;i++){
      x[i] = x[i] + random(-5,5);y[i] = y[i] + random(-5,5);
      ellipse(x[i],y[i],30,30);
  }
  
}