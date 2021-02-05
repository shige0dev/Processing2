  int num = 2000;
  float[] x = new float[num];  
  float[] y = new float[num];
  float[] r = new float[num];
  
void setup(){
  fullScreen(2);
//  size(400,400);
  stroke(255,255,255,20);
  strokeWeight(2); 
  frameRate(30);
  background(0);
  //Pimage img = createImage(width,height,ARGB)
  //colorMode(HSB);
  //fill(255,0,0);
  //ellipse(100,100,100,100);
  for(int i=0;i < num;i++){
      x[i] = random(-width/2,width/2);
      y[i] = random(-height/2,height/2);
      r[i] = random(0,6.28); 
  }
}

void draw(){
  fill(0,50);
  rect(0, 0, width, height);

  translate(width/2,height/2);
  //fill(255,0,0,250);
  for(int i=0;i < num;i++){

    //x[i] = x[i] + random(-5,5);
    //y[i] = y[i] + random(-5,5);
    r[i] = r[i] + random(0,.1);

  pushMatrix();  
      translate(x[i],y[i]);
      rotate(r[i]);
      //ellipse(0,0,100,100);
      line(-100,0,100,0);
    popMatrix();
}
  
}