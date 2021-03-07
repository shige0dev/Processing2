/**
* Minim Sound Wave
*
* @author aa_debdeb
* @date 2015/12/04
*/

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;
Oscil wave;
float[] array;
Wavetable table;

void setup(){
  size(512, 200);
  minim = new Minim(this);
  out = minim.getLineOut();
  table = Waves.SINE;
  wave = new Oscil(440, 0.5, table);
  wave.patch(out);
}

void draw(){
  background(255);

  stroke(255, 0, 0);
  strokeWeight(3);
  noFill();
  beginShape();
  float[] array = table.getWaveform();
  for(int i = 0; i < array.length; i++){
    vertex(map(i,0,array.length,0,width), height / 2 - array[i]* 100);
  }
  endShape();
  
  stroke(0);
  strokeWeight(1);
  noFill();
  beginShape();
  for(int i = 0; i < out.bufferSize(); i++){
    vertex(i, height / 2 + out.mix.get(i) * 100);
  }
  endShape();
  

}

void mouseMoved(){
  wave.setAmplitude(0.5);
  float freq = map(mouseX, 0, width, 100, 1500);
  wave.setFrequency(freq);
}

void mousePressed(){
  saveFrame("images/image.jpg");
}

void keyPressed(){
  switch(key){
    case '1':
      wave.setWaveform(Waves.SINE);
      break;
    case '2':
      wave.setWaveform(Waves.TRIANGLE);
      break;
    case '3':
      wave.setWaveform(Waves.SAW);
      break;
    case '4':
      wave.setWaveform(Waves.SQUARE);
      break;
    case '5':
      wave.setWaveform(Waves.QUARTERPULSE);
      break;
    case '6':
      wave.setWaveform(Waves.PHASOR);
      break;
    case '7':
      array = new float[]{-1.0,-1.0,1.0,1.0};
      table = new Wavetable(array);    
      wave.setWaveform(table);
      break;
    case '8':
      array = new float[]{1.0,-1.0,1.0, -1.0};
      table = new Wavetable(array);
      wave.setWaveform(table);
      break;      
  }
}
