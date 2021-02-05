/**
* ADSR for tone player
*
* @author aa_debdeb
* date 2016/05/28
*/

import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioOutput out;
float attTime;
float relTime;

void setup(){
  size(512, 200);
  minim = new Minim(this);
  out = minim.getLineOut();
  attTime = 0.01;
  relTime = 0.01;
}

void draw(){
  background(0);
  stroke(255);
  for(int i = 0; i < out.bufferSize() - 1; i++){
    line(i, 50 + out.left.get(i) * 50, i + 1, 50 + out.left.get(i + 1) * 50);
    line(i, 150 + out.right.get(i) * 50, i + 1, 150 + out.right.get(i + 1) * 50);
  }
}

void mouseMoved(){
  attTime = map(mouseX, 0, width, 0.001, 2.0);
  relTime = map(mouseY, 0, height, 0.001, 2.0);
}

void keyPressed(){
  switch(key){
    case 'a':
      out.playNote(0.0, 0.3, new ToneInstrument(Frequency.ofPitch("C4"), 0.5)); 
      break;
    case 's':
      out.playNote(0.0, 0.3, new ToneInstrument(Frequency.ofPitch("D4"), 0.5)); 
      break;
    case 'd':
      out.playNote(0.0, 0.3, new ToneInstrument(Frequency.ofPitch("E4"), 0.5)); 
      break;
    case 'f':
      out.playNote(0.0, 0.3, new ToneInstrument(Frequency.ofPitch("F4"), 0.5)); 
      break;
    case 'g':
      out.playNote(0.0, 0.3, new ToneInstrument(Frequency.ofPitch("G4"), 0.5)); 
      break;
    case 'h':
      out.playNote(0.0, 0.3, new ToneInstrument(Frequency.ofPitch("A4"), 0.5)); 
      break;
    case 'j':
      out.playNote(0.0, 0.3, new ToneInstrument(Frequency.ofPitch("B4"), 0.5)); 
      break;     
    case 'k':
      out.playNote(0.0, 0.3, new ToneInstrument(Frequency.ofPitch("C5"), 0.5)); 
      break;   
  }
}

class ToneInstrument implements Instrument {
  
  Oscil osc;
  ADSR adsr;
  
  ToneInstrument(Frequency frequency, float amplitude){
    osc = new Oscil(frequency, amplitude,  Waves.TRIANGLE);
    adsr = new ADSR(0.5, attTime, 0.1, 0.3, relTime);
    osc.patch(adsr);
  }
  
  void noteOn(float dur){
    adsr.noteOn();
    adsr.patch(out);
  }
  
  void noteOff(){
    adsr.unpatchAfterRelease(out);
    adsr.noteOff();
  }
  
}
