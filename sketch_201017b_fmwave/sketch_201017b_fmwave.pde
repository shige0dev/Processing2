float[]  buffer;
float[]  waveshape;
float phase=0;
final int SAMPLE_RATE = 480;
final int BUFFER_LENGTH = 512;
int counter = 0;
float LEVEL_A=1,OCT_A=1;
float LEVEL_B=1,OCT_B=1;


void setup(){
  frameRate(120);
  size(512,256);
  background(128);
      color(256);
      
  //buffer 確保    
  buffer = new float[BUFFER_LENGTH];
  
  //wavetable 定義
  waveshape = new float[SAMPLE_RATE];
  for(int i=0; i<SAMPLE_RATE;i++){
    waveshape[i]= sin(2*PI/SAMPLE_RATE*i);
    println(i);
  }
 println("Definition finished");
}


void draw(){
  background(128);
  phase += 1;
  //バッファ更新
  buffer[ counter%BUFFER_LENGTH ] = 100*LEVEL_A* fm( OCT_A*phase+ SAMPLE_RATE*LEVEL_B*fm( OCT_B*phase));
  //buffer[counter%BUFFER_LENGTH] = random(1);
  
  //Draw
  for(int i=0; i<BUFFER_LENGTH; i++){
   line(i, buffer[(i+counter)%BUFFER_LENGTH] +height/2, i+1, buffer[(i+counter+1)%BUFFER_LENGTH] +height/2);
  }
  text( str(phase), 100,100);
  text( str(counter), 100,120);
  counter +=1;
}


//float fm(float x){
// return sin(x);
//}


float fm(float x){
  int index;
  index = int(x) % SAMPLE_RATE;
  //if(index <0){index = 0;}
  return waveshape[index];
}
