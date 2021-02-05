  int num = 2000;
  float[] x = new float[num];  
  float[] y = new float[num];  
  
void setup(){
  fullScreen();
//  size(400,400);
  noStroke(); 
  frameRate(60);
  background(0);
  //Pimage img = createImage(width,height,ARGB)
  //colorMode(HSB);
  //fill(255,0,0);
  //ellipse(100,100,100,100);
  for(int i=0;i < num;i++){
      x[i] = random(-width/2,width/2);
      y[i] = random(-height/2,height/2);
  }
}

void draw(){
  fill(0,2);
  rect(0, 0, width, height);

  translate(width/2,height/2);
  fill(255,0,0,10);
  for(int i=0;i < num;i++){
    x[i] = x[i] + random(-5,5);y[i] = y[i] + random(-5,5);
      ellipse(x[i],y[i],30,30);
  }
  
}