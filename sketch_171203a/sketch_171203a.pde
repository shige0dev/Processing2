PImage frog;

void setup(){
 size(564,927);
 frog = loadImage("frog.jpg");
}

void draw(){
  background(0);
  loadPixels();
  frog.loadPixels();
  for(int x = 0; x< width; x=x+5 ){
    for(int y = 0; y< height; y=y+5 ){
      int loc = x + y*width;
     //   float r = red(frog.pixels[loc]);
     //   float g = green(frog.pixels[loc]);
     //   float b = blue(frog.pixels[loc]);
     // pixels[loc] = color(r,g,b);
      //if(X>20){
      //  
      //}
      //pixels[loc] = frog.pixels[loc];
      //fill(r,g,b,255);
      //ellipse(x,y,50,50);
      println(x,y);
    }
  }
  updatePixels();
  image(frog, width/2-100, height/2-100, 200, 200);
};