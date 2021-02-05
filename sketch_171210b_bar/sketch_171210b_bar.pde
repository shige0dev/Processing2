  int num = 500;
  float[] x = new float[num];  
  float[] r = new float[num];
  
void setup(){
  fullScreen();
//  size(400,400);
  stroke(255,255,255,10);
  strokeWeight(2); 
  frameRate(30);
  background(0);
  for(int i=0;i < num;i++){
      x[i] = random(-width/2,width/2);
      r[i] = random(1,4); 
  }
}

void draw(){
  fill(0,200);
  rect(0, 0, width, height);

  translate(width/2,height/2);
  //fill(255,0,0,250);
  for(int i=0;i < num;i++){

    x[i] = x[i] + random(-5,5);
    //y[i] = y[i] + random(-5,5);
    r[i] = random(1,3);
    
    pushMatrix();  
      translate(x[i],0);
      //ellipse(0,0,100,100);
      strokeWeight(r[i]); 
      line(0,-100,0,100);
    popMatrix();
}
  
}