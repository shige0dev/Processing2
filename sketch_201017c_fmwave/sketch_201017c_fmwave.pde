float[] waveshape;
float[] sound;
float[] phase;
float[] freq;

final int SAMPLE_RATE = 480;
int counter = 0;
float LEVEL_A=1,OCT_A=1;
float LEVEL_B=0.1,OCT_B=2;
float CV=0;



PImage offscreen;


void setup(){
  frameRate(240);
  size(1024,256);
  background(128);
  color(256);
  
  //wavetable 定義
  waveshape = new float[SAMPLE_RATE];
  for(int i=0; i<SAMPLE_RATE;i++){
    waveshape[i]= sin(2*PI/SAMPLE_RATE*i);
    println(i);
  }
 println("Definition finished");
 
   sound = new float[8];
   phase = new float[8];
   freq  = new float[8];
   freq[0] = 2;
   freq[1] = 3;
 offscreen = createImage(width, height, RGB);
}


void draw(){
  phase[0] += freq[0];
  phase[1] += freq[1];

  //バッファ更新
  sound[0] = 100*LEVEL_A* fm( OCT_A*phase[0]+ SAMPLE_RATE*CV*LEVEL_B*fm( OCT_B*phase[0]));
  sound[1] = 100*LEVEL_A* fm( OCT_A*phase[1]+ SAMPLE_RATE*CV*LEVEL_B*fm( OCT_B*phase[1]));  
  //Draw
    
  background(128);
  image(offscreen, -1,0, width, height); 
  
  point(width-10, sound[0] + height/2 );
  point(width-10, sound[1] + height/2 );
  point(width-10, sound[2] + height/2 );
  point(width-10, sound[3] + height/2 );
  point(width-10, -CV*100 + height/2 );
  
  loadPixels();
  offscreen.pixels = pixels;
  offscreen.updatePixels();  


  if(mousePressed){
    CV +=0.005;
    CV=min(CV,1);
  }else{
    CV -=0.01;
    CV=max(CV,0);
  }
  
  text( str(phase[0]), 100,100);
  text( str(counter), 100,120);
  text( str(CV), 100,140); 
  counter +=1;
}


//float fm(float x){
// return sin(x);
//}


float fm(float x){
  int index;
  index = int(x) % SAMPLE_RATE;
  if(index <0){index = 0;}
  return waveshape[index];
}

//void mousePressed(){
// float p_phase=phase;
// CV= min((phase-p_phase)/100,1);
//}

//void mouseReleased(){
// CV=0;
//}
