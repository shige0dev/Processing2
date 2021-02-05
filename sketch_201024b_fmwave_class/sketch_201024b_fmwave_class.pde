PImage offscreen;

float[] waveshape;
final int SAMPLE_RATE = 48000;

Timber timber1,timber2,timber3;
ADSR adsr1,adsr2,adsr3;

float sound_val = 0;


void setup(){
  frameRate(240);
  size(512,256);
  background(128);
  color(256);
  offscreen = createImage(width, height, RGB);
   
   
  //wavetable 定義
  waveshape = new float[SAMPLE_RATE];
  for(int i=0; i<SAMPLE_RATE;i++){
    waveshape[i]= sin(2*PI/SAMPLE_RATE*i);
    println(i);
  }
 println("Definition finished");
 
 //ティンバー生成
 timber1 = new Timber(100.0);
 //timber2 = new Timber(270.0);
 //timber3 = new Timber(400.0); 
 
}


void draw(){
  //mouse value
  timber1.LEVEL_B = float(mouseY)/height; 
  
  //sound refresh
  sound_val  = timber1.update();
  //sound_val += timber2.update();
  //sound_val += timber3.update();
  //sound_val /=3;
  
  //Draw  
  background(128);
  image(offscreen, -1,0, width, height); 
  
  point(width-10, sound_val + height/2 );
  point(width-10, adsr1.val * (-50) + height/2 );
//  point(width-10, adsr2.val * (-50) + 2*height/4 );
//  point(width-10, adsr3.val * (-50) + 3*height/4 );
  
  loadPixels();
  offscreen.pixels = pixels;
  offscreen.updatePixels();  
}


float fm_calc(float x){
  int index;
  index = int(x) % SAMPLE_RATE;
  if(index <0){index = 0;}
  return waveshape[index];
}


void keyPressed(){
  //if(timber1.time == 0){
  //  timber1.start(int(key));
  //}else if(timber2.time == 0) {
  //  timber2.start(int(key));
  //}else if(timber3.time == 0) {
  //  timber3.start(int(key));
  //}
  if( timber1.isBusy() == false){
  timber1.trigger_on(int(key));
  }
}

void keyReleased(){
  //if(timber1.tone == int(key)) timber1.key_on = false;
  //if(timber2.tone == int(key)) timber2.key_on = false; 
  //if(timber3.tone == int(key)) timber3.key_on = false;
  timber1.trigger_off();
}
