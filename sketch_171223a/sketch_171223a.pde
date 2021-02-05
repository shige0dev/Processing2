int num =100;
Spot[] spots = new Spot[num];

void setup(){
  size(640,480);
//  fullScreen();
  background(0);
  smooth();
  noStroke();
  blendMode(ADD);
  colorMode(RGB);
  frameRate(120);
  for (int i=0;i<num;i++){
  spots[i] = new Spot(random(1)*width, random(1)*height);
  spots[i].setVelocity(random(-10,10), random(-10,10));
  }
}

void draw() {
 //background(0,2);
//  fill(0,20);
//  rect(0,0,width,height,20);
  fill(255,10);
  for (int i=0;i<num;i++){
 spots[i].move();
 spots[i].display();
  }
    for (int i=0;i<num-1;i++){
    spots[i].setVelocity((spots[i+1].x-spots[i].x)/100, (spots[i+1].y-spots[i].y)/100);
  }
   spots[num-1].setVelocity((spots[0].x-spots[num-1].x)/100, (spots[0].y-spots[num-1].y)/100);

}

void mouseClicked(){
  for (int i=0;i<num-1;i++){
    spots[i].setVelocity(spots[i+1].x-spots[i].x, spots[i+1].y-spots[i].y);
  } 
}  
  

class Spot {
 float x,y,vx,vy;
 float diameter = 5;
 float direction,velocity;
 
   Spot(float _x,float _y){
    x = _x;
    y = _y;
    vx = 0;
    vy = 0;
   }
   
   void setVelocity(float _vx,float _vy){
     vx = _vx;
     vy = _vy;
   }
   
  void move() {
   x += vx;
   y += vy;
  }
 
   void display() {
    ellipse(x, y, diameter, diameter);
  }
  
}