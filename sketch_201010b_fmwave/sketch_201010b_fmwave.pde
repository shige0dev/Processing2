float[]  buffer;
float phase=0;
final int SAMPLERATE = 48000;

void setup(){
  size(1024,256);
  background(128);
      color(256);
  buffer = new float[512];

}

void draw(){
  background(128);
  phase += 2*PI*mouseY/SAMPLERATE;
  
  //バッファ更新
  for(int i=0; i<512-1; i++){
   buffer[i] = buffer[i+1];
  }
  buffer[511] = fm(phase + float(mouseX) *sin(2*phase) /100 )*100;
  
  //Draw
  for(int i=0; i<512-1; i++){
  // point( i, buffer[i]+height/2);
   line(i, buffer[i]+height/2,i+1, buffer[i+1]+height/2);
  }
}


float fm(float i){
 return sin(i);
}
