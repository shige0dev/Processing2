PImage offscreen;

float[] waveshape;
final int SAMPLE_RATE = 48000;
Timber timber1,timber2,timber3;

//EG パラメータ
float[] delay_time    ={ 0.0, 0.0, 0.0};
float[] attack_time   ={ 1.0, 20.0, 5.0};
float[] decay_time    ={ 10.0, 5.0, 1.0}; 
float[] sustain_level ={ 0.8, 0.4, 0.2};
float[] release_time  ={ 1.0, 1.0, 20.0};
 
float sound_val = 0;


void setup(){
  frameRate(60);
  size(512,256);
  background(128);
  color(256);
  offscreen = createImage(width, height, RGB);
   
   
  //wavetable 定義
  waveshape = new float[SAMPLE_RATE];
  for(int i=0; i<SAMPLE_RATE;i++){
    waveshape[i]= sin(2*PI/SAMPLE_RATE*i);
  //  println(i);
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
  
  //point(width-10, sound_val + height/2 );
  stroke(255,0,0);
  point(width-10, timber1.adsr0.val * (-50) +   height/4 );
  stroke(0,255,0);
  point(width-10, timber1.adsr1.val * (-50) + 2*height/4 );
  stroke(0,0,255);
  point(width-10, timber1.adsr2.val * (-50) + 3*height/4 );
  
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
  
   timber1.gate_on(int(key));

   //if(timber1.gate_on(int(key))){
   //}else if(timber2.gate_on(int(key()){
   //}else if(timber3.gate_on(int(key()){
   //}
}

void keyReleased(){
  timber1.gate_off(int(key));
  //timber2.gate_off(int(key));
  //timber3.gate_off(int(key));
}
